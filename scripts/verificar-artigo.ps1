# Verifica o conteúdo dos PDFs e os avisos de validação. Requer pdftotext (Poppler/MiKTeX).
param(
    [string]$Diretorio = '.',
    [string[]]$Documentos = @('artigo.tex', 'tcc-artigo.tex', 'artigo-exemplo-undf.tex', 'tcc-artigo-exemplo-undf.tex', 'tests/artigo-opcionais.tex')
)
$ErrorActionPreference = 'Stop'
foreach ($documento in $Documentos) {
    $nome = [System.IO.Path]::GetFileNameWithoutExtension($documento)
    if ($nome -notin @('artigo', 'tcc-artigo', 'artigo-exemplo-undf', 'tcc-artigo-exemplo-undf', 'artigo-opcionais')) { continue }
    $texto = (& pdftotext -layout "$Diretorio/$nome.pdf" -) -join "`n"
    if ($LASTEXITCODE -ne 0) { throw "Falha na leitura de $nome.pdf" }
    if ([regex]::Matches($texto, '(?m)^\s*Resumo\s*$').Count -ne 1 -or
        [regex]::Matches($texto, '(?m)^\s*Palavras-chave:').Count -ne 1) {
        throw "$nome deve conter um unico resumo e suas palavras-chave"
    }
    $quantidadeAbstract = [regex]::Matches($texto, '(?m)^\s*Abstract\s*$').Count
    $quantidadeKeywords = [regex]::Matches($texto, '(?m)^\s*Keywords:').Count
    if ($quantidadeAbstract -gt 1 -or $quantidadeKeywords -ne $quantidadeAbstract) {
        throw "$nome apresenta traducao duplicada ou sem par abstract/keywords"
    }
    if ($texto -notmatch '(?m)^\s*REFERÊNCIAS\s*$') {
        throw "Referencias ausentes em $nome"
    }
    if ($nome -in @('artigo', 'artigo-exemplo-undf') -and $texto -match 'BANCA EXAMINADORA|SUMÁRIO|como requisito parcial') {
        throw 'O artigo autonomo herdou apresentacao institucional'
    }
    if ($nome -eq 'tcc-artigo-exemplo-undf') {
        $textoInstitucional = $texto -replace '\s+', ' '
        foreach ($rotulo in 'Ciência da Computação', 'Ana Exemplo', 'Bruno Exemplo', 'Carla Exemplo', 'Folha demonstrativa: não houve defesa ou aprovação.') {
            if ($textoInstitucional -notmatch [regex]::Escape($rotulo)) { throw "Elemento institucional ausente: $rotulo" }
        }
    }
    if ($nome -eq 'artigo-opcionais') {
        if ($quantidadeAbstract -ne 1) { throw 'Abstract opcional nao foi impresso' }
        foreach ($rotulo in 'aluno@example.org', 'Graduando em Nome do curso', 'Severino, 2017', 'SEVERINO,', 'Final paper in article format', 'GLOSSÁRIO', 'APÊNDICE A', 'ANEXO A', 'AGRADECIMENTOS') {
            if ($texto -notmatch [regex]::Escape($rotulo)) { throw "Complemento ausente: $rotulo" }
        }
    }
    $log = (Get-Content "$Diretorio/$nome.log" -Raw) -replace '\s+', ' '
    if ($log -match 'Preencha|Keywords sem abstract|Overfull') { throw "Aviso inesperado em $nome.log" }
}
$logValidacao = (Get-Content "$Diretorio/artigo-validacao.log" -Raw) -replace '\s+', ' '
foreach ($aviso in 'Preencha o titulo', 'Preencha a autoria', 'Preencha o resumo', 'Preencha as palavras-chave', 'resumo-99 tem 99', 'resumo-251 tem 251', 'o modelo de artigo recomenda de 100 a 250') {
    if (($logValidacao -replace '\s', '') -notmatch [regex]::Escape(($aviso -replace '\s', ''))) {
        throw "Aviso esperado ausente: $aviso"
    }
}
if ($logValidacao -match 'resumo-100 tem|resumo-250 tem|Preencha.*[Aa]bstract|Keywords sem abstract') {
    throw 'Aviso indevido para limites inclusivos ou campos opcionais ausentes'
}
$textoValidacao = (& pdftotext -layout "$Diretorio/artigo-validacao.pdf" -) -join "`n"
if ($LASTEXITCODE -ne 0) { throw 'Falha na leitura do caso de validacao' }
if ($textoValidacao -match '(?m)^\s*(Abstract\s*$|Keywords:)') {
    throw 'A ausencia de traducao gerou elementos estrangeiros automaticamente'
}
Write-Host 'Resumo unico, autoria, elementos opcionais e avisos dos limites verificados.'
