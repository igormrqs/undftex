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

O trio `tests/bibliografia-notas.tex`/`.bib`/`.json` verifica notas materiais,
complementos distintos e controles de duplicação; os casos reais usam as dez
bases já distribuídas, sem duplicar ou alterar seus registros.

F03-G / AF03-03: títulos com grupos ou comandos são preservados na impressão.
Inglês simples declarado em langid=english usa artigo e palavra seguinte;
outros idiomas declarados conservam título completo. shorttitle explícito
prevalece. Teste: scripts/verificar-perfis.ps1 -Documentos @('tests/bibliografia-titulos.tex').
O trio tests/bibliografia-titulos.tex/.bib/.json contém 23 controles permanentes.

F03-H / AF03-04: inteiros ASCII simples de até nove dígitos nos títulos recebem
chave auxiliar de ordenação crescente. Campos explícitos prevalecem; TeX, herança,
decimais e códigos exigem `sorttitle` editorial. Zeros iniciais são preservados;
valores iguais desempatam pela grafia completa, sem fundir registros. O trio
`tests/bibliografia-numerais.tex/.bib/.json` contém 32 cenários. Reproduza com
`./scripts/verificar-perfis.ps1 -Documentos @('tests/bibliografia-numerais.tex')`.

F03-I / AF03-05: `src/biblatex/undf-abnt.dbx` acrescenta somente
`undfdepositdate` e `undfdefensedate` ao modelo de dados acadêmico. `date/year`
continua bibliográfico. Natureza literal, instituição e local vêm da fonte;
a falta de dados gera aviso, sem inferência. Os aliases recebem terminologia
brasileira apenas no driver acadêmico. O trio
`tests/bibliografia-academicos.tex/.bib/.json` contém 36 cenários. Execute
`./scripts/verificar-perfis.ps1 -Documentos @('tests/bibliografia-academicos.tex')`.

F03-J: `tests/bibliografia-legislacao.bib`, `.tex` e `.json` formam a suíte permanente de 35 cenários legais; integrados ao verificador bibliográfico, perfis e workflow existente. Nenhum novo campo do modelo de dados.

F03-K1: `tests/bibliografia-eventos.tex`, `.bib` e `.json` integram a regressão local e o workflow existente com 41 cenários. As mudanças bibliográficas são restritas aos tipos de eventos e seus aliases documentados; não há novo modelo de dados.

F03-K2: `tests/bibliografia-periodicos-integrais.tex`, `.bib` e `.json` integram a regressão com 40 cenários. O tipo nativo `periodical` recebe contrato explícito para coleção/fascículo e autorização dos campos nativos de publicação e suporte. Não é registrado um tipo novo. A integração ao workflow inclui somente a fixture e sua validação de modelo de dados.

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
