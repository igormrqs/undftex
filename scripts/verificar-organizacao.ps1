# Confere links locais da documentacao e impede o versionamento de saidas geradas.
$ErrorActionPreference = 'Stop'
$raiz = Split-Path $PSScriptRoot -Parent
$arquivos = @(& git -C $raiz ls-files)
if ($LASTEXITCODE -ne 0) { throw 'Execute em um checkout Git do UnDF-TeX.' }
$problemas = @()
$quantidadeLinks = 0
foreach ($arquivo in $arquivos) {
    if ($arquivo -match '(^|/)(build|node_modules|dist)/|\.(aux|bcf|bbl|blg|log|toc|out|run\.xml|synctex\.gz)$') {
        $problemas += "Saida gerada versionada: $arquivo"
    }
    if (-not $arquivo.EndsWith('.md')) { continue }
    $caminho = Join-Path $raiz $arquivo
    $conteudo = Get-Content -LiteralPath $caminho -Raw -Encoding utf8
    $conteudo = [regex]::Replace($conteudo, '```[\s\S]*?```', '')
    $links = [regex]::Matches($conteudo, '\]\((?<destino><[^>]+>|[^)\s]+)(?:\s+"[^"\n]*")?\)')
    foreach ($link in $links) {
        $destino = $link.Groups['destino'].Value.Trim('<', '>')
        if ($destino -match '^[a-zA-Z][a-zA-Z0-9+.-]*:|^#') { continue }
        $destino = [Uri]::UnescapeDataString(($destino -split '#', 2)[0])
        if (-not $destino) { continue }
        $quantidadeLinks++
        $alvo = Join-Path (Split-Path $caminho -Parent) $destino
        if (-not (Test-Path -LiteralPath $alvo)) { $problemas += "Link local ausente em ${arquivo}: $destino" }
    }
}
if ($problemas.Count -gt 0) { throw ($problemas -join "`n") }
Write-Host "Organizacao verificada: $quantidadeLinks links locais e ausencia de auxiliares versionados."
