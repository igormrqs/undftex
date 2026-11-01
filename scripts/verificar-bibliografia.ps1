# Confere chamadas e referencias no PDF das fixtures bibliograficas (LuaLaTeX/Biber).
param(
    [string]$Diretorio = 'build/perfis',
    [ValidateSet('bibliografia-listas', 'bibliografia-datas', 'bibliografia-desambiguacao', 'bibliografia-apud', 'bibliografia-eletronicos', 'bibliografia-responsabilidades', 'bibliografia-recipientes', 'bibliografia-autoria', 'bibliografia-ordenacao', 'bibliografia-integridade', 'bibliografia-partes', 'bibliografia-periodicos', 'bibliografia-notas', 'bibliografia-titulos', 'bibliografia-numerais')]
    [string]$Documento = 'bibliografia-listas'
)
$ErrorActionPreference = 'Stop'
$raiz = Split-Path $PSScriptRoot -Parent
$casos = @(Get-Content -LiteralPath (Join-Path $raiz "tests/$Documento.json") -Raw -Encoding utf8 | ConvertFrom-Json)
$texto = (& pdftotext -layout "$Diretorio/$Documento.pdf" -) -join "`n"
if ($LASTEXITCODE -ne 0) { throw "Falha na leitura de $Documento.pdf" }
$paginas = $texto -split "`f"
$html = ''
if (@($casos | Where-Object { $_.links -or $_.linksAusentes }).Count -gt 0) {
    $html = (& pdftohtml -i -stdout -s -hidden "$Diretorio/$Documento.pdf" 2>$null) -join "`n"
    if ($LASTEXITCODE -ne 0) { throw "Falha na leitura dos hiperlinks de $Documento.pdf" }
}
$resultados = @()
foreach ($caso in $casos) {
    $falhas = @()
    $pagina = @($paginas | Where-Object { $_ -match "CASO $($caso.id)\b" })
    if ($pagina.Count -ne 1) { throw "Caso $($caso.id) ausente ou duplicado no PDF" }
    $indicePagina = [array]::IndexOf($paginas, $pagina[0])
    $fimPagina = $indicePagina
    while ($fimPagina + 1 -lt $paginas.Count -and $paginas[$fimPagina + 1].Trim() -and
           $paginas[$fimPagina + 1] -notmatch 'CASO \w+\b') {
        $fimPagina++
    }
    $pagina = @($paginas[$indicePagina..$fimPagina])
    if ($caso.paginasMinimas -and $pagina.Count -lt $caso.paginasMinimas) {
        $falhas += "Esperadas pelo menos $($caso.paginasMinimas) paginas; observadas $($pagina.Count)"
    }
    # Desfaz somente hifenizacao de quebra de linha, sem alterar hifens dos dados.
    $conteudo = ((($pagina -join "`n") -replace '(?<=\p{L})-\s*\n\s*(?=\p{L})', '') -replace '\s+', ' ').Normalize()
    $partes = $conteudo -split 'REFERENCIA:', 2
    if ($partes.Count -ne 2) { throw "Marcador de referencia ausente: $($caso.id)" }
    $referencia = $partes[1]
    foreach ($item in $caso.contagensPadroes.PSObject.Properties) {
        $quantidade = [regex]::Matches($referencia, $item.Name).Count
        if ($quantidade -ne $item.Value) { $falhas += "$($item.Name): esperado $($item.Value), observado $quantidade" }
    }
    foreach ($item in $caso.contagensIdentificadores.PSObject.Properties) {
        $literal = ((($pagina -join '') -split 'REFERENCIA:', 2)[1]) -replace '\s+', ''
        $quantidade = [regex]::Matches($literal, [regex]::Escape($item.Name)).Count
        if ($quantidade -ne $item.Value) { $falhas += "$($item.Name): esperado $($item.Value), observado $quantidade" }
    }
    foreach ($item in $caso.contagens.PSObject.Properties) {
        $quantidade = [regex]::Matches($referencia, [regex]::Escape($item.Name), 'IgnoreCase').Count
        if ($quantidade -ne $item.Value) { $falhas += "$($item.Name): esperado $($item.Value), observado $quantidade" }
    }
    $posicao = 0
    foreach ($item in $caso.ordem) {
        $indice = $referencia.IndexOf($item, $posicao, [StringComparison]::OrdinalIgnoreCase)
        if ($indice -lt 0) { $falhas += "Elemento ausente ou fora de ordem: $item"; break }
        $posicao = $indice + $item.Length
    }
    foreach ($item in $caso.ausentes) {
        if ($referencia -match [regex]::Escape($item)) { $falhas += "Informacao indevida: $item" }
    }
    foreach ($item in $caso.chamadaAusentes) {
        if ($partes[0] -match [regex]::Escape($item)) { $falhas += "Chamada alterada indevidamente: $item" }
    }
    foreach ($item in $caso.padroes) {
        if ($referencia -notmatch $item) { $falhas += "Padrao ausente na referencia: $item" }
    }
    foreach ($item in $caso.chamadaPadroes) {
        if ($partes[0] -notmatch $item) { $falhas += "Padrao ausente na chamada: $item" }
    }
    foreach ($item in $caso.avisos) {
        $log = (Get-Content -LiteralPath "$Diretorio/$Documento.log" -Raw) -replace '\s+', ' '
        if ($log -notmatch $item) { $falhas += "Aviso esperado ausente: $item" }
    }
    foreach ($item in $caso.avisosAusentes) {
        $log = (Get-Content -LiteralPath "$Diretorio/$Documento.log" -Raw) -replace '\s+', ' '
        if ($log -match $item) { $falhas += "Aviso indevido: $item" }
    }
    foreach ($item in $caso.identificadoresNoTexto) {
        # Identificadores nao recebem hifenizacao editorial; conservam os hifens dos dados.
        if ((($pagina -join '') -replace '\s+', '').IndexOf($item, [StringComparison]::Ordinal) -lt 0) {
            $falhas += "Identificador alterado no texto: $item"
        }
    }
    $destinos = @()
    if ($caso.links -or $caso.linksAusentes) {
        for ($numero = $indicePagina + 1; $numero -le $fimPagina + 1; $numero++) {
            $bloco = [regex]::Match($html, "(?s)<div id=`"page$numero-div`"[^>]*>(.*?)</div>").Groups[1].Value
            $destinos += @([regex]::Matches($bloco, 'href="([^"]+)"') | ForEach-Object {
                [System.Net.WebUtility]::HtmlDecode($_.Groups[1].Value)
            })
        }
        foreach ($item in $caso.links) {
            if ($item -cnotin $destinos) { $falhas += "Destino ausente ou alterado no PDF: $item" }
        }
        foreach ($item in $caso.linksAusentes) {
            if ($item -cin $destinos) { $falhas += "Destino indevido no PDF: $item" }
        }
    }
    $resultados += [pscustomobject]@{ id = $caso.id; caso = $caso.caso; aprovado = ($falhas.Count -eq 0); falhas = @($falhas); referencia = $referencia.Trim() }
}
$resultados | ConvertTo-Json -Depth 4 | Set-Content -LiteralPath "$Diretorio/$Documento-resultados.json" -Encoding utf8
$reprovados = @($resultados | Where-Object { -not $_.aprovado })
if ($reprovados.Count -gt 0) {
    throw (($reprovados | ForEach-Object { "$($_.id): $($_.falhas -join '; ')" }) -join "`n")
}
Write-Host "${Documento}: $($casos.Count) casos conferidos no PDF."
