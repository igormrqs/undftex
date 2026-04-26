# UnDF-TeX

Classe e conjunto de módulos LaTeX para produção de Trabalhos de Conclusão de Curso da Universidade do Distrito Federal Professor Jorge Amaury Maia Nunes (UnDF), com estrutura acadêmica baseada nas normas ABNT adotadas pelo projeto.

O objetivo do UnDF-TeX é oferecer um template claro, compilável e fácil de adaptar, reduzindo retrabalho de formatação e mantendo uma separação simples entre metadados, elementos pré-textuais, capítulos, referências e módulos internos.

## Estado do projeto

O projeto está em consolidação. A versão atual já contém:

- classe principal `undftex`;
- modelo em branco em `tcc.tex`;
- modelo completo de demonstração em `tcc-exemplo-undf.tex`;
- capa, folha de rosto e folha de aprovação institucionais;
- resumo e resumo em língua estrangeira com avisos de tamanho;
- listas de ilustrações e tabelas;
- comandos auxiliares para figuras, tabelas, equações, apêndices e anexos;
- camada de citações e referências com `biblatex` e `biber`;
- documentação inicial para uso, manutenção e contribuição.

Este projeto não substitui a conferência acadêmica final exigida por curso, banca, orientador, biblioteca ou unidade institucional responsável.

## Requisitos

- Distribuição TeX atualizada, preferencialmente TeX Live ou MiKTeX.
- LuaLaTeX.
- Biber.
- Pacotes LaTeX usuais: `biblatex`, `csquotes`, `caption`, `tocloft`, `pdfpages`, `graphicx`, `hyperref`, `xparse`, `etoolbox`, `xstring`, entre outros.

A classe exige LuaLaTeX. A compilação com pdfLaTeX ou XeLaTeX não é o alvo oficial do projeto.

## Uso rápido

Edite primeiro o arquivo `tcc.tex`.

```tex
\documentclass{undftex}

\autor{Nome do Aluno}
\titulo{Título do Trabalho}
\subtitulo{Subtítulo opcional}
\curso{Nome do curso}
\tipotrabalho{Trabalho de Conclusão de Curso}
\graupretendido{bacharel em Nome do curso}
\local{Brasília}
\ano{2026}
\orientador{Nome do Orientador}
\coorientador{}
\areadeconcentracao{Área de concentração}
\dataaprovacao{dia de mês de ano}
```

Preencha os arquivos de conteúdo:

- `obrigatorio/resumo.tex`
- `obrigatorio/abstract.tex`
- `obrigatorio/referencias.bib`
- `capitulos/*.tex`
- `opcional/*.tex`, quando desejar usar elementos opcionais.

Compile com:

```powershell
lualatex -interaction=nonstopmode -halt-on-error tcc.tex
biber tcc
lualatex -interaction=nonstopmode -halt-on-error tcc.tex
lualatex -interaction=nonstopmode -halt-on-error tcc.tex
```

Para compilar o exemplo completo:

```powershell
lualatex -interaction=nonstopmode -halt-on-error tcc-exemplo-undf.tex
biber tcc-exemplo-undf
lualatex -interaction=nonstopmode -halt-on-error tcc-exemplo-undf.tex
lualatex -interaction=nonstopmode -halt-on-error tcc-exemplo-undf.tex
```

## Estrutura principal

```text
.
├── tcc.tex                  # modelo em branco para o usuário final
├── tcc-exemplo-undf.tex     # exemplo completo de uso do template
├── undftex.cls              # entrada pública da classe
├── src/                     # implementação da classe e dos módulos
├── capitulos/               # capítulos do modelo em branco
├── obrigatorio/             # resumo, abstract e referências do modelo em branco
├── opcional/                # elementos opcionais do modelo em branco
├── exemplo/                 # conteúdo completo de demonstração
├── figuras/                 # imagens usadas pelos modelos
├── identidade/              # recursos de identidade visual
└── docs/                    # documentação do projeto
```

## Documentação

- `docs/guia-de-uso.md`: guia prático para estudantes e usuários do template.
- `docs/estrutura-do-projeto.md`: visão técnica da arquitetura interna.
- `docs/decisoes-institucionais.md`: decisões de padronização adotadas no projeto.
- `CONTRIBUTING.md`: orientações para contribuições.
- `CHANGELOG.md`: histórico das mudanças relevantes.
- `MANIFEST.md`: definição prática dos arquivos que compõem o trabalho sob LPPL.

## Normas ABNT usadas como referência

O projeto foi organizado considerando, entre outras, as seguintes normas:

- ABNT NBR 14724:2024 - Trabalhos acadêmicos;
- ABNT NBR 10520:2023 - Citações;
- ABNT NBR 6023:2025 - Referências;
- ABNT NBR 6028:2021 - Resumo, resenha e recensão;
- ABNT NBR 6024:2012 - Numeração progressiva das seções;
- ABNT NBR 6027:2012 - Sumário.

As normas ABNT são documentos protegidos por direitos autorais. Este repositório não reproduz o texto integral das normas.

## Licença

Este projeto é distribuído sob a LaTeX Project Public License, versão 1.3c ou posterior.

Consulte:

- `LICENSE`: nota de licenciamento do repositório;
- `LICENSE-LPPL-1.3c.tex`: texto oficial integral da LPPL 1.3c;
- `MANIFEST.md`: identificação dos arquivos que compõem o trabalho.

