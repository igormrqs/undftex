# Contrato de diretorios de include: mesmas verificacoes em Windows e Linux.
$ErrorActionPreference = 'Stop'
$raiz = Split-Path $PSScriptRoot -Parent
$temporario = Join-Path ([IO.Path]::GetTempPath()) ('undf-aux-' + [guid]::NewGuid().ToString('N'))
$resultados = @()
New-Item -ItemType Directory -Path "$temporario/projeto/scripts" -Force | Out-Null
Copy-Item -LiteralPath "$PSScriptRoot/contratos-ci.ps1" -Destination "$temporario/projeto/scripts/contratos-ci.ps1"
Push-Location "$temporario/projeto"
try {
    . ./scripts/contratos-ci.ps1
    function Registrar([string]$Id) {
        $script:resultados += [pscustomobject]@{ id = $Id; aprovado = $true }
        Write-Host "Auxiliares ${Id}: aprovado."
    }
    function Rejeitar([string]$Id, [scriptblock]$Acao, [string]$Motivo) {
        $rejeitado = $false
        try { & $Acao } catch {
            if ($_.Exception.Message -notmatch $Motivo) { throw }
            $rejeitado = $true
        }
        if (-not $rejeitado) { throw "Caminho/falha indevidamente aceito: $Id" }
        Registrar $Id
    }
    New-Item -ItemType Directory -Force -Path 'fontes/nivel', 'exemplo/capitulos' | Out-Null
    Set-Content principal.tex '\documentclass{article}\begin{document}\input{entrada}\end{document}'
    Set-Content entrada.tex '\include{fontes/nivel/um}\include{exemplo/capitulos/capitulo dois}'
    Set-Content -LiteralPath fontes/nivel/um.tex -Value 'SENTINELA-UM'
    Set-Content -LiteralPath 'exemplo/capitulos/capitulo dois.tex' -Value 'SENTINELA-DOIS'
    $hashFonte = (Get-FileHash -LiteralPath fontes/nivel/um.tex).Hash
    if (Test-Path build/positivo) { throw 'Teste exige saida inicialmente ausente' }
    $luaReal = (Get-Command lualatex -CommandType Application).Source
    function lualatex {
        # Simula apenas a precondicao de diretorios do TeX Live; compila com o motor real.
        foreach ($pasta in 'build/positivo/fontes/nivel', 'build/positivo/exemplo/capitulos') {
            if (-not (Test-Path -LiteralPath $pasta -PathType Container)) { throw "Diretorio nao preparado antes do compilador: $pasta" }
        }
        & $luaReal @args
        $global:LASTEXITCODE = $LASTEXITCODE
    }
    Compilar-Regressao principal.tex build/positivo -SemBibliografia
    Remove-Item Function:lualatex
    Confirmar-Saidas build/positivo/fontes/nivel um @('aux')
    Confirmar-Saidas build/positivo/exemplo/capitulos 'capitulo dois' @('aux')
    $texto = (& pdftotext build/positivo/principal.pdf -) -join ' '
    if ($LASTEXITCODE -ne 0 -or $texto -notmatch 'SENTINELA-UM' -or $texto -notmatch 'SENTINELA-DOIS') { throw 'Conteudo das inclusoes ausente' }
    if ((Get-FileHash -LiteralPath fontes/nivel/um.tex).Hash -ne $hashFonte -or (Test-Path build/positivo/fontes/nivel/um.tex)) { throw 'Fonte alterada ou copiada para build' }
    Registrar 'A01-diretorios-antes-do-compilador-aux-e-conteudo'
    # O wrapper institucional e fontes geradas por F02 tambem precisam de pastas.
    Set-Content wrapper.tex '\undfincludechapter{build/integridade/capitulo gerado}'
    Preparar-DiretoriosAuxiliares wrapper.tex build/wrapper
    if (-not (Test-Path -LiteralPath build/wrapper/build/integridade -PathType Container)) { throw 'Pasta de fonte gerada nao preparada' }
    Registrar 'A02-wrapper-e-caminho-gerado'
    Set-Content comentario.tex '% \include{../nao-executado}'
    Preparar-DiretoriosAuxiliares comentario.tex build/comentario
    Registrar 'A03-inclusao-comentada-ignorada'
    Rejeitar 'A04-saida-fora-de-build' { Preparar-DiretoriosAuxiliares principal.tex fora } 'fora da area de compilacao'
    Rejeitar 'A05-traversal-na-saida' { Preparar-DiretoriosAuxiliares principal.tex build/../../fora } 'Caminho auxiliar nao autorizado'
    Set-Content proibido.tex '\include{../fora/capitulo}'
    Rejeitar 'A06-traversal-na-inclusao' { Preparar-DiretoriosAuxiliares proibido.tex build/proibido } 'Caminho auxiliar nao autorizado'
    $absoluto = Join-Path ([IO.Path]::GetTempPath()) 'capitulo-nao-autorizado'
    Set-Content proibido.tex ("\include{$absoluto}")
    Rejeitar 'A07-inclusao-absoluta' { Preparar-DiretoriosAuxiliares proibido.tex build/proibido } 'Caminho auxiliar nao autorizado'
    Set-Content proibido.tex '\include{\caminhoDinamico}'
    Rejeitar 'A08-inclusao-dinamica' { Preparar-DiretoriosAuxiliares proibido.tex build/proibido } 'Caminho auxiliar nao autorizado'
    New-Item -ItemType Directory -Path "$temporario/fora" | Out-Null
    $tipoLink = if ($IsWindows) { 'Junction' } else { 'SymbolicLink' }
    New-Item -ItemType $tipoLink -Path build/atalho -Target "$temporario/fora" | Out-Null
    Rejeitar 'A09-link-na-saida' { Preparar-DiretoriosAuxiliares principal.tex build/atalho/escape } 'Link nao autorizado'
    New-Item -ItemType $tipoLink -Path atalho -Target "$temporario/fora" | Out-Null
    Set-Content proibido.tex '\include{atalho/capitulo}'
    Rejeitar 'A10-link-na-inclusao' { Preparar-DiretoriosAuxiliares proibido.tex build/proibido } 'Link nao autorizado'
    Set-Content falha.tex '\documentclass{article}\begin{document}\ComandoInexistente\end{document}'
    New-Item -ItemType Directory -Path build/falha | Out-Null
    Copy-Item -LiteralPath build/positivo/principal.pdf -Destination build/falha/falha.pdf
    Rejeitar 'A11-erro-real-nao-aceita-pdf-antigo' { Compilar-Regressao falha.tex build/falha -SemBibliografia } 'LuaLaTeX falhou'
    Set-Content vazio.tex '\documentclass{article}\begin{document}Controle\end{document}'
    function lualatex { $global:LASTEXITCODE = 0 }
    Rejeitar 'A12-retorno-zero-sem-produtos' { Compilar-Regressao vazio.tex build/vazio -SemBibliografia } 'Saida obrigatoria ausente ou vazia'
    Remove-Item Function:lualatex
    if ($resultados.Count -ne 12) { throw 'Testes auxiliares incompletos' }
    New-Item -ItemType Directory -Force -Path "$raiz/build/ci" | Out-Null
    $resultados | ConvertTo-Json -Depth 4 | Set-Content -LiteralPath "$raiz/build/ci/auxiliares.json" -Encoding utf8
    $global:LASTEXITCODE = 0
} finally {
    Pop-Location
    $prefixo = [IO.Path]::GetFullPath((Join-Path ([IO.Path]::GetTempPath()) 'undf-aux-'))
    $alvo = [IO.Path]::GetFullPath($temporario)
    if (-not $alvo.StartsWith($prefixo, [StringComparison]::OrdinalIgnoreCase)) { throw 'Limpeza fora da copia descartavel recusada' }
    Remove-Item -LiteralPath $alvo -Recurse -Force
}
