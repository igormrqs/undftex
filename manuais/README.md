# Manuais do UnDF-TeX

| Publicação | Fonte principal | Finalidade |
| --- | --- | --- |
| Manual acadêmico | [parte-i/manual-tcc-undf.tex](parte-i/manual-tcc-undf.tex) | Elaboração do TCC, metodologia e orientações acadêmicas |
| Guia técnico | [parte-ii/manual-undf.tex](parte-ii/manual-undf.tex) | Uso, arquivos, comandos e compilação do template |
| Volume integrado | [manual-completo.tex](manual-completo.tex) | As duas partes em um volume e um sumário |

As três entradas compartilham fontes; edite os capítulos da parte correspondente,
sem criar cópias do manual. `estilos/` contém a apresentação das publicações.
Os registros de revisão anteriores e as pendências institucionais ficam em
`parte-i/revisao/`; são registros de trabalho, não versões alternativas ativas.
A versão editorial registrada permanece 1.0.0, com situação de minuta.

## Compilar

Execute LuaLaTeX no diretório da fonte principal e direcione as saídas a `build/`:

```powershell
New-Item -ItemType Directory -Force build | Out-Null
lualatex -interaction=nonstopmode -halt-on-error -output-directory=build manual-completo.tex
```

Repita o comando até estabilizar o sumário e as referências internas. Para uma
parte independente, execute em `parte-i/` ou `parte-ii/` e substitua o nome da
fonte. Os PDFs gerados não são versionados.

O **Manual ESETI** é outro projeto, em `../../Manual-ESETI/`, a partir desta
pasta. Ele tem fontes próprias e não recebe sincronização automática deste
volume. As modalidades 1.3 e 1.4 seguem seu roteiro de relatório final;
as exigências por curso continuam sujeitas a conferência institucional.
