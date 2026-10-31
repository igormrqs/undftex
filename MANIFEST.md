# Manifesto do trabalho

Este arquivo identifica, para fins práticos de distribuição sob LPPL, os grupos de arquivos que compõem o trabalho UnDF-TeX.

## Trabalho

O trabalho UnDF-TeX é composto por:

- `undftex.cls`;
- `src/undftex.cls`;
- módulos LaTeX em `src/`;
- estilos bibliográficos em `src/biblatex/`, incluindo `undf-abnt.bbx` e `undf-abnt.cbx`;
- modelos `tcc.tex`, `tcc-exemplo-undf.tex`, `artigo.tex`, `tcc-artigo.tex`, `artigo-exemplo-undf.tex` e `tcc-artigo-exemplo-undf.tex`;
- registros parciais `relatorio-projeto-aplicado.tex` e `relatorio-projeto-aplicado-exemplo-undf.tex`;
- portfólio final `portfolio.tex` e `portfolio-exemplo-undf.tex`;
- modelos finais `relatorio-projeto.tex` e `negocio-tecnologico.tex`, exemplos `relatorio-projeto-exemplo-undf.tex` e `negocio-tecnologico-exemplo-undf.tex` e conteúdo em `modelos/` e `exemplo/`;
- conteúdos de exemplo em `capitulos/`, `obrigatorio/`, `opcional/`, `exemplo/` e `artigo/`;
- recursos visuais próprios em `figuras/` e `identidade/`;
- manual técnico do template em `manuais/parte-ii/`;
- manual acadêmico de TCC em `manuais/parte-i/`;
- volume integrado em `manuais/manual-completo.tex`;
- documentação e metadados de distribuição em `README.md`, `CONTRIBUTING.md`, `CHANGELOG.md`, `VERSION.txt`, `LICENSE`, `LICENSE-LPPL-1.3c.tex`, `MANIFEST.md` e `docs/`;
- infraestrutura de compilação e verificação em `.latexmkrc`, `.github/workflows/`, `scripts/` e `tests/`.

As regressões bibliográficas distribuídas incluem `tests/bibliografia-listas.tex`,
`tests/bibliografia-listas.bib`, `tests/bibliografia-listas.json` e
`scripts/verificar-bibliografia.ps1`.
Também incluem os trios `.tex`/`.bib`/`.json` de
`tests/bibliografia-datas`, `tests/bibliografia-desambiguacao` e
`tests/bibliografia-apud`, para datas, rótulos autor-data e filtros de apud.
O trio `tests/bibliografia-eletronicos.tex`/`.bib`/`.json` verifica DOI, URL,
acesso, hiperlinks e referências que atravessam páginas.
O trio `tests/bibliografia-responsabilidades.tex`/`.bib`/`.json` confere nomes,
funções editoriais e a distinção entre autoria da parte e do recipiente.
O trio `tests/bibliografia-recipientes.tex`/`.bib`/`.json` verifica subtítulos,
conjuntos, volumes e herança sem atribuição indevida do DOI do recipiente.
O trio `tests/bibliografia-autoria.tex`/`.bib`/`.json` verifica autoria literal,
entrada pelo título, rótulos, letras e identificação nos quatro apud.
O trio `tests/bibliografia-ordenacao.tex`/`.bib`/`.json` cobre o contrato
de ordenação e os ajustes explícitos sem modificar o esquema `nyt`.
O trio `tests/bibliografia-integridade.tex`/`.bib`/`.json` verifica dados
essenciais ausentes, pontuação e diagnósticos de bibliografias e referências pontuais.

O trio `tests/bibliografia-partes.tex`/`.bib`/`.json` verifica a identidade
da parte sem autor, a responsabilidade do recipiente e controles de herança.

O trio `tests/bibliografia-periodicos.tex`/`.bib`/`.json` verifica títulos
e subtítulos do artigo e do periódico, herança, pontuação e campos eletrônicos.

## Fora do trabalho distribuído

Não fazem parte do trabalho distribuído por padrão:

- arquivos auxiliares gerados por compilação LaTeX;
- PDFs compilados localmente;
- caches, logs e arquivos temporários;
- cópias integrais de normas ABNT;
- arquivos grandes, imagens originais pesadas ou arquivos usados apenas para teste local;
- credenciais, configurações pessoais de editor ou dados privados.

## Manutenção

Ao adicionar arquivos de código, documentação, exemplo ou identidade visual que devam ser distribuídos com o projeto, atualize este manifesto.
