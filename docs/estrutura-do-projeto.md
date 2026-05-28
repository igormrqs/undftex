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
- `abnt-nbr6023-2025.sty`: registro da decisão de usar BibLaTeX/Biber como fluxo oficial de referências.

Também existem arquivos normativos auxiliares em `src/abnt/`, como `abnt-nbr10520-2023.sty` e `abnt-nbr6024-2012.sty`. No fluxo atual, citações e referências são fornecidas por `src/biblatex/undf-biblatex.sty`, e a numeração progressiva é aplicada pela combinação de `undf-titles.sty`, `undf-toccore.sty` e `abnt-nbr6027-2012.sty`.

## Bibliografia

`src/biblatex/undf-biblatex.sty` configura `biblatex` com:

- backend `biber`;
- estilo `undf-abnt`;
- comandos amigáveis para citações indiretas, diretas, longas, apud e referência completa.

Os arquivos `undf-abnt.bbx` e `undf-abnt.cbx` ficam em `src/biblatex/`, junto da camada institucional que configura o `biblatex`.

## Modelos de conteúdo

O projeto mantém dois fluxos:

- modelo em branco: `tcc.tex`, `capitulos/`, `obrigatorio/`, `opcional/`;
- exemplo completo: `tcc-exemplo-undf.tex`, `exemplo/`.

Ao alterar a interface pública do template, verifique os dois fluxos.

## Regra de manutenção

Mudanças devem ser pequenas, rastreáveis e compatíveis com a estrutura atual. Antes de criar um novo módulo, confirme se a responsabilidade não pertence a um arquivo já existente.
