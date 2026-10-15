# Estrutura do projeto

Este documento descreve a organização técnica do UnDF-TeX para facilitar manutenção futura.

## Entrada pública

O arquivo `undftex.cls`, localizado na raiz, é a entrada pública usada por:

```tex
\documentclass{undftex}
```

Ele apenas encaminha para `src/undftex.cls`, onde a classe é realmente carregada.

## Classe principal

`src/undftex.cls`:

- exige LuaLaTeX;
- carrega `report` com `12pt`, `a4paper` e `oneside`;
- define caminhos internos de entrada;
- carrega os módulos do núcleo, identidade, ABNT e bibliografia.

## Núcleo técnico

`src/core/` concentra recursos gerais:

- `undf-engine.sty`: configuração básica de motor e codificação;
- `undf-metadata.sty`: metadados do trabalho, autoria, orientador, banca e ficha catalográfica;
- `undf-files.sty`: leitura modular de arquivos e conteúdos opcionais;
- `undf-layout.sty`: margens, espaçamentos e aparência geral;
- `undf-titles.sty`: títulos e seções;
- `undf-headings.sty`: títulos especiais sem numeração e âncoras para entradas manuais no sumário;
- `undf-structure.sty`: transição entre partes pré-textual, textual e pós-textual;
- `undf-toccore.sty`: ajustes de sumário;
- `undf-crossrefs.sty`: figuras, figuras comparativas, fluxogramas, tabelas, equações, pseudocódigo e referências cruzadas;
- `undf-hyperref.sty`: configuração de links.

## Identidade institucional

`src/identity/` concentra a apresentação institucional:

- `undf-identity.sty`: logo institucional fixa e parâmetros internos da capa;
- `undf-cover.sty`: capa;
- `undf-titlepages.sty`: folha de rosto, folha de aprovação, errata, dedicatória, agradecimentos, epígrafe e atalhos relacionados.

## Camada ABNT

`src/abnt/` reúne módulos por norma ou família de elementos carregados pela classe:

- `abnt-nbr14724-2024.sty`: estrutura de trabalhos acadêmicos, listas, apêndices, anexos e glossário;
- `abnt-nbr6028-2021.sty`: resumo, resumo em língua estrangeira, palavras-chave e validação de tamanho;
- `abnt-nbr6027-2012.sty`: sumário;
- `abnt-nbr6023-2025.sty`: registro da implementação bibliográfica atual com BibLaTeX/Biber.

Também existem dois arquivos puramente documentais em `src/abnt/`, sem código executável, mantidos para preservar o mapa "um arquivo por norma": `abnt-nbr10520-2023.sty` (citações, implementadas de fato por `src/biblatex/undf-biblatex.sty` e `undf-abnt.cbx`) e `abnt-nbr6024-2012.sty` (numeração progressiva, implementada de fato por `undf-titles.sty` e `undf-toccore.sty`). Carregá-los é inofensivo: cada um aponta, em comentário, onde a norma correspondente é implementada.

## Bibliografia

`src/biblatex/undf-biblatex.sty` configura `biblatex` com:

- backend `biber`;
- estilo `undf-abnt`;
- comandos amigáveis para citações indiretas, diretas, longas, apud e referência completa.

Os arquivos `undf-abnt.bbx` e `undf-abnt.cbx` ficam em `src/biblatex/`, junto da camada institucional que configura o `biblatex`.

## Modelos de conteúdo

O projeto mantém os seguintes fluxos:

- modelo em branco: `tcc.tex`, `capitulos/` (incluindo a seção opcional `04-dados.tex`), `obrigatorio/`, `opcional/`;
- monografia preenchida: `tcc-exemplo-undf.tex`, `exemplo/capitulos/`, `exemplo/obrigatorio/`, `exemplo/opcional/`;
- artigo para preenchimento: `artigo.tex` (autônomo) e `tcc-artigo.tex` (entrega institucional), compartilhando `artigo/`;
- artigo preenchido: `artigo-exemplo-undf.tex` (autônomo) e `tcc-artigo-exemplo-undf.tex` (entrega institucional), compartilhando o conteúdo em `exemplo/artigo/`.

Ao alterar a interface pública do template, verifique os fluxos afetados nos dois perfis.

## Manuais

O projeto mantém dois documentos autônomos e um volume integrado:

- `manuais/parte-ii/`: manual técnico de uso e manutenção do UnDF-TeX;
- `manuais/parte-i/`: manual acadêmico de elaboração de TCC, sem foco em comandos LaTeX;
- `manuais/estilos/`: estilos LaTeX específicos de cada parte e do volume integrado;
- `manuais/manual-completo.tex`: fonte do volume integrado, com um único sumário.

Alterações de estrutura ou aparência do template devem ser conferidas nos exemplos visuais e nas orientações correspondentes dos dois manuais.

Para compilar os documentos, execute LuaLaTeX no diretório de cada fonte principal:

- `manuais/parte-i/`: `manual-tcc-undf.tex`;
- `manuais/parte-ii/`: `manual-undf.tex`;
- `manuais/`: `manual-completo.tex`.

## Infraestrutura de compilação

- `.latexmkrc`: configuração do `latexmk` (LuaLaTeX + Biber, extensão `lofl` da lista de fluxogramas, limpeza de artefatos). Lida automaticamente pelo Overleaf.
- `.github/workflows/build.yml`: integração contínua que compila os seis modelos e os casos de regressão em ambiente limpo a cada push/pull request.

## Regra de manutenção

Mudanças devem ser pequenas, rastreáveis e compatíveis com a estrutura atual. Antes de criar um novo módulo, confirme se a responsabilidade não pertence a um arquivo já existente.
