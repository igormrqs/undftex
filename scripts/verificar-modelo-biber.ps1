# Valida o multiconjunto de avisos por chave/campo; nao aceita um teto generico.
param(
    [Parameter(Mandatory)][string]$Documento,
    [string]$Diretorio = 'build/perfis',
    [switch]$SomenteLer
)
$ErrorActionPreference = 'Stop'
. "$PSScriptRoot/contratos-ci.ps1"
$raiz = Split-Path $PSScriptRoot -Parent
$contratos = Get-Content -LiteralPath "$raiz/tests/avisos-biber.json" -Raw -Encoding utf8 | ConvertFrom-Json
$contrato = $contratos.PSObject.Properties[$Documento].Value
if (-not $contrato) { throw "Sem contrato de avisos para $Documento" }
$pasta = Join-Path $Diretorio "datamodel-$Documento"
if (-not $SomenteLer) {
    New-Item -ItemType Directory -Force -Path $pasta | Out-Null
    & biber --validate-datamodel "--input-directory=$Diretorio" "--output-directory=$pasta" $Documento > "$pasta/validacao.txt" 2>&1
    if ($LASTEXITCODE -ne 0) { throw "Biber falhou na validacao nativa: $Documento" }
}
Confirmar-Saidas $pasta $Documento @('blg', 'bbl')
$log = Get-Content -LiteralPath "$pasta/$Documento.blg" -Raw -Encoding utf8
if ($log -match '(?:ERROR|FATAL) -' -or $log -notmatch 'INFO - Output to ') { throw "Validacao Biber incompleta ou com erro: $Documento" }
$avisos = @([regex]::Matches($log, '(?m)WARN - (.+)$') | ForEach-Object {
    ($_.Groups[1].Value.Trim() -replace " \([^\r\n]*\.bib\):", ':')
})
$esperados = @($contrato | ForEach-Object { for ($i = 0; $i -lt $_.quantidade; $i++) { $_.mensagem } })
if ($avisos.Count -ne $esperados.Count -or (Compare-Object ($avisos | Sort-Object) ($esperados | Sort-Object))) { throw "Avisos Biber divergentes do contrato: $Documento`n$($avisos -join "`n")" }
$resultado = [pscustomobject]@{ suite = $Documento; avisos = $avisos.Count; categorias = @($contrato | Select-Object categoria, quantidade, mensagem); aprovado = $true }
$resultado | ConvertTo-Json -Depth 5 | Set-Content -LiteralPath "$pasta/resultado.json" -Encoding utf8
Write-Host "Biber nativo ${Documento}: $($avisos.Count) avisos esperados classificados; nenhum novo aviso aceito."
