# Confere registros parciais e relatorios finais, respeitando seus escopos distintos.
param(
    [string]$Diretorio = '.',
    [string[]]$Documentos = @('portfolio.tex', 'portfolio-exemplo-undf.tex', 'relatorio-projeto.tex', 'relatorio-projeto-aplicado.tex', 'relatorio-projeto-aplicado-exemplo-undf.tex', 'negocio-tecnologico.tex', 'relatorio-projeto-exemplo-undf.tex', 'negocio-tecnologico-exemplo-undf.tex')
)
$ErrorActionPreference = 'Stop'
foreach ($documento in $Documentos) {
    $nome = [System.IO.Path]::GetFileNameWithoutExtension($documento)
    if ($nome -notin @('portfolio', 'portfolio-exemplo-undf', 'relatorio-projeto', 'relatorio-projeto-aplicado', 'relatorio-projeto-aplicado-exemplo-undf', 'negocio-tecnologico', 'relatorio-projeto-exemplo-undf', 'negocio-tecnologico-exemplo-undf')) { continue }
    $texto = (& pdftotext -layout "$Diretorio/$nome.pdf" -) -join "`n"
    if ($LASTEXITCODE -ne 0) { throw "Falha na leitura de $nome.pdf" }
    $parcial = $nome -in @('relatorio-projeto-aplicado', 'relatorio-projeto-aplicado-exemplo-undf')
    if ($parcial) {
        foreach ($rotulo in 'RELATÓRIO PARCIAL DO PROJETO', 'CONTEXTO E OBJETIVOS', 'O QUE REALIZEI E COMO', 'DECISÕES, DIFICULDADES E APRENDIZADOS', 'ENTREGAS, RESULTADOS E LIMITES', 'EVIDÊNCIAS PARA RECUPERAR DEPOIS', 'DÚVIDAS E PONTOS A RETOMAR NA ESCRITA', 'FONTES CONSULTADAS') {
            if ($texto -notmatch "(?im)^\s*$rotulo\s*$") { throw "Secao ausente em ${nome}: $rotulo" }
        }
        if ($texto -match '(?m)^\s*(RESUMO|ABSTRACT|SUMÁRIO|REFERÊNCIAS)\s*$' -or $texto -match 'Profa?\.\s+Dra?\.') {
            throw "Registro parcial herdou a apresentacao de TCC: $nome"
        }
    } else {
        foreach ($rotulo in 'RESUMO', 'ABSTRACT', 'SUMÁRIO', 'REFERÊNCIAS') {
            if ([regex]::Matches($texto, "(?m)^\s*$rotulo\s*$").Count -ne 1) {
                throw "Elemento ausente ou duplicado em ${nome}: $rotulo"
            }
        }
        $paginas = $texto -split "`f"
        if ([regex]::Matches($paginas[2], 'Profa?\.\s+Dra?\.').Count -ne 3) {
            throw "Folha de aprovacao com tres membros ausente em $nome"
        }
        $paginaReferencias = ($texto -split "`f" | Where-Object { $_ -match '(?m)^\s*REFERÊNCIAS\s*$' })
        $antesTitulo = ($paginaReferencias -split 'REFERÊNCIAS', 2)[0]
        if (($antesTitulo -replace '[\d\s]', '').Length -ne 0) {
            throw "Referencias devem abrir em pagina propria: $nome"
        }
        $fim = if ($nome -like 'portfolio*') { 6 } elseif ($nome -like 'relatorio-projeto*') { 7 } else { 8 }
        if ($texto -notmatch "(?m)^\s*$fim\s+CONCLUSÃO\s*$") {
            throw "Estrutura de relatorio final incompleta em $nome"
        }
    }
    if (($nome -like 'relatorio-projeto*' -or $nome -like 'portfolio*') -and $texto -match '(?im)^\s*(?:PARTE\s+II\b.*ARTIGO|ARTIGO\s+CIENTÍFICO)\s*$') {
        throw "O relatorio herdou uma parte de artigo: $nome"
    }
    $log = (Get-Content "$Diretorio/$nome.log" -Raw) -replace '\s+', ' '
    if ($log -match 'Overfull|Citation .* undefined|There were undefined|recomenda de 150 a 500') {
        throw "Aviso inesperado em $nome.log"
    }
}
Write-Host 'Registros parciais e relatorios finais: estrutura, apresentacao e fontes verificadas.'
