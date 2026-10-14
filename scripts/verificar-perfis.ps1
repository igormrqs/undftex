# Compila os modelos e verifica os contadores dos dois perfis, sem exigir Perl.
param([string[]]$Documentos = @('tcc.tex', 'tcc-exemplo-undf.tex', 'tcc-artigo.tex'))
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
    foreach ($perfil in 'artigo', 'monografia') {
        & lualatex -interaction=nonstopmode -halt-on-error -output-directory=build/perfis "tests/perfil-$perfil.tex" > "build/perfis/teste-$perfil.txt" 2>&1
        if ($LASTEXITCODE -ne 0) { throw "Teste de $perfil falhou: build/perfis/teste-$perfil.txt" }
    }
    Write-Host 'Modelos compilados e contadores dos perfis verificados em build/perfis/.'
} finally {
    Pop-Location
}
