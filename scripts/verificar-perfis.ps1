# Compila os modelos e verifica os contadores dos dois perfis, sem exigir Perl.
param([string[]]$Documentos = @('tcc.tex', 'tcc-exemplo-undf.tex', 'artigo.tex', 'tcc-artigo.tex', 'artigo-exemplo-undf.tex', 'tcc-artigo-exemplo-undf.tex', 'portfolio.tex', 'portfolio-exemplo-undf.tex', 'relatorio-projeto.tex', 'relatorio-projeto-aplicado.tex', 'relatorio-projeto-aplicado-exemplo-undf.tex', 'negocio-tecnologico.tex', 'relatorio-projeto-exemplo-undf.tex', 'negocio-tecnologico-exemplo-undf.tex', 'tests/artigo-opcionais.tex', 'tests/complementos-artigo.tex', 'tests/complementos-monografia.tex', 'tests/apud.tex', 'tests/objetos-extensos.tex', 'tests/pagina-externa.tex', 'tests/inclusao-pdf.tex', 'tests/bibliografia-listas.tex', 'tests/bibliografia-datas.tex', 'tests/bibliografia-desambiguacao.tex', 'tests/bibliografia-apud.tex', 'tests/bibliografia-eletronicos.tex', 'tests/bibliografia-responsabilidades.tex', 'tests/bibliografia-recipientes.tex', 'tests/bibliografia-autoria.tex', 'tests/bibliografia-ordenacao.tex', 'tests/bibliografia-integridade.tex', 'tests/bibliografia-partes.tex', 'tests/bibliografia-periodicos.tex', 'tests/bibliografia-notas.tex', 'tests/bibliografia-titulos.tex', 'tests/bibliografia-numerais.tex', 'tests/bibliografia-academicos.tex', 'tests/bibliografia-legislacao.tex', 'tests/bibliografia-eventos.tex', 'tests/bibliografia-periodicos-integrais.tex', 'tests/bibliografia-patentes.tex', 'tests/bibliografia-tradutores.tex'))
$ErrorActionPreference = 'Stop'
Push-Location (Split-Path $PSScriptRoot -Parent)
try {
    New-Item -ItemType Directory -Force -Path build/perfis | Out-Null
    foreach ($documento in $Documentos) {
        $nome = [System.IO.Path]::GetFileNameWithoutExtension($documento)
        Write-Host "Compilando $documento"
        & lualatex -interaction=nonstopmode -halt-on-error -output-directory=build/perfis $documento > "build/perfis/$nome-passagem-1.txt" 2>&1
        if ($LASTEXITCODE -ne 0) { throw "LuaLaTeX falhou: build/perfis/$nome-passagem-1.txt" }
        & biber --input-directory=build/perfis --output-directory=build/perfis $nome > "build/perfis/$nome-biber.txt" 2>&1
        if ($LASTEXITCODE -ne 0) { throw "Biber falhou: build/perfis/$nome-biber.txt" }
        foreach ($passagem in 2..3) {
            & lualatex -interaction=nonstopmode -halt-on-error -output-directory=build/perfis $documento > "build/perfis/$nome-passagem-$passagem.txt" 2>&1
            if ($LASTEXITCODE -ne 0) { throw "LuaLaTeX falhou: build/perfis/$nome-passagem-$passagem.txt" }
        }
        if (Select-String -Path "build/perfis/$nome.log" -Pattern 'Citation .* undefined|Reference .* undefined|There were undefined|Please \(re\)run Biber|Rerun to get') {
            throw "Referências ainda não resolvidas: build/perfis/$nome.log"
        }
    }
    if ('tests/bibliografia-academicos.tex' -in $Documentos) {
        New-Item -ItemType Directory -Force -Path build/perfis/datamodel-academicos | Out-Null
        & biber --validate-datamodel --input-directory=build/perfis --output-directory=build/perfis/datamodel-academicos bibliografia-academicos > build/perfis/datamodel-academicos/validacao.txt 2>&1
        if ($LASTEXITCODE -ne 0) { throw 'Biber falhou na validacao do modelo academico' }
    }
    if ('tests/bibliografia-periodicos-integrais.tex' -in $Documentos) {
        New-Item -ItemType Directory -Force -Path build/perfis/datamodel-periodicos | Out-Null
        & biber --validate-datamodel --input-directory=build/perfis --output-directory=build/perfis/datamodel-periodicos bibliografia-periodicos-integrais > build/perfis/datamodel-periodicos/validacao.txt 2>&1
        if ($LASTEXITCODE -ne 0) { throw 'Biber falhou na validacao do modelo de periodicos' }
    }
    if ('tests/bibliografia-patentes.tex' -in $Documentos) {
        New-Item -ItemType Directory -Force -Path build/perfis/datamodel-patentes | Out-Null
        & biber --validate-datamodel --input-directory=build/perfis --output-directory=build/perfis/datamodel-patentes bibliografia-patentes > build/perfis/datamodel-patentes/validacao.txt 2>&1
        if ($LASTEXITCODE -ne 0) { throw 'Biber falhou na validacao do modelo de patentes' }
    }
    foreach ($perfil in 'artigo', 'monografia') {
        & lualatex -interaction=nonstopmode -halt-on-error -output-directory=build/perfis "tests/perfil-$perfil.tex" > "build/perfis/teste-$perfil.txt" 2>&1
        if ($LASTEXITCODE -ne 0) { throw "Teste de $perfil falhou: build/perfis/teste-$perfil.txt" }
    }
    & lualatex -interaction=nonstopmode -halt-on-error -output-directory=build/perfis tests/artigo-validacao.tex > build/perfis/teste-validacao.txt 2>&1
    if ($LASTEXITCODE -ne 0) { throw 'Teste de validacao falhou: build/perfis/teste-validacao.txt' }
    & "$PSScriptRoot/verificar-artigo.ps1" -Diretorio build/perfis -Documentos $Documentos
    & "$PSScriptRoot/verificar-relatorios.ps1" -Diretorio build/perfis -Documentos $Documentos
    if (@('tests/complementos-artigo.tex', 'tests/complementos-monografia.tex', 'tests/apud.tex', 'tests/objetos-extensos.tex', 'tests/inclusao-pdf.tex' | Where-Object { $_ -notin $Documentos }).Count -eq 0) {
        & "$PSScriptRoot/verificar-estrutura.ps1" -Diretorio build/perfis
    }
    foreach ($bibliografia in 'bibliografia-listas', 'bibliografia-datas', 'bibliografia-desambiguacao', 'bibliografia-apud', 'bibliografia-eletronicos', 'bibliografia-responsabilidades', 'bibliografia-recipientes', 'bibliografia-autoria', 'bibliografia-ordenacao', 'bibliografia-integridade', 'bibliografia-partes', 'bibliografia-periodicos', 'bibliografia-notas', 'bibliografia-titulos', 'bibliografia-numerais', 'bibliografia-academicos', 'bibliografia-legislacao', 'bibliografia-eventos', 'bibliografia-periodicos-integrais', 'bibliografia-patentes', 'bibliografia-tradutores') {
        if ("tests/$bibliografia.tex" -in $Documentos) {
            & "$PSScriptRoot/verificar-bibliografia.ps1" -Diretorio build/perfis -Documento $bibliografia
        }
    }
    Write-Host 'Modelos compilados e contadores dos perfis verificados em build/perfis/.'
} finally {
    Pop-Location
}
