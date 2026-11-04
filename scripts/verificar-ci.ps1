# Entrada integral comum ao CI e ao checkout local limpo. Nao publica PDFs.
param([string]$Python = 'python3')
$ErrorActionPreference = 'Stop'
. "$PSScriptRoot/contratos-ci.ps1"
Push-Location (Split-Path $PSScriptRoot -Parent)
$resumo = [ordered]@{ completo = $false; grupos = @(); perfis = $null; erro = $null; naoExecutados = @() }
$perfisIniciados = $false
$grupos = @('perfis', 'F01-F02', 'F04', 'controles', 'manuais', 'artefato-projeto', 'organizacao', 'infraestrutura')
try {
    foreach ($ferramenta in (@('lualatex', 'biber', 'pdftotext', 'pdftohtml', 'pdfinfo', 'pwsh', 'git') + @($Python))) {
        if (-not (Get-Command $ferramenta -ErrorAction SilentlyContinue)) { throw "Ferramenta obrigatoria ausente: $ferramenta" }
    }
    # Recusa resultados anteriores em vez de apagar dados locais ou aceita-los.
    foreach ($pasta in 'build/perfis', 'build/integridade', 'build/controles-ci', 'build/f04', 'manuais/parte-i/build', 'manuais/parte-ii/build', 'manuais/build') {
        if (Test-Path -LiteralPath $pasta) { throw "Saidas anteriores presentes: $pasta. Execute em checkout limpo." }
    }
    New-Item -ItemType Directory -Force -Path build/ci | Out-Null
    & lualatex --version > build/ci/lualatex-versao.txt 2>&1
    if ($LASTEXITCODE -ne 0) { throw 'Falha ao identificar LuaLaTeX' }
    & biber --version > build/ci/biber-versao.txt 2>&1
    if ($LASTEXITCODE -ne 0) { throw 'Falha ao identificar Biber' }
    $PSVersionTable.PSVersion.ToString() | Set-Content build/ci/powershell-versao.txt
    $contrato = Obter-ContratoRegressao
    Write-Host "Selecionadas $(@($contrato.suites.PSObject.Properties).Count) suites; $($contrato.totalDocumentos) documentos; $($contrato.totalCenarios) cenarios bibliograficos."
    $perfisIniciados = $true
    & "$PSScriptRoot/verificar-perfis.ps1"
    $resumo.perfis = Get-Content build/perfis/resumo.json -Raw -Encoding utf8 | ConvertFrom-Json
    Confirmar-ResultadoPerfis $resumo.perfis $contrato
    $resumo.grupos += 'perfis'
    & "$PSScriptRoot/verificar-integridade.ps1"
    $resumo.grupos += 'F01-F02'
    & "$PSScriptRoot/verificar-medicao.ps1"
    $resumo.grupos += 'F04'
    foreach ($documento in $contrato.complementares) {
        Compilar-Regressao $documento 'build/controles-ci'
        $nome = [System.IO.Path]::GetFileNameWithoutExtension($documento)
        & "$PSScriptRoot/verificar-bibliografia.ps1" -Diretorio build/controles-ci -Documento $nome -PastaFixtures tests/controles-ci
    }
    $resumo.grupos += 'controles'
    foreach ($entrada in $contrato.manuais) {
        Push-Location (Split-Path $entrada)
        try {
            $nome = [System.IO.Path]::GetFileNameWithoutExtension($entrada)
            New-Item -ItemType Directory -Force -Path build | Out-Null
            foreach ($passagem in 1..3) {
                & lualatex -interaction=nonstopmode -halt-on-error -output-directory=build "$nome.tex" > "build/$nome-passagem-$passagem.txt" 2>&1
                if ($LASTEXITCODE -ne 0) { throw "LuaLaTeX falhou no manual $nome" }
            }
            Confirmar-Saidas 'build' $nome @('pdf', 'log', 'toc')
            $log = Get-Content "build/$nome.log" -Raw
            if ($log -match 'There were undefined|Reference .* undefined|Citation .* undefined|Rerun to get|Please \(re\)run Biber') { throw "Manual nao estabilizado: $nome" }
            $texto = (& pdftotext -layout "build/$nome.pdf" -) -join "`n"
            if ($LASTEXITCODE -ne 0 -or $texto -notmatch 'SUMÁRIO|Sumário' -or $texto -notmatch 'UnDF') { throw "Manual incompleto: $nome" }
            & pdfinfo "build/$nome.pdf" > "build/$nome-info.txt" 2>&1
            if ($LASTEXITCODE -ne 0) { throw "PDF de manual invalido: $nome" }
        } finally { Pop-Location }
    }
    $resumo.grupos += 'manuais'
    & $Python exemplo/projeto-aplicado/artefatos/validar_reserva.py
    if ($LASTEXITCODE -ne 0) { throw 'Verificacao do artefato de Projeto Aplicado falhou' }
    $resumo.grupos += 'artefato-projeto'
    & "$PSScriptRoot/verificar-organizacao.ps1"
    $resumo.grupos += 'organizacao'
    & "$PSScriptRoot/verificar-infraestrutura-ci.ps1"
    & "$PSScriptRoot/verificar-auxiliares-ci.ps1"
    $resumo.grupos += 'infraestrutura'
    $resumo.completo = $true
} catch {
    $resumo.erro = $_.Exception.Message
    throw
} finally {
    if ($perfisIniciados -and -not $resumo.perfis -and (Test-Path -LiteralPath build/perfis/resumo.json)) {
        $resumo.perfis = Get-Content build/perfis/resumo.json -Raw -Encoding utf8 | ConvertFrom-Json
    }
    $resumo.naoExecutados = @($grupos | Where-Object { $_ -notin $resumo.grupos })
    New-Item -ItemType Directory -Force -Path build/ci | Out-Null
    $resumo | ConvertTo-Json -Depth 10 | Set-Content build/ci/resumo.json -Encoding utf8
    $mensagem = "CI completo: $($resumo.completo); grupos concluidos: $($resumo.grupos -join ', '); nao executados: $($resumo.naoExecutados -join ', ')."
    Write-Host $mensagem
    if ($env:GITHUB_STEP_SUMMARY) { $mensagem | Add-Content -LiteralPath $env:GITHUB_STEP_SUMMARY }
    Pop-Location
}
