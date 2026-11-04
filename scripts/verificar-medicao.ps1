# F04: estado da medicao, notas impressas e contratos de tamanho. Nao publica PDFs.
$ErrorActionPreference = 'Stop'
. "$PSScriptRoot/contratos-ci.ps1"
Push-Location (Split-Path $PSScriptRoot -Parent)
try {
    $diretorio = 'build/f04'
    New-Item -ItemType Directory -Force -Path $diretorio | Out-Null
    $resultados = @()
    function Registrar([string]$Id) {
        $script:resultados += [pscustomobject]@{ id = $Id; aprovado = $true }
        Write-Host "F04 ${Id}: aprovado."
    }
    function Ler-Pdf([string]$Nome) {
        $texto = (& pdftotext -layout "$diretorio/$Nome.pdf" -) -join "`n"
        if ($LASTEXITCODE) { throw "Falha na leitura F04: $Nome" }
        return $texto -replace '\s+', ' '
    }
    $preambulo = @'
\autor{Autora de Teste}\titulo{Regressao F04}\curso{Curso de teste}
\newcounter{fquatro}\newcounter{fquatrofilho}[fquatro]
\newcommand{\FquatroIgual}[2]{\ifnum\value{#1}=#2\relax\else
  \errmessage{F04 contador #1 alterado; esperado #2}\fi}
\newcommand{\FquatroEstado}{%
  \FquatroIgual{footnote}{5}\FquatroIgual{mpfootnote}{6}%
  \FquatroIgual{Hfootnote}{8}\FquatroIgual{fquatro}{7}%
  \FquatroIgual{fquatrofilho}{9}\FquatroIgual{section}{4}\FquatroIgual{subsection}{6}}
\newcommand{\FquatroEfeito}{%
  Texto medido\notarodape{Nota medida}.\footnotemark\footnotetext{Outra nota medida.}%
  \refstepcounter{fquatro}\label{f04-descartado}\stepcounter{section}%
  \cite{original}\cite{oculta}%
  \begin{minipage}{.8\linewidth}Minipagina\notarodape{Nota interna medida.}.\end{minipage}}
\undfsetcontent{resumo}{\FquatroEfeito}
\undfsetcontent{abstract}{\FquatroEfeito}
\undfsetcontent{dedicatoria}{\FquatroEfeito}
\undfsetcontent{agradecimentos}{\FquatroEfeito}
\undfsetcontent{epigrafe}{\FquatroEfeito}
\errataref{Referencia da errata}\erratatexto{\FquatroEfeito}
\dadoscatalograficos{\FquatroEfeito}
\addbibresource{build/f04/medicao.bib}
'@
    $medicao = @'
\setcounter{footnote}{5}\setcounter{mpfootnote}{6}\setcounter{Hfootnote}{8}
\setcounter{fquatro}{7}\setcounter{fquatrofilho}{9}
\setcounter{section}{4}\setcounter{subsection}{6}
\undfvalidateonepagecontents\FquatroEstado
\undfvalidateonepagecontents\FquatroEstado
\makeatletter
\ifcsdef{undf@consultada@0:original}{\errmessage{F04 citacao medida marcou fonte como consultada}}{}
\ifcsdef{undf@consultada@0:oculta}{\errmessage{F04 citacao oculta registrada}}{}
\makeatother
\undfresetpretextualcontents\errataref{}\erratatexto{}\limparcatalogacao
\setcounter{footnote}{0}\setcounter{Hfootnote}{0}\setcounter{mpfootnote}{0}
\setcounter{section}{0}\setcounter{subsection}{0}
'@
    $monografia = @'
\undfsetcontent{agradecimentos}{Primeira chamada\notarodape{NOTA-PRETEXTO-UM.\label{f04-nota}}.
Segunda chamada\notarodape{NOTA-PRETEXTO-DOIS.}.}
\input{modelos/comum/pre-textuais}
\FquatroIgual{footnote}{2}
\chapter{Primeiro capitulo}
Primeira nota textual\notarodape{NOTA-TEXTO-UM.}.\FquatroIgual{footnote}{1}
\clearpage Segunda nota textual\notarodape{NOTA-TEXTO-DOIS.}.\FquatroIgual{footnote}{2}
\chapter{Segundo capitulo}
Nota do novo capitulo\notarodape{NOTA-CAPITULO-DOIS.}.\FquatroIgual{footnote}{1}
'@
    $artigo = @'
\undfsetcontent{resumo}{Resumo de teste do artigo.}
\undfinicioartigo\FquatroIgual{footnote}{0}
\section{Primeira secao}
Primeira nota textual\notarodape{NOTA-TEXTO-UM.\label{f04-nota}}.\FquatroIgual{footnote}{1}
\clearpage Segunda nota textual\notarodape{NOTA-TEXTO-DOIS.}.\FquatroIgual{footnote}{2}
\section{Segunda secao}
Nota da nova secao\notarodape{NOTA-SECAO-DOIS.}.\FquatroIgual{footnote}{3}
'@
    $final = @'
\par\begin{minipage}{.8\linewidth}Nota local\notarodape{NOTA-MINIPAGINA.}.
\FquatroIgual{mpfootnote}{1}\end{minipage}\par
Nota explicita\footnote[7]{NOTA-EXPLICITA.}.
Nota automatica\notarodape{NOTA-AUTOMATICA.}.
\noindent Referencia-nota: \ref{f04-nota}.\par
Citacao real: \apudbib{original}{consultada}.
\printundfreferences
\end{document}
'@
    Set-Content -LiteralPath "$diretorio/medicao.bib" -Encoding utf8 -Value @'
@book{original, author={Origem, Autora}, title={ORIGINAL-NAO-CONSULTADA}, year={2001}}
@book{consultada, author={Consulta, Autora}, title={FONTE-CONSULTADA-F04}, year={2026}, location={Brasilia}, publisher={Editora Teste}}
@book{oculta, author={Oculta, Autora}, title={FONTE-SOMENTE-MEDIDA}, year={2020}}
'@
    foreach ($perfil in 'monografia', 'artigo') {
        $nome = "f04-$perfil"
        $corpo = if ($perfil -eq 'artigo') { $artigo } else { $monografia }
        $conteudo = "\documentclass[perfil=$perfil]{undftex}`n$preambulo`n\begin{document}`n$medicao`n$corpo`n$final"
        Set-Content -LiteralPath "$diretorio/$nome.tex" -Value $conteudo -Encoding utf8
        Compilar-Regressao "$diretorio/$nome.tex" $diretorio
        $texto = Ler-Pdf $nome
        foreach ($padrao in '1 NOTA-TEXTO-UM', '2 NOTA-TEXTO-DOIS', '7 NOTA-EXPLICITA', 'a NOTA-MINIPAGINA', 'Referencia-nota: 1', 'FONTE-CONSULTADA-F04') {
            if ($texto -notmatch $padrao) { throw "F04 $perfil nao preservou: $padrao" }
        }
        if ($perfil -eq 'monografia' -and $texto -notmatch '1 NOTA-PRETEXTO-UM.*2 NOTA-PRETEXTO-DOIS.*1 NOTA-CAPITULO-DOIS.*2 NOTA-AUTOMATICA') { throw 'F04 numeracao da monografia incorreta' }
        if ($perfil -eq 'artigo' -and $texto -notmatch '3 NOTA-SECAO-DOIS.*4 NOTA-AUTOMATICA') { throw 'F04 numeracao do artigo incorreta' }
        if ($texto -match 'ORIGINAL-NAO-CONSULTADA|FONTE-SOMENTE-MEDIDA') { throw 'F04 bibliografia contaminada pela medicao' }
        $bcf = [xml](Get-Content -LiteralPath "$diretorio/$nome.bcf" -Raw -Encoding utf8)
        $chaves = @($bcf.SelectNodes("//*[local-name()='citekey']") | ForEach-Object InnerText | Sort-Object -Unique)
        if (Compare-Object $chaves @('consultada', 'original')) { throw 'F04 BCF contaminado ou citacao real ausente' }
        $aux = Get-Content -LiteralPath "$diretorio/$nome.aux" -Raw -Encoding utf8
        $log = Get-Content -LiteralPath "$diretorio/$nome.log" -Raw -Encoding utf8
        if ($aux -match 'f04-descartado' -or $aux -notmatch 'newlabel\{f04-nota\}\{\{1\}') { throw 'F04 labels ausentes ou indevidos' }
        if ($log -match 'duplicate destination|destination with the same identifier|destination.*does not exist') { throw 'F04 destinos de notas invalidos' }
        Registrar "$perfil-estado-sete-elementos-e-repeticao"
        Registrar "$perfil-notas-labels-bcf-e-apud"
    }
    # Exercita a entrada real do TCC; os relatorios usam pre-textuais, coberto acima.
    $tcc = Get-Content -LiteralPath tcc.tex -Raw -Encoding utf8
    $tcc = $tcc.Replace('\begin{document}', '\undfsetcontent{agradecimentos}{Chamada TCC\notarodape{NOTA-TCC-F04.}}' + "`n\begin{document}")
    $tcc = $tcc.Replace('\undfvalidateonepagecontents', '\undfvalidateonepagecontents\ifnum\value{footnote}=0\else\errmessage{F04 nota consumida no TCC}\fi')
    Set-Content -LiteralPath "$diretorio/f04-tcc.tex" -Value $tcc -Encoding utf8
    Compilar-Regressao "$diretorio/f04-tcc.tex" $diretorio
    if ((Ler-Pdf 'f04-tcc') -notmatch '1 NOTA-TCC-F04') { throw 'F04 primeira nota do TCC incorreta' }
    Registrar 'tcc-entrada-real'
    foreach ($bloquear in $false, $true) {
        $nome = if ($bloquear) { 'f04-bloqueio' } else { 'f04-avisos' }
        $politica = if ($bloquear) { '\bloquearresumoslongos' } else { '\avisarresumoslongos' }
        $conteudo = @'
\documentclass{undftex}
\undfsetcontent{resumo}{Curto.}
\begin{document}
\undfvalidateabstractcontents
\undfsetcontent{resumo}{\rule{0pt}{\textheight}Longo.}
POLITICA
\undfvalidateabstractcontents
\undfwarncontentpagefit{resumo}{bloco longo F04}
AVISO-IMPRESSO-F04.
\end{document}
'@.Replace('POLITICA', $politica)
        Set-Content -LiteralPath "$diretorio/$nome.tex" -Value $conteudo -Encoding utf8
        & lualatex -interaction=nonstopmode -halt-on-error "-output-directory=$diretorio" "$diretorio/$nome.tex" > "$diretorio/$nome-saida.txt" 2>&1
        $codigo = $LASTEXITCODE
        $log = (Get-Content -LiteralPath "$diretorio/$nome.log" -Raw -Encoding utf8) -replace '\s', ''
        if ($bloquear) { Confirmar-FalhaEsperada $codigo $log 'resumoultrapassaolimitepraticodeumapagina' } else {
            if ($codigo -ne 0) { throw 'F04 avisos passaram a bloquear' }
            foreach ($padrao in 'resumo parece curto demais', 'resumo parece longo demais', 'bloco longo F04 pode ultrapassar uma pagina', 'NBR 6028 recomenda de') {
                if ($log -notmatch [regex]::Escape(($padrao -replace '\s', ''))) { throw "F04 aviso perdido: $padrao" }
            }
            if ((Ler-Pdf $nome) -notmatch 'AVISO-IMPRESSO-F04') { throw 'F04 documento com aviso nao foi impresso' }
        }
        Registrar $nome
    }
    if ($resultados.Count -ne 7) { throw 'F04 incompleta' }
    New-Item -ItemType Directory -Force -Path build/ci | Out-Null
    $resultados | ConvertTo-Json -Depth 4 | Set-Content -LiteralPath build/ci/f04.json -Encoding utf8
    $global:LASTEXITCODE = 0
} finally { Pop-Location }
