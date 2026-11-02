# Regressao F01/F02: verifica texto do PDF e falhas de inclusao. Requer LuaLaTeX e pdftotext.
param([ValidateSet('Todos', 'F01', 'F02')][string]$Caso = 'Todos')
$ErrorActionPreference = 'Stop'
. "$PSScriptRoot/contratos-ci.ps1"
Push-Location (Split-Path $PSScriptRoot -Parent)
try {
    $diretorio = 'build/integridade'
    New-Item -ItemType Directory -Force -Path $diretorio | Out-Null
    function Compilar([string]$Nome, [string]$Conteudo, [switch]$FalhaEsperada, [string]$ErroEsperado = 'Capitulo obrigatorio ausente') {
        $fonte = "$diretorio/$Nome.tex"
        Set-Content -LiteralPath $fonte -Value $Conteudo -Encoding utf8
        & lualatex -no-shell-escape -interaction=nonstopmode -halt-on-error "-output-directory=$diretorio" $fonte > "$diretorio/$Nome-saida.txt" 2>&1
        $codigo = $LASTEXITCODE
        if ($FalhaEsperada) {
            $logEsperado = Get-Content -LiteralPath "$diretorio/$Nome.log" -Raw
            Confirmar-FalhaEsperada $codigo $logEsperado $ErroEsperado
            return
        }
        if ($codigo -ne 0) { throw "LuaLaTeX falhou: $diretorio/$Nome-saida.txt" }
        Confirmar-Saidas $diretorio $Nome @('pdf', 'log')
    }
    function Ler-Pdf([string]$Nome) {
        $texto = (& pdftotext -layout "$diretorio/$Nome.pdf" -) -join "`n"
        if ($LASTEXITCODE -ne 0) { throw "Falha na leitura de $Nome.pdf" }
        return $texto -replace '\s+', ' '
    }
    if ($Caso -in @('Todos', 'F01')) {
        $casos = @(Get-Content -LiteralPath tests/nomes-pessoas.json -Raw -Encoding utf8 | ConvertFrom-Json)
        if ($casos.Count -ne 35) { throw 'F01 exige os 35 casos de nomes cadastrados' }
        $linhas = @(
            '\documentclass{undftex}',
            '\autor{Estudante de Sá}\titulo{Integridade dos nomes}\curso{Curso de teste}',
            '\orientador{Prof. Dr. Marcos de Almeida}\coorientador{Profa. Dra. Maria da Silva}',
            '\begin{document}\undffolhaderosto\clearpage\raggedright'
        )
        for ($i = 0; $i -lt $casos.Count; $i++) {
            $id = 'N{0:D2}' -f ($i + 1)
            $linhas += "\noindent ${id}: \undfprintpersonname{$($casos[$i].entrada)}\par"
        }
        $linhas += '\end{document}'
        Compilar 'nomes-pessoas' ($linhas -join "`n")
        $texto = Ler-Pdf 'nomes-pessoas'
        $falhas = @()
        for ($i = 0; $i -lt $casos.Count; $i++) {
            $id = 'N{0:D2}' -f ($i + 1)
            if ($texto -notmatch ([regex]::Escape("${id}: $($casos[$i].esperado)") + '(?= N\d\d:| \d+ | $)')) {
                $falhas += "$id preservacao/tratamento incorreto: $($casos[$i].entrada)"
            }
        }
        foreach ($esperado in 'ESTUDANTE DE SÁ', 'Orientador: Marcos de Almeida', 'Coorientador: Maria da Silva') {
            if ($texto -notmatch [regex]::Escape($esperado)) { $falhas += "Metadado incorreto: $esperado" }
        }
        if ($falhas.Count -gt 0) { throw ($falhas -join "`n") }
        Write-Host "F01: $($casos.Count) nomes e metadados conferidos no PDF."
    }
    if ($Caso -in @('Todos', 'F02')) {
        Set-Content -LiteralPath "$diretorio/capitulo-um.tex" -Value '\chapter{Capitulo um}SENTINELA-UM.' -Encoding utf8
        Set-Content -LiteralPath "$diretorio/capitulo dois.tex" -Value '\chapter{Capitulo dois}SENTINELA-DOIS.' -Encoding utf8
        Set-Content -LiteralPath "$diretorio/opcional.tex" -Value 'SENTINELA-OPCIONAL.' -Encoding utf8
        $corpo = @'
\undfincludechapter{build/integridade/capitulo-um}
\undfinputoptional{build/integridade/arquivo-opcional-inexistente}
\undfinputoptional{build/integridade/opcional}
\undfincludechapter{build/integridade/capitulo dois}
'@
        Compilar 'inclusoes-validas' ("\documentclass{undftex}`n\begin{document}`n$corpo`n\end{document}")
        $texto = Ler-Pdf 'inclusoes-validas'
        if ($texto -notmatch 'SENTINELA-UM.*SENTINELA-OPCIONAL.*SENTINELA-DOIS') {
            throw 'Conteudo ausente ou fora de ordem nas inclusoes validas'
        }
        foreach ($nome in 'obrigatorio-ausente', 'caminho-incorreto', 'ausente-apos-capitulo') {
            $caminho = if ($nome -eq 'caminho-incorreto') { 'build/integridade/pasta-incorreta/capitulo-um' } else { 'build/integridade/capitulo-inexistente' }
            $anterior = if ($nome -eq 'ausente-apos-capitulo') { '\undfincludechapter{build/integridade/capitulo-um}' } else { '' }
            Compilar $nome ("\documentclass{undftex}`n\begin{document}`n$anterior`n\undfincludechapter{$caminho}`n\end{document}") -FalhaEsperada
            $log = (Get-Content -LiteralPath "$diretorio/$nome.log" -Raw) -replace '\s+', ' '
            $caminhoNoLog = [regex]::Escape(("$caminho.tex" -replace '\s', ''))
            if ($log -notmatch 'Capitulo obrigatorio ausente' -or
                ($log -replace '\s', '') -notmatch $caminhoNoLog) {
                throw "$nome falhou sem identificar o capitulo e o caminho"
            }
        }
        & lualatex -no-shell-escape -interaction=nonstopmode -jobname=inclusao-sem-halt "-output-directory=$diretorio" "$diretorio/obrigatorio-ausente.tex" > "$diretorio/sem-halt-saida.txt" 2>&1
        Confirmar-FalhaEsperada $LASTEXITCODE (Get-Content "$diretorio/inclusao-sem-halt.log" -Raw) 'Capitulo obrigatorio ausente'
        $detectada = $false
        try {
            & "$PSScriptRoot/verificar-perfis.ps1" -Documentos @("$diretorio/obrigatorio-ausente.tex") > "$diretorio/falha-verificador.txt" 2>&1
        } catch {
            $detectada = $_.Exception.Message -match 'LuaLaTeX falhou'
        }
        if (-not $detectada) { throw 'O verificador de perfis nao detectou a falha de inclusao no LuaLaTeX' }
        # O artigo usa input e section; nao se deve introduzir include/chapter nele.
        Compilar 'input-artigo-ausente' '\documentclass[perfil=artigo]{undftex}\begin{document}\input{build/integridade/miolo-artigo-inexistente}\end{document}' -FalhaEsperada -ErroEsperado 'LaTeX Error: File .*miolo-artigo-inexistente\.tex.*not found'
        Write-Host 'F02: obrigatorios, opcionais, espacos, ordem, artigo e falha do verificador conferidos.'
    }
    # Os erros deliberados ja foram conferidos; nao propagar seu exit code como falha da suite.
    $global:LASTEXITCODE = 0
} finally {
    Pop-Location
}
