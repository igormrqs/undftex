# Regressões de complementos, bibliografia apud e objetos multipágina.
param([string]$Diretorio = '.')
$ErrorActionPreference = 'Stop'
foreach ($nome in 'complementos-artigo', 'complementos-monografia', 'apud', 'objetos-extensos', 'inclusao-pdf') {
    $log = Get-Content "$Diretorio/$nome.log" -Raw
    if ($log -match 'There were undefined|Citation .* undefined|Reference .* undefined|Overfull|destination with the same identifier|duplicate.*destination') {
        throw "Diagnostico estrutural inesperado em $nome.log"
    }
}
foreach ($nome in 'complementos-artigo', 'complementos-monografia') {
    $aux = Get-Content "$Diretorio/$nome.aux" -Raw
    foreach ($id in 'ap-a', 'ap-b', 'an-a', 'an-b') {
        $letra = $id.Substring(3).ToUpperInvariant()
        $tipo = $id.Substring(0, 2)
        $referencias = @{ "$tipo`:$id" = $letra; "sec:$id" = "$letra.1"; "sec:$id-sub" = "$letra.1.1"; "fig:$id" = "$letra.1"; "tab:$id" = "$letra.1"; "eq:$id" = "$letra.1" }
        foreach ($rotulo in $referencias.Keys) {
            $padrao = '\\newlabel\{' + [regex]::Escape($rotulo) + '\}\{\{' + [regex]::Escape($referencias[$rotulo]) + '\}\{\d+\}'
            if ($aux -notmatch $padrao) { throw "Referencia incorreta em $nome`: $rotulo" }
        }
        $designacao = if ($tipo -eq 'ap') { 'APÊNDICE' } else { 'ANEXO' }
        $padraoNome = '\\newlabel\{' + "$tipo`:$id" + '\}\{\{' + $letra + '\}\{\d+\}\{' + $designacao + ' ' + $letra + ' --- '
        if ($aux -notmatch $padraoNome) { throw "Titulo de referencia incorreto em $nome`: $id" }
    }
}
$textoApud = ((& pdftotext -layout "$Diretorio/apud.pdf" -) -join "`n") -replace '\s+', ' '
if ($LASTEXITCODE -ne 0) { throw 'Falha na leitura do PDF de apud' }
foreach ($caso in 1..4) {
    $entradas = [regex]::Match($textoApud, "BIBLIOGRAFIA-CASO-$caso(?<entradas>.*?)FIM-CASO-$caso").Groups['entradas'].Value
    if ($entradas -notmatch 'Fonte consultada de teste') { throw "Fonte consultada ausente no caso $caso" }
    $esperaOriginal = $caso -in @(2, 3)
    if (($entradas -match 'Obra original de teste') -ne $esperaOriginal) { throw "Obra original indevida ou ausente no caso $caso" }
}
$auxObjetos = Get-Content "$Diretorio/objetos-extensos.aux" -Raw
foreach ($objeto in 'pseudocodigo', 'tabela', 'citacao') {
    $paginas = @{}
    foreach ($extremidade in 'inicio', 'fim') {
        $padrao = '\\newlabel\{obj:' + $objeto + '-' + $extremidade + '\}\{\{[^}]*\}\{(?<pagina>\d+)\}'
        $pagina = [regex]::Match($auxObjetos, $padrao).Groups['pagina'].Value
        if (-not $pagina) { throw "Rotulo multipagina ausente: $objeto-$extremidade" }
        $paginas[$extremidade] = [int]$pagina
    }
    if ($paginas['fim'] -le $paginas['inicio']) { throw "Objeto nao atravessou paginas: $objeto" }
}
$textoInclusao = (& pdftotext -layout "$Diretorio/inclusao-pdf.pdf" -) -join "`n"
if ($LASTEXITCODE -ne 0) { throw 'Falha na leitura do teste de inclusao de PDF' }
if ([regex]::Matches($textoInclusao, 'SENTINELA-PDF-EXTERNO').Count -ne 2 -or
    $textoInclusao -notmatch 'APÊNDICE A' -or $textoInclusao -notmatch 'ANEXO A') {
    throw 'A inclusao do PDF em apendice ou anexo falhou'
}
Write-Host 'Complementos, referencias cruzadas, apud e objetos multipagina verificados.'
