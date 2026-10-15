# UnDF-TeX

Classe e conjunto de módulos LaTeX para produção de Trabalhos de Conclusão de Curso da Universidade do Distrito Federal Professor Jorge Amaury Maia Nunes (UnDF), com estrutura acadêmica baseada nas normas ABNT adotadas pelo projeto.

O objetivo do UnDF-TeX é oferecer um template claro, compilável e fácil de adaptar, reduzindo retrabalho de formatação e mantendo uma separação simples entre metadados, elementos pré-textuais, seções textuais, referências e módulos internos.

## Estado do projeto

A versão registrada é `0.1.0`. Alterações posteriores à versão registrada ficam documentadas na seção `[Não lançado]` do `CHANGELOG.md`.

O estado atual já contém:

- classe principal `undftex`;
- modelo em branco em `tcc.tex`;
- modelo completo de demonstração em `tcc-exemplo-undf.tex`;
- capa, folha de rosto e folha de aprovação institucionais;
- resumo e resumo em língua estrangeira com validação de tamanho e contagem de palavras;
- listas de ilustrações e tabelas;
- comandos auxiliares para nota de rodapé, figuras, figuras comparativas, fluxogramas, tabelas, equações, pseudocódigo, citações, apêndices e anexos;
- camada de citações e referências com `biblatex` e `biber`;
- documentação inicial para uso, manutenção e contribuição.

Este projeto não substitui a conferência acadêmica final exigida por curso, banca, orientador, biblioteca ou unidade institucional responsável.

## Requisitos

- Distribuição TeX atualizada, preferencialmente TeX Live ou MiKTeX.
- LuaLaTeX.
- Biber.
- Pacotes LaTeX usuais: `biblatex`, `csquotes`, `caption`, `tocloft`, `pdfpages`, `graphicx`, `listings`, `needspace`, `tikz`, `hyperref`, `xparse`, `etoolbox`, `xstring`, entre outros.

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
\dataaprovacao{Brasília, DF, dia de mês de ano}
```

Preencha os arquivos de conteúdo:

- `obrigatorio/resumo.tex`
- `obrigatorio/abstract.tex`
- `obrigatorio/referencias.bib`
- `capitulos/*.tex`
- `opcional/*.tex`, quando desejar usar elementos opcionais.

Compile com `latexmk`, que executa LuaLaTeX e Biber quantas vezes forem necessárias (a configuração está em `.latexmkrc`):

```powershell
latexmk
```

Para compilar o exemplo completo:

```powershell
latexmk tcc-exemplo-undf.tex
```

Para remover os artefatos de compilação:

```powershell
latexmk -C
```

Se preferir o fluxo manual equivalente:

```powershell
lualatex -interaction=nonstopmode -halt-on-error tcc.tex
biber tcc
lualatex -interaction=nonstopmode -halt-on-error tcc.tex
lualatex -interaction=nonstopmode -halt-on-error tcc.tex
```

No Overleaf, o arquivo `.latexmkrc` é lido automaticamente; basta definir o compilador do projeto como LuaLaTeX em Menu > Settings > Compiler.

## Perfis de TCC em desenvolvimento

O modelo atual continua sendo o padrão: `\documentclass{undftex}` ou
`\documentclass[perfil=monografia]{undftex}`. O perfil experimental
`\documentclass[perfil=artigo]{undftex}` é demonstrado em `artigo.tex` (autônomo)
e `tcc-artigo.tex` (entrega institucional). Ambos compartilham o mesmo conteúdo,
com resumo único, seções contínuas e espaçamento simples. A apresentação
institucional deve ser ajustada às exigências do curso.

Preencha `artigo/metadados.tex`, `artigo/resumos.tex` e `artigo/conteudo.tex`.
Abstract e keywords são opcionais: habilite `\input{artigo/abstract}` no arquivo
principal escolhido. Título traduzido, identificação, vínculo e e-mail do autor
também possuem comandos próprios no arquivo de metadados.

Para consultar um artigo preenchido, use `artigo-exemplo-undf.tex`. Ele relata
uma verificação didática do próprio projeto, com conteúdo independente em
`exemplo/artigo/`, citações, figura, tabela, equação, pseudocódigo e referências.
Veja o [escopo e a origem dos resultados](exemplo/artigo/README.md).

Leia [a pesquisa e as decisões do perfil](docs/perfis-tcc.md) antes de usá-lo
para entrega. A implementação não representa aprovação institucional do formato.
A [integração TeXstudio–GitHub](docs/texstudio-github.md) também está documentada.

Para compilar os cinco modelos e verificar o artigo com e sem elementos opcionais
no Windows, inclusive sem Perl (a verificação dos PDFs requer `pdftotext`):

```powershell
.\scripts\verificar-perfis.ps1
```

Os PDFs e logs ficam em `build/perfis/`. Com Perl disponível, use
`latexmk -outdir=build/perfis artigo.tex` para o artigo autônomo.
Para compilar somente o novo exemplo sem Perl, execute
`.\scripts\verificar-perfis.ps1 -Documentos artigo-exemplo-undf.tex`.

A verificação também cobre apêndices/anexos com subdivisões e objetos, hyperlinks,
citações `apud` e continuação de objetos entre páginas. Os casos mínimos ficam em
`tests/`, com dados bibliográficos e conteúdos fictícios próprios para teste.

## Estrutura principal

```text
.
├── tcc.tex                  # modelo em branco para o usuário final
├── tcc-exemplo-undf.tex     # exemplo completo de uso do template
├── artigo.tex               # artigo acadêmico autônomo (experimental)
├── tcc-artigo.tex           # exemplo de entrega institucional do mesmo artigo
├── artigo-exemplo-undf.tex  # artigo preenchido com conteúdo didático próprio
├── undftex.cls              # entrada pública da classe
├── .latexmkrc               # configuração de compilação (latexmk + LuaLaTeX + Biber)
├── src/                     # implementação da classe e dos módulos
├── capitulos/               # seções textuais do modelo em branco
├── obrigatorio/             # resumo, abstract e referências do modelo em branco
├── opcional/                # elementos opcionais do modelo em branco
├── exemplo/                 # conteúdo completo de demonstração
├── artigo/                  # resumos e miolo do perfil de artigo
├── figuras/                 # imagens usadas pelos modelos
├── identidade/              # recursos de identidade visual
├── manuais/                 # manuais e fontes do volume integrado
│   ├── parte-i/             # manual acadêmico de TCC da UnDF
│   ├── parte-ii/            # manual técnico do template
│   ├── estilos/             # estilos específicos das partes
│   └── manual-completo.tex  # volume integrado com um único sumário
└── docs/                    # documentação do projeto
```

## Imagens no trabalho

Para manter o PDF gerado leve e legível, prefira imagens já dimensionadas para uso acadêmico:

- até `2 MB` por imagem: faixa recomendada para a maioria dos casos;
- entre `2 MB` e `5 MB`: aceitável, mas vale avaliar se há excesso de resolução;
- acima de `5 MB`: os comandos oficiais de figura emitem aviso na compilação;
- acima de `10 MB`: os comandos oficiais emitem aviso mais forte, recomendando otimização para abaixo de `5 MB`;
- lado maior entre `1200 px` e `3000 px`: costuma ser suficiente para figuras comuns no corpo do texto;
- lado maior acima de `4000 px`: geralmente é exagero para uso em TCC, salvo mapas, pranchas ou imagens técnicas específicas;
- lado maior abaixo de `1000 px`: pode ficar borrado se a imagem for ampliada no PDF.

O template não compacta imagens automaticamente. A validação automática ocorre em `\undffigura` e `\undffigurasladoalado`; imagens inseridas diretamente por `\includegraphics` ficam sob responsabilidade do usuário. A recomendação é preservar o original fora do projeto, exportar uma cópia otimizada para `figuras/` e sempre conferir o PDF gerado.

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
