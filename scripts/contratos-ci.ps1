# Contratos comuns de selecao e resultados; nao compila nem altera o cadastro.
function Obter-ContratoRegressao {
    $raiz = Split-Path $PSScriptRoot -Parent
    $contrato = Get-Content -LiteralPath "$raiz/tests/regressao.json" -Raw -Encoding utf8 | ConvertFrom-Json
    $documentos = @($contrato.documentos) + @($contrato.controles)
    if ($documentos.Count -ne $contrato.totalDocumentos -or
        @($documentos | Sort-Object -Unique).Count -ne $documentos.Count) { throw 'Contagem de documentos inconsistente no contrato' }
    foreach ($arquivo in $documentos) {
        if (-not (Test-Path -LiteralPath "$raiz/$arquivo" -PathType Leaf)) { throw "Fixture obrigatoria ausente: $arquivo" }
    }
    $descobertas = @(Get-ChildItem -LiteralPath "$raiz/tests" -Filter 'bibliografia-*.tex' | ForEach-Object { $_.BaseName })
    $declaradas = @($contrato.suites.PSObject.Properties.Name)
    if (Compare-Object $descobertas $declaradas) { throw 'Selecao bibliografica divergente das fixtures permanentes' }
    $total = 0
    foreach ($suite in $contrato.suites.PSObject.Properties) {
        if ("tests/$($suite.Name).tex" -notin $contrato.documentos) { throw "Suite nao selecionada: $($suite.Name)" }
        $casos = @(Get-Content -LiteralPath "$raiz/tests/$($suite.Name).json" -Raw -Encoding utf8 | ConvertFrom-Json)
        if ($casos.Count -ne $suite.Value -or @($casos.id | Sort-Object -Unique).Count -ne $casos.Count) { throw "Contagem/IDs de cenario divergente: $($suite.Name)" }
        if (-not (Test-Path -LiteralPath "$raiz/tests/$($suite.Name).bib")) { throw "Fixture obrigatoria ausente: $($suite.Name).bib" }
        $total += $casos.Count
    }
    if ($total -ne $contrato.totalCenarios) { throw 'Contagem de cenarios inconsistente no contrato' }
    foreach ($grupo in $contrato.cenariosComplementares.PSObject.Properties) {
        $fonte = "tests/controles-ci/$($grupo.Name).tex"
        $casos = @(Get-Content -LiteralPath "$raiz/tests/controles-ci/$($grupo.Name).json" -Raw -Encoding utf8 | ConvertFrom-Json)
        if ($fonte -notin $contrato.complementares -or -not (Test-Path -LiteralPath "$raiz/$fonte") -or $casos.Count -ne $grupo.Value) { throw "Controle complementar incompleto: $($grupo.Name)" }
    }
    if (@($contrato.complementares).Count -ne @($contrato.cenariosComplementares.PSObject.Properties).Count) { throw 'Selecao complementar inconsistente' }
    if (@($contrato.manuais).Count -ne $contrato.totalManuais) { throw 'Selecao de manuais incompleta' }
    foreach ($manual in $contrato.manuais) {
        if (-not (Test-Path -LiteralPath "$raiz/$manual" -PathType Leaf)) { throw "Manual obrigatorio ausente: $manual" }
    }
    return $contrato
}

function Confirmar-Saidas([string]$Diretorio, [string]$Nome, [string[]]$Extensoes) {
    foreach ($ext in $Extensoes) {
        $arquivo = Join-Path $Diretorio "$Nome.$ext"
        if (-not (Test-Path -LiteralPath $arquivo -PathType Leaf) -or (Get-Item -LiteralPath $arquivo).Length -eq 0) { throw "Saida obrigatoria ausente ou vazia: $arquivo" }
    }
}

function Confirmar-FalhaEsperada([int]$Codigo, [string]$Log, [string]$Padrao) {
    if ($Codigo -eq 0) { throw 'Falha estrutural esperada nao ocorreu' }
    if (($Log -replace '\s+', ' ') -notmatch $Padrao) { throw 'Falha estrutural ocorreu por motivo diferente do esperado' }
}

function Confirmar-ResultadoPerfis($Resultado, $Contrato) {
    if (-not $Resultado.completa -or $Resultado.documentos.Count -ne $Contrato.totalDocumentos -or
        (Compare-Object @($Resultado.documentos) (@($Contrato.documentos) + @($Contrato.controles)))) { throw 'Execucao parcial ou contagem de documentos divergente' }
    $suites = @($Resultado.suites)
    if ($suites.Count -ne @($Contrato.suites.PSObject.Properties).Count -or $Resultado.cenarios -ne $Contrato.totalCenarios -or
        $Resultado.aprovados -ne $Contrato.totalCenarios -or $Resultado.reprovados -ne 0) { throw 'Resultado bibliografico incompleto ou reprovado' }
    foreach ($suite in $Contrato.suites.PSObject.Properties) {
        $observada = @($suites | Where-Object nome -eq $suite.Name)
        if ($observada.Count -ne 1 -or $observada[0].avaliados -ne $suite.Value -or $observada[0].aprovados -ne $suite.Value) { throw "Resultado incompleto: $($suite.Name)" }
    }
}

function Preparar-DiretoriosAuxiliares([string]$Documento, [string]$Diretorio) {
    $raiz = (Get-Location).ProviderPath
    $resolver = {
        param([string]$Caminho)
        $relativo = $Caminho.Replace('\', '/').Trim('"')
        if (-not $relativo -or $relativo.StartsWith('/') -or
            $relativo -match '[<>:"|?*{}$#\x00-\x1f]' -or '..' -in ($relativo -split '/')) {
            throw "Caminho auxiliar nao autorizado: $Caminho"
        }
        $atual = $raiz
        foreach ($parte in ($relativo -split '/')) {
            $atual = Join-Path $atual $parte
            if ((Test-Path -LiteralPath $atual) -and
                ((Get-Item -LiteralPath $atual -Force).Attributes -band [IO.FileAttributes]::ReparsePoint)) {
                throw "Link nao autorizado no caminho auxiliar: $Caminho"
            }
        }
        return [IO.Path]::GetFullPath($atual)
    }
    $saida = & $resolver $Diretorio
    $relSaida = [IO.Path]::GetRelativePath($raiz, $saida).Replace('\', '/')
    if ($relSaida -ne 'build' -and -not $relSaida.StartsWith('build/')) {
        throw "Diretorio auxiliar fora da area de compilacao: $Diretorio"
    }
    $pendentes = [Collections.Generic.Stack[string]]::new()
    $visitados = [Collections.Generic.HashSet[string]]::new()
    $pastas = [Collections.Generic.HashSet[string]]::new()
    $pendentes.Push((& $resolver $Documento))
    [void]$pastas.Add($saida)
    while ($pendentes.Count) {
        $fonte = $pendentes.Pop()
        if (-not $visitados.Add($fonte) -or -not (Test-Path -LiteralPath $fonte -PathType Leaf)) { continue }
        # Contrato: caminhos literais entre chaves, relativos a raiz de compilacao.
        # Nao interpreta macros TeX; campos dinamicos de include sao recusados.
        $texto = (Get-Content -LiteralPath $fonte -Raw -Encoding utf8) -replace '(?m)(?<!\\)%.*$', ''
        foreach ($inclusao in [regex]::Matches($texto, '\\(undfincludechapter|include|input|undfinputoptional)\s*\{([^{}]*)\}')) {
            $caminho = $inclusao.Groups[2].Value.Trim('"')
            if (-not $caminho.EndsWith('.tex')) { $caminho += '.tex' }
            $filho = & $resolver $caminho
            $pendentes.Push($filho)
            if ($inclusao.Groups[1].Value -in @('include', 'undfincludechapter')) {
                $pai = [IO.Path]::GetRelativePath($raiz, (Split-Path $filho -Parent))
                [void]$pastas.Add((& $resolver (Join-Path $relSaida $pai)))
            }
        }
    }
    # Valida todos os caminhos antes de criar somente diretorios, sem copiar fontes.
    foreach ($pasta in $pastas) { New-Item -ItemType Directory -Force -Path $pasta | Out-Null }
}

function Compilar-Regressao([string]$Documento, [string]$Diretorio, [switch]$SemBibliografia) {
    if (-not (Test-Path -LiteralPath $Documento -PathType Leaf)) { throw "Fixture obrigatoria ausente: $Documento" }
    Preparar-DiretoriosAuxiliares $Documento $Diretorio
    $nome = [System.IO.Path]::GetFileNameWithoutExtension($Documento)
    Write-Host "Compilando $Documento"
    & lualatex -interaction=nonstopmode -halt-on-error "-output-directory=$Diretorio" $Documento > "$Diretorio/$nome-passagem-1.txt" 2>&1
    if ($LASTEXITCODE -ne 0) { throw "LuaLaTeX falhou: $Diretorio/$nome-passagem-1.txt" }
    Confirmar-Saidas $Diretorio $nome @('pdf', 'log')
    if ($SemBibliografia) { return }
    Confirmar-Saidas $Diretorio $nome @('bcf')
    & biber "--input-directory=$Diretorio" "--output-directory=$Diretorio" $nome > "$Diretorio/$nome-biber.txt" 2>&1
    if ($LASTEXITCODE -ne 0) { throw "Biber falhou: $Diretorio/$nome-biber.txt" }
    Confirmar-Saidas $Diretorio $nome @('blg')
    $bcf = [xml](Get-Content -LiteralPath "$Diretorio/$nome.bcf" -Raw -Encoding utf8)
    $temCitacoes = @($bcf.SelectNodes("//*[local-name()='citekey']")).Count -gt 0
    $bbl = "$Diretorio/$nome.bbl"
    # Biber pode produzir BBL vazio para um controle sem qualquer citacao.
    if (-not (Test-Path -LiteralPath $bbl) -or ($temCitacoes -and (Get-Item -LiteralPath $bbl).Length -eq 0)) { throw "Saida bibliografica obrigatoria ausente ou incompleta: $bbl" }
    foreach ($passagem in 2..3) {
        & lualatex -interaction=nonstopmode -halt-on-error "-output-directory=$Diretorio" $Documento > "$Diretorio/$nome-passagem-$passagem.txt" 2>&1
        if ($LASTEXITCODE -ne 0) { throw "LuaLaTeX falhou: $Diretorio/$nome-passagem-$passagem.txt" }
    }
    Confirmar-Saidas $Diretorio $nome @('pdf', 'log')
    if (Select-String -LiteralPath "$Diretorio/$nome.log" -Pattern 'Citation .* undefined|Reference .* undefined|There were undefined|Please \(re\)run Biber|Rerun to get') { throw "Referencias ainda nao resolvidas: $nome" }
}
