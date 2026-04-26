# Decisões institucionais do projeto UnDF-TeX

Este documento registra decisões consolidadas do projeto UnDF-TeX para reduzir retrabalho, preservar coerência entre os arquivos e separar o que é exigência normativa do que é escolha institucional do template.

As normas ABNT indicam elementos, estrutura geral e critérios de apresentação, mas nem sempre fixam todos os detalhes visuais, técnicos ou editoriais. Quando houve margem de escolha, o projeto adotou as decisões abaixo.

## Referência de verificação

As decisões abaixo foram conferidas contra:

- modelo em branco compilado: `tcc.pdf`;
- exemplo completo compilado: `tcc-exemplo-undf.pdf`;
- classe e módulos em `src/`;
- arquivos de entrada `tcc.tex` e `tcc-exemplo-undf.tex`.

## Decisão Institucional Nº 0 — Compilador Oficial

O compilador padrão do UnDF-TeX é o LuaLaTeX.

Justificativa institucional:

- suporte moderno a Unicode;
- melhor integração com tipografia contemporânea;
- compatibilidade com fontes OpenType;
- suporte adequado em ambientes como Overleaf e distribuições TeX atuais;
- alinhamento com o desenvolvimento atual do ecossistema LaTeX.

Implementação: `src/undftex.cls`.

## Decisão Institucional Nº 1 — Modelo de Capítulo

Os capítulos textuais devem aparecer no formato:

```text
1 INTRODUÇÃO
```

Decisões adotadas:

- não exibir a palavra `Capítulo`;
- manter número e título na mesma linha;
- usar caixa alta no título do capítulo;
- alinhar o título à esquerda;
- não inserir linha em branco entre número e título;
- inserir espaçamento vertical após o título antes do início do texto.

Implementação: `src/core/undf-titles.sty`.

## Decisão Institucional Nº 2 — Local na Capa e nas Páginas de Identificação

O campo `\local{...}` controla o local exibido na capa e na folha de rosto.

Decisão adotada no estado atual:

- o valor padrão interno é `Brasília`;
- o modelo em branco deixa o campo como `Cidade`;
- o exemplo completo usa `Brasília`;
- caso a instituição deseje explicitar a unidade federativa, o usuário pode informar `Brasília -- DF`.

Observação: os PDFs verificados exibem apenas cidade, sem UF. Portanto, `Brasília -- DF` deve ser tratado como opção institucional futura ou escolha de preenchimento, não como comportamento atual obrigatório.

Implementação: `src/core/undf-metadata.sty`, `tcc.tex` e `tcc-exemplo-undf.tex`.

## Decisão Institucional Nº 3 — Ordem da Capa

A capa institucional segue a ordem:

```text
LOGO / BLOCO INSTITUCIONAL
AUTOR
TÍTULO E SUBTÍTULO
LOCAL
ANO
```

Decisões adotadas:

- o curso não é exibido na capa;
- o curso aparece no texto de natureza do trabalho, na folha de rosto e na folha de aprovação;
- autor, título e instituição usam caixa alta;
- local e ano permanecem no rodapé visual da página.

Implementação: `src/identity/undf-cover.sty`.

## Decisão Institucional Nº 4 — Texto da Natureza do Trabalho

Quando o usuário não fornece texto personalizado por `\objetivo{...}`, o template gera automaticamente a natureza do trabalho.

Modelo adotado:

```text
Trabalho de Conclusão de Curso apresentado ao curso de [CURSO],
da Universidade do Distrito Federal Professor Jorge Amaury Maia Nunes -- UnDF,
como requisito parcial para obtenção do título de [GRAU].
Área de concentração: [ÁREA].
```

Decisões adotadas:

- usar o nome institucional completo da UnDF;
- manter o grau pretendido em campo próprio;
- incluir área de concentração apenas quando preenchida;
- permitir substituição total do texto por `\objetivo{...}`.

Implementação: `src/core/undf-metadata.sty`.

## Decisão Institucional Nº 5 — Largura do Bloco de Natureza

Na folha de rosto e na folha de aprovação, o bloco de natureza do trabalho usa largura de `0.55\textwidth`.

Decisões adotadas:

- alinhar o bloco à direita;
- usar texto alinhado à esquerda dentro do bloco;
- usar espaçamento simples;
- usar tamanho `\small`;
- preservar respiro visual entre título, natureza e rodapé.

Observação: a anotação inicial mencionava `0.6\textwidth`, mas a verificação do código e dos PDFs mostra `0.55\textwidth` como valor efetivo atual.

Implementação: `src/identity/undf-titlepages.sty`.

## Decisão Institucional Nº 6 — Margens do Documento

As margens do documento são:

```text
superior: 3 cm
esquerda: 3 cm
inferior: 2 cm
direita: 2 cm
```

Decisão adotada para manter conformidade visual e previsibilidade nos PDFs A4.

Implementação: `src/core/undf-layout.sty`.

## Decisão Institucional Nº 7 — Recuo de Parágrafo

O recuo de parágrafo é de `1.25cm`.

Decisões adotadas:

- aplicar recuo também ao primeiro parágrafo após títulos;
- alterar o comportamento padrão da classe `report`, que normalmente não recua o primeiro parágrafo após título;
- manter o texto textual com aparência uniforme.

Implementação: `src/core/undf-layout.sty`.

## Decisão Institucional Nº 8 — Espaçamento Geral entre Linhas

O corpo do trabalho usa espaçamento de uma linha e meia.

Decisões adotadas:

- usar `\onehalfspacing` como padrão geral;
- usar espaçamento simples em blocos específicos, como natureza do trabalho, ficha catalográfica, banca e citações longas.

Implementação: `src/core/undf-layout.sty`, `src/identity/undf-titlepages.sty` e `src/biblatex/undf-biblatex.sty`.

## Decisão Institucional Nº 9 — Identidade Visual da Capa

A capa usa logo institucional por padrão.

Decisões adotadas:

- arquivo padrão da logo: `identidade/logo_vertical.png`;
- largura máxima da logo: `0.50\textwidth`;
- altura máxima da logo: `4.0cm`;
- altura fixa do bloco institucional: `5.8cm`;
- instituição exibida em duas linhas institucionais:
  - `Universidade do Distrito Federal`;
  - `Professor Jorge Amaury Maia Nunes -- UnDF`.

Justificativa: a altura fixa do bloco evita que alterações no tamanho da logo empurrem autor, título, local e ano.

Implementação: `src/identity/undf-identity.sty` e `src/identity/undf-cover.sty`.

## Decisão Institucional Nº 10 — Folha de Rosto

A folha de rosto segue a ordem:

```text
AUTOR
TÍTULO E SUBTÍTULO
NATUREZA DO TRABALHO / ORIENTAÇÃO
LOCAL
ANO
```

Decisões adotadas:

- manter o nome do autor no alto da área textual;
- centralizar autor, título, local e ano;
- alinhar o bloco de natureza à direita;
- exibir orientador e coorientador sem prefixos de titulação no nome.

Implementação: `src/identity/undf-titlepages.sty`.

## Decisão Institucional Nº 11 — Folha de Aprovação

A folha de aprovação segue a ordem:

```text
AUTOR
TÍTULO E SUBTÍTULO
NATUREZA DO TRABALHO
DATA DE APROVAÇÃO
BANCA EXAMINADORA
```

Decisões adotadas:

- manter a data de aprovação alinhada à esquerda;
- centralizar os blocos da banca;
- usar linha de assinatura com largura de `0.7\textwidth`;
- separar nome, titulação e vínculo institucional em linhas distintas;
- não antepor `Dr.`, `Dra.`, `Prof.` ou equivalente ao nome.

Implementação: `src/identity/undf-titlepages.sty`.

## Decisão Institucional Nº 12 — Titulação de Orientador e Banca

Nomes de orientador, coorientador e membros da banca devem ser informados sem prefixos.

Decisões adotadas:

- `Dr.`, `Dra.`, `Prof.`, `Professor`, `Professora`, `Mestre`, `Mestra` e equivalentes são removidos automaticamente quando digitados junto ao nome;
- a titulação deve ser registrada em campo próprio na banca;
- a folha de aprovação exibe a titulação como linha separada, não como prefixo do nome.

Justificativa: preserva a legibilidade e atende à orientação recebida para retirar titulação colada ao nome.

Implementação: `src/core/undf-metadata.sty` e `src/identity/undf-titlepages.sty`.

## Decisão Institucional Nº 13 — Paginação

Decisões adotadas:

- capa sem numeração visível;
- elementos pré-textuais com numeração não visível;
- parte textual reiniciada na página 1;
- numeração visível em algarismos arábicos no canto superior direito;
- pós-textuais continuam a numeração da parte textual.

Implementação: `src/core/undf-structure.sty` e `src/core/undf-layout.sty`.

## Decisão Institucional Nº 14 — Resumo e Abstract

O resumo e o resumo em língua estrangeira usam estrutura própria, sem depender de capítulos.

Decisões adotadas:

- título centralizado;
- título em caixa alta;
- título em negrito;
- tamanho `\normalsize`;
- texto sem recuo de parágrafo;
- sem espaçamento extra entre parágrafos;
- uma linha de respiro após o título;
- palavras-chave imediatamente após o texto;
- cada resumo inicia e encerra sua própria página.

Implementação: `src/abnt/abnt-nbr6028-2021.sty`.

## Decisão Institucional Nº 15 — Avisos de Tamanho em Elementos de Uma Página

O template não bloqueia conteúdo que ultrapasse uma página.

Decisões adotadas:

- emitir avisos de compilação em vez de cortar conteúdo;
- verificar resumo, abstract, dedicatória, agradecimentos, epígrafe, errata e ficha catalográfica textual;
- considerar como alerta prático conteúdo acima de aproximadamente 85% da altura textual disponível;
- preservar a responsabilidade do usuário pela revisão final.

Justificativa: bloquear ou cortar conteúdo poderia ocultar texto acadêmico importante.

Implementação: `src/abnt/abnt-nbr6028-2021.sty`.

## Decisão Institucional Nº 16 — Palavras-chave e Keywords

Decisões adotadas:

- termos separados por ponto e vírgula;
- ponto final acrescentado pelo template;
- faixa recomendada: 3 a 6 termos;
- aviso de compilação quando a quantidade fica fora da faixa;
- rótulo padrão em português: `Palavras-chave`;
- rótulo padrão em inglês: `Keywords`;
- rótulo estrangeiro configurável por `keywordslabel`.

Implementação: `src/abnt/abnt-nbr6028-2021.sty`.

## Decisão Institucional Nº 17 — Tamanho dos Títulos Pré-textuais

Há dois grupos de títulos pré-textuais.

Para resumo e abstract:

- `\normalsize`;
- negrito;
- centralizado;
- caixa alta.

Para sumário, listas e títulos especiais:

- `\Large`;
- negrito;
- centralizado;
- caixa alta.

Para agradecimentos e errata:

- `\normalsize`;
- negrito;
- centralizado;
- caixa alta.

Implementação: `src/abnt/abnt-nbr6028-2021.sty`, `src/core/undf-headings.sty` e `src/identity/undf-titlepages.sty`.

## Decisão Institucional Nº 18 — Sumário

Decisões adotadas:

- o sumário é o último elemento pré-textual;
- elementos pré-textuais não entram no sumário;
- capítulos e seções textuais entram conforme profundidade configurada;
- a profundidade de numeração e sumário vai até o quarto nível;
- a hierarquia tipográfica do sumário acompanha a hierarquia do texto.

Implementação: `src/abnt/abnt-nbr6027-2012.sty`, `src/core/undf-titles.sty` e `src/core/undf-toccore.sty`.

## Decisão Institucional Nº 19 — Listas de Ilustrações e Tabelas

Decisões adotadas:

- lista de ilustrações e lista de tabelas são comandos explícitos;
- o modelo em branco não as exibe por padrão;
- o exemplo completo as exibe para demonstrar o recurso;
- legendas usam separador travessão visual entre número e título;
- a lista repete o identificador `Figura` ou `Tabela`.

Implementação: `src/abnt/abnt-nbr14724-2024.sty`.

## Decisão Institucional Nº 20 — Figuras e Fontes

Decisões adotadas:

- comando amigável principal: `\undffigura`;
- posicionamento padrão com `[H]` para reduzir deslocamentos inesperados no exemplo;
- largura padrão: `0.8\textwidth`;
- fonte padrão: `elaboração própria`;
- fonte exibida abaixo da legenda;
- rótulos internos recebem prefixo `fig:`.

Implementação: `src/core/undf-crossrefs.sty`.

## Decisão Institucional Nº 21 — Tabelas, Equações e Referências Cruzadas

Decisões adotadas:

- tabelas podem usar ambiente `undftabela` quando houver necessidade de legenda, rótulo e fonte padronizados;
- equações podem usar `\equacao` para criar rótulo automático com prefixo `eq:`;
- referências cruzadas amigáveis usam comandos como `\figuraref`, `\tabelaref`, `\equacaoref`, `\secaoref`, `\apendiceref` e `\anexoref`.

Implementação: `src/core/undf-crossrefs.sty`.

## Decisão Institucional Nº 22 — Ficha Catalográfica

Decisões adotadas:

- a ficha catalográfica é opcional no modelo;
- prioridade de entrada:
  1. PDF externo;
  2. imagem;
  3. texto;
  4. placeholder apenas no comando completo;
- a versão opcional só aparece quando houver conteúdo;
- ficha textual usa bloco de `0.75\textwidth`, tamanho `\footnotesize` e espaçamento simples.

Implementação: `src/core/undf-metadata.sty` e `src/identity/undf-titlepages.sty`.

## Decisão Institucional Nº 23 — Dedicatória, Agradecimentos e Epígrafe

Decisões adotadas:

- dedicatória sem título, posicionada à direita e na parte inferior da página;
- dedicatória com bloco de `0.42\textwidth`;
- agradecimentos com título centralizado em caixa alta;
- epígrafe sem título, em itálico, posicionada à direita e na parte inferior da página;
- epígrafe com bloco de `0.50\textwidth`;
- autor da epígrafe opcional, em tamanho menor.

Implementação: `src/identity/undf-titlepages.sty`.

## Decisão Institucional Nº 24 — Resumo em Mais de Uma Língua Estrangeira

O template oferece um resumo em língua estrangeira como fluxo padrão.

Decisões adotadas:

- o título padrão é `ABSTRACT`;
- o título pode ser alterado para `RESUMEN` ou outro idioma;
- o rótulo das palavras-chave estrangeiras pode ser alterado;
- múltiplos resumos estrangeiros não são automatizados no modelo em branco;
- caso uma unidade acadêmica exija mais de um resumo estrangeiro, o usuário deve inserir explicitamente outro ambiente ou o projeto deve criar suporte específico em decisão futura.

Implementação: `src/abnt/abnt-nbr6028-2021.sty`.

## Decisão Institucional Nº 25 — Modelo em Branco e Exemplo Completo

Decisões adotadas:

- `tcc.tex` deve permanecer simples e adequado para início de um trabalho real;
- `tcc-exemplo-undf.tex` deve demonstrar possibilidades do template;
- o exemplo completo pode conter elementos opcionais para fins didáticos;
- o modelo em branco deve evitar excesso de demonstrações para não confundir o usuário final.

## Decisão Institucional Nº 26 — Arquivos Gerados e Distribuição

Decisões adotadas:

- PDFs compilados não devem ser versionados por padrão;
- arquivos auxiliares de LaTeX não devem ser versionados;
- imagens usadas pelo modelo podem ser versionadas quando fizerem parte do exemplo;
- arquivos grandes devem ser avaliados antes de entrar no histórico Git;
- distribuições fechadas podem ser publicadas por release, não necessariamente no histórico principal.

Implementação: `.gitignore` e `MANIFEST.md`.

## Decisão Institucional Nº 27 — Licenciamento

Decisões adotadas:

- licença do projeto: LPPL 1.3c ou posterior;
- texto oficial preservado em `LICENSE-LPPL-1.3c.tex`;
- nota explicativa em português em `LICENSE`;
- manifesto de arquivos do trabalho em `MANIFEST.md`.

