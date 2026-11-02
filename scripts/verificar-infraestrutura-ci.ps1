# Injeções somente em copia descartavel. Cada erro precisa ter a causa esperada.
$ErrorActionPreference = 'Stop'
$raiz = Split-Path $PSScriptRoot -Parent
$temporario = [System.IO.Path]::GetFullPath((Join-Path ([System.IO.Path]::GetTempPath()) ("undf-ci-" + [guid]::NewGuid().ToString('N'))))
$resultados = @()
New-Item -ItemType Directory -Path $temporario | Out-Null
try {
    $arquivos = @(& git -C $raiz ls-files --cached --others --exclude-standard)
    if ($LASTEXITCODE -ne 0) { throw 'Nao foi possivel copiar as fontes para os testes negativos' }
    foreach ($arquivo in $arquivos) {
        $destino = Join-Path $temporario $arquivo
        New-Item -ItemType Directory -Force -Path (Split-Path $destino) | Out-Null
        Copy-Item -LiteralPath (Join-Path $raiz $arquivo) -Destination $destino
    }
    New-Item -ItemType Directory -Force -Path "$temporario/build/perfis" | Out-Null
    foreach ($arquivo in 'bibliografia-listas.pdf', 'bibliografia-listas.log', 'bibliografia-patentes.bcf', 'resumo.json') {
        Copy-Item -LiteralPath "$raiz/build/perfis/$arquivo" -Destination "$temporario/build/perfis/$arquivo"
    }
    function Rejeitar([string]$Id, [string]$Codigo, [string]$Motivo) {
        $fonte = "$temporario/probe.ps1"
        Set-Content -LiteralPath $fonte -Encoding utf8 -Value ("`$ErrorActionPreference = 'Stop'`nSet-Location -LiteralPath `$PSScriptRoot`n. ./scripts/contratos-ci.ps1`ntry {`n" + $Codigo + "`n} catch { [Console]::Error.WriteLine(`$_.Exception.Message); exit 1 }")
        $saida = (& pwsh -NoProfile -File $fonte 2>&1 | Out-String)
        $retorno = $LASTEXITCODE
        if ($retorno -eq 0 -or $saida -notmatch $Motivo) { throw "Injecao $Id nao rejeitada pela causa esperada: $saida" }
        $script:resultados += [pscustomobject]@{ id = $Id; aprovado = $true; motivo = $Motivo; exitCode = $retorno }
        Write-Host "Infraestrutura ${Id}: defeito rejeitado."
    }
    $fixture = "$temporario/tests/bibliografia-listas.tex"
    Move-Item -LiteralPath $fixture -Destination "$fixture.reserva"
    Rejeitar 'I01-fixture-ausente' 'Obter-ContratoRegressao' 'Fixture obrigatoria ausente: tests/bibliografia-listas.tex'
    Move-Item -LiteralPath "$fixture.reserva" -Destination $fixture
    Rejeitar 'I02-saida-ausente' "Confirmar-Saidas build/inexistente esperado @('pdf')" 'Saida obrigatoria ausente ou vazia'
    $expectativa = "$temporario/tests/bibliografia-listas.json"
    $original = Get-Content -LiteralPath $expectativa -Raw -Encoding utf8
    $casos = $original | ConvertFrom-Json
    $casos[0].ordem = @('SENTINELA-IMPOSSIVEL-F03-M')
    $casos | ConvertTo-Json -Depth 12 | Set-Content -LiteralPath $expectativa -Encoding utf8
    Rejeitar 'I03-cenario-reprovado' './scripts/verificar-bibliografia.ps1 -Documento bibliografia-listas' 'Elemento ausente ou fora de ordem: SENTINELA-IMPOSSIVEL-F03-M'
    Set-Content -LiteralPath $expectativa -Value $original -Encoding utf8
    $bcf = "$temporario/build/perfis/bibliografia-patentes.bcf"
    $bcfOriginal = Get-Content -LiteralPath $bcf -Raw -Encoding utf8
    Set-Content -LiteralPath $bcf -Value '<bcf-invalido' -Encoding utf8
    Rejeitar 'I04-biber-falha-real' './scripts/verificar-modelo-biber.ps1 -Documento bibliografia-patentes' 'Biber falhou na validacao nativa'
    Set-Content -LiteralPath $bcf -Value $bcfOriginal -Encoding utf8
    Rejeitar 'I05-contagem-documentos' '$r = Get-Content build/perfis/resumo.json -Raw | ConvertFrom-Json; $r.documentos = @($r.documentos | Select-Object -Skip 1); Confirmar-ResultadoPerfis $r (Obter-ContratoRegressao)' 'Execucao parcial ou contagem de documentos divergente'
    $bib = "$temporario/tests/bibliografia-patentes.bib"
    $bibOriginal = Get-Content -LiteralPath $bib -Raw -Encoding utf8
    Set-Content -LiteralPath $bib -Encoding utf8 -Value $bibOriginal.Replace('@patent{v23,', "@patent{v23,`n  booktitle={Campo indevido injetado},")
    Rejeitar 'I06-campo-nao-autorizado' './scripts/verificar-modelo-biber.ps1 -Documento bibliografia-patentes' "Avisos Biber divergentes do contrato[\s\S]*Invalid field 'booktitle'"
    Rejeitar 'I07-negativo-nao-falhou' "Confirmar-FalhaEsperada 0 'Capitulo obrigatorio ausente' 'Capitulo obrigatorio ausente'" 'Falha estrutural esperada nao ocorreu'
    Rejeitar 'I08-negativo-causa-errada' "Confirmar-FalhaEsperada 1 'Undefined control sequence' 'Capitulo obrigatorio ausente'" 'Falha estrutural ocorreu por motivo diferente'
    Rejeitar 'I09-exit-code-obrigatorio' @'
function lualatex {
    Set-Content build/probe/probe.pdf 'PDF simulado apenas para isolar exit code'
    Set-Content build/probe/probe.log 'Log simulado'
    Set-Content build/probe/probe.bcf 'BCF simulado'
    $global:LASTEXITCODE = 0
}
function biber { $global:LASTEXITCODE = 23 }
Set-Content probe.tex 'Fonte simulada'
Compilar-Regressao probe.tex build/probe
'@ 'Biber falhou: build/probe/probe-biber.txt'
    Rejeitar 'I10-sucesso-sem-produto' @'
function lualatex { $global:LASTEXITCODE = 0 }
Set-Content vazio.tex 'Fonte simulada'
Compilar-Regressao vazio.tex build/sem-produto
'@ 'Saida obrigatoria ausente ou vazia'
    $modelo = 'build/perfis/datamodel-bibliografia-patentes'
    New-Item -ItemType Directory -Force -Path "$temporario/$modelo" | Out-Null
    foreach ($ext in 'blg', 'bbl') {
        Copy-Item -LiteralPath "$raiz/$modelo/bibliografia-patentes.$ext" -Destination "$temporario/$modelo/bibliografia-patentes.$ext"
    }
    $log = Get-Content -LiteralPath "$temporario/$modelo/bibliografia-patentes.blg" -Raw -Encoding utf8
    $alterado = $log.Replace("Invalid field 'editor' for entrytype 'patent'", "Invalid field 'booktitle' for entrytype 'patent'")
    if ($alterado -eq $log) { throw 'Aviso alvo da injecao de mesma quantidade nao encontrado' }
    Set-Content -LiteralPath "$temporario/$modelo/bibliografia-patentes.blg" -Value $alterado -Encoding utf8
    Rejeitar 'I11-aviso-novo-mesma-quantidade' './scripts/verificar-modelo-biber.ps1 -Documento bibliografia-patentes -SomenteLer' 'Avisos Biber divergentes do contrato'
    if ($resultados.Count -ne 11) { throw 'Injecoes de infraestrutura incompletas' }
    New-Item -ItemType Directory -Force -Path "$raiz/build/ci" | Out-Null
    $resultados | ConvertTo-Json -Depth 4 | Set-Content -LiteralPath "$raiz/build/ci/infraestrutura.json" -Encoding utf8
    Write-Host "Infraestrutura: $($resultados.Count) injecoes rejeitadas pela causa esperada."
    $global:LASTEXITCODE = 0
} finally {
    $prefixo = [System.IO.Path]::GetFullPath((Join-Path ([System.IO.Path]::GetTempPath()) 'undf-ci-'))
    if (-not $temporario.StartsWith($prefixo, [StringComparison]::OrdinalIgnoreCase)) { throw 'Limpeza recusada fora da copia descartavel' }
    Remove-Item -LiteralPath $temporario -Recurse -Force
}
