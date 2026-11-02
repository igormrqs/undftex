# Compila e le a selecao auditavel em tests/regressao.json, sem exigir Perl.
param([string[]]$Documentos)
$ErrorActionPreference = 'Stop'
. "$PSScriptRoot/contratos-ci.ps1"
$contrato = Obter-ContratoRegressao
if (-not $PSBoundParameters.ContainsKey('Documentos')) { $Documentos = @($contrato.documentos) }
if ($Documentos.Count -eq 0 -or @($Documentos | Sort-Object -Unique).Count -ne $Documentos.Count) { throw 'Selecao de documentos vazia ou duplicada' }
Push-Location (Split-Path $PSScriptRoot -Parent)
$compilados = @()
$suites = @()
$erroExecucao = $null
$selecaoIntegral = $Documentos.Count -eq $contrato.documentos.Count -and -not (Compare-Object @($Documentos) @($contrato.documentos))
try {
    foreach ($documento in $Documentos) {
        Compilar-Regressao $documento 'build/perfis'
        $compilados += $documento
    }
    foreach ($modelo in 'bibliografia-academicos', 'bibliografia-periodicos-integrais', 'bibliografia-patentes', 'bibliografia-tradutores') {
        if ("tests/$modelo.tex" -in $Documentos) {
            & "$PSScriptRoot/verificar-modelo-biber.ps1" -Documento $modelo
        }
    }
    foreach ($controle in $contrato.controles) {
        Compilar-Regressao $controle 'build/perfis' -SemBibliografia
        $compilados += $controle
    }
    & "$PSScriptRoot/verificar-artigo.ps1" -Diretorio build/perfis -Documentos $Documentos
    & "$PSScriptRoot/verificar-relatorios.ps1" -Diretorio build/perfis -Documentos $Documentos
    if (@('tests/complementos-artigo.tex', 'tests/complementos-monografia.tex', 'tests/apud.tex', 'tests/objetos-extensos.tex', 'tests/inclusao-pdf.tex' | Where-Object { $_ -notin $Documentos }).Count -eq 0) {
        & "$PSScriptRoot/verificar-estrutura.ps1" -Diretorio build/perfis
    }
    foreach ($suite in $contrato.suites.PSObject.Properties) {
        $bibliografia = $suite.Name
        if ("tests/$bibliografia.tex" -in $Documentos) {
            $resultados = @()
            try {
                & "$PSScriptRoot/verificar-bibliografia.ps1" -Diretorio build/perfis -Documento $bibliografia
            } finally {
                $arquivo = "build/perfis/$bibliografia-resultados.json"
                if (Test-Path -LiteralPath $arquivo) {
                    $resultados = @(Get-Content -LiteralPath $arquivo -Raw -Encoding utf8 | ConvertFrom-Json)
                    if ($resultados.Count -gt 0) {
                        $aprovados = @($resultados | Where-Object aprovado).Count
                        $suites += [pscustomobject]@{ nome = $bibliografia; avaliados = $resultados.Count; aprovados = $aprovados; reprovados = $resultados.Count - $aprovados }
                    }
                }
            }
            if ($resultados.Count -ne $suite.Value) { throw "Contagem de resultados divergente: $bibliografia" }
        }
    }
} catch {
    $erroExecucao = $_.Exception.Message
    throw
} finally {
    try {
        New-Item -ItemType Directory -Force -Path build/perfis | Out-Null
        $cenarios = [int](($suites | Measure-Object -Property avaliados -Sum).Sum)
        $aprovados = [int](($suites | Measure-Object -Property aprovados -Sum).Sum)
        $completa = $selecaoIntegral -and -not $erroExecucao
        $selecionadas = @($contrato.suites.PSObject.Properties.Name | Where-Object { "tests/$_.tex" -in $Documentos })
        $resumo = [pscustomobject]@{
            completa = $completa; documentos = $compilados; suites = $suites
            cenarios = $cenarios; aprovados = $aprovados; reprovados = $cenarios - $aprovados
            documentosNaoCompilados = @((@($Documentos) + @($contrato.controles)) | Where-Object { $_ -notin $compilados })
            suitesNaoAvaliadas = @($selecionadas | Where-Object { $_ -notin $suites.nome })
            erroExecucao = $erroExecucao
        }
        $arquivoResumo = if ($selecaoIntegral) { 'build/perfis/resumo.json' } else { 'build/perfis/resumo-parcial.json' }
        $resumo | ConvertTo-Json -Depth 6 | Set-Content -LiteralPath $arquivoResumo -Encoding utf8
        if ($completa) { Confirmar-ResultadoPerfis $resumo $contrato }
        Write-Host "Perfis: integral=$completa; $($compilados.Count) documentos; $($suites.Count) suites avaliadas; $cenarios cenarios; $aprovados aprovados; $($cenarios - $aprovados) reprovados; erro de execucao=$([bool]$erroExecucao)."
    } finally { Pop-Location }
}
