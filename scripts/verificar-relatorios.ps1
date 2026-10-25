# Confere os elementos institucionais e a abertura das referencias dos relatorios finais.
param(
    [string]$Diretorio = '.',
    [string[]]$Documentos = @('relatorio-projeto.tex', 'negocio-tecnologico.tex', 'relatorio-projeto-exemplo-undf.tex', 'negocio-tecnologico-exemplo-undf.tex')
)
$ErrorActionPreference = 'Stop'
foreach ($documento in $Documentos) {
    $nome = [System.IO.Path]::GetFileNameWithoutExtension($documento)
    if ($nome -notin @('relatorio-projeto', 'negocio-tecnologico', 'relatorio-projeto-exemplo-undf', 'negocio-tecnologico-exemplo-undf')) { continue }
    $texto = (& pdftotext -layout "$Diretorio/$nome.pdf" -) -join "`n"
    if ($LASTEXITCODE -ne 0) { throw "Falha na leitura de $nome.pdf" }
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
    $fim = if ($nome -like 'relatorio-projeto*') { 7 } else { 8 }
    if ($texto -notmatch "(?m)^\s*$fim\s+CONCLUSÃO\s*$") {
        throw "Estrutura de relatorio final incompleta em $nome"
    }
    $log = (Get-Content "$Diretorio/$nome.log" -Raw) -replace '\s+', ' '
    if ($log -match 'Overfull|Citation .* undefined|There were undefined|recomenda de 150 a 500') {
        throw "Aviso inesperado em $nome.log"
    }
}
Write-Host 'Relatorios finais: elementos institucionais, resumo unico, estrutura e referencias verificados.'
