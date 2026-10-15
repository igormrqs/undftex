# Decisões institucionais validadas no âmbito do projeto

Este documento registra decisões institucionais validadas durante o desenvolvimento do manual e do UnDF-TeX. O registro reduz retrabalho, preserva coerência entre os artefatos e separa requisito normativo, recomendação normativa, decisão do projeto e fluxo externo ainda não definido.

> A validação no âmbito do projeto registra o padrão deliberado e implementado. Ela não equivale à publicação oficial do manual por ato ou canal institucional. Fluxos externos ainda não definidos são controlados separadamente em `manuais/parte-i/revisao/PENDENCIAS_INSTITUCIONAIS.md`.

As normas ABNT indicam elementos, estrutura geral e critérios de apresentação, mas nem sempre fixam todos os detalhes visuais, técnicos ou editoriais. Quando houve margem de escolha, o projeto deliberou e incorporou as configurações abaixo ao modelo em branco, ao TCC de exemplo e à documentação.

## Referência de verificação

As decisões abaixo foram conferidas contra:

- modelo em branco compilado: `tcc.pdf`;
- exemplo completo compilado: `tcc-exemplo-undf.pdf`;
- classe e módulos em `src/`;
- arquivos de entrada `tcc.tex` e `tcc-exemplo-undf.tex`.

## Decisão Institucional Validada Nº 0 — Compilador Padrão

O compilador padrão do UnDF-TeX é o LuaLaTeX.

Justificativa técnica:

- suporte moderno a Unicode;
- melhor integração com tipografia contemporânea;
- compatibilidade com fontes OpenType;
- suporte adequado em ambientes como Overleaf e distribuições TeX atuais;
- alinhamento com o desenvolvimento atual do ecossistema LaTeX.

Implementação: `src/undftex.cls`.

## Decisão Institucional Validada Nº 1 — Modelo de Seção Primária

As seções primárias textuais devem aparecer no formato:

```text
1 INTRODUÇÃO
```

Decisões adotadas:

- não exibir a palavra `Capítulo`;
- manter número e título na mesma linha;
- usar caixa alta no título da seção primária;
- alinhar o título à esquerda;
- não inserir linha em branco entre número e título;
- inserir espaçamento vertical após o título antes do início do texto.

Implementação: `src/core/undf-titles.sty`.

## Decisão Institucional Validada Nº 2 — Local na Capa e nas Páginas de Identificação

O campo `\local{...}` controla o local exibido na capa e na folha de rosto.

Decisão adotada no estado atual:

- o valor padrão interno é `Brasília`;
- o modelo em branco deixa o campo como `Cidade`;
- o exemplo completo usa `Brasília`;
- caso a instituição deseje explicitar a unidade federativa, o usuário pode informar `Brasília -- DF`.

Observação: os PDFs verificados exibem apenas cidade, sem UF. Portanto, `Brasília -- DF` deve ser tratado como opção institucional futura ou escolha de preenchimento, não como comportamento atual obrigatório.

Implementação: `src/core/undf-metadata.sty`, `tcc.tex` e `tcc-exemplo-undf.tex`.

## Decisão Institucional Validada Nº 3 — Ordem da Capa

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

## Decisão Institucional Validada Nº 4 — Texto da Natureza do Trabalho

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

## Decisão Institucional Validada Nº 5 — Largura do Bloco de Natureza

Na folha de rosto e na folha de aprovação, o bloco de natureza do trabalho usa largura de `0.55\textwidth`.

Decisões adotadas:

- alinhar o bloco à direita;
- usar texto alinhado à esquerda dentro do bloco;
- usar espaçamento simples;
- usar tamanho `\small`;
- preservar respiro visual entre título, natureza e rodapé.

Observação: a anotação inicial mencionava `0.6\textwidth`, mas a verificação do código e dos PDFs mostra `0.55\textwidth` como valor efetivo atual.

Implementação: `src/identity/undf-titlepages.sty`.

## Decisão Institucional Validada Nº 6 — Margens do Documento

As margens do documento são:

```text
superior: 3 cm
esquerda: 3 cm
inferior: 2 cm
direita: 2 cm
```

Decisão adotada para manter conformidade visual e previsibilidade nos PDFs A4.

Implementação: `src/core/undf-layout.sty`.

## Decisão Institucional Validada Nº 7 — Recuo de Parágrafo

O recuo de parágrafo é de `1.25cm`.

Decisões adotadas:

- aplicar recuo também ao primeiro parágrafo após títulos;
- alterar o comportamento padrão da classe `report`, que normalmente não recua o primeiro parágrafo após título;
- manter o texto textual com aparência uniforme.

Implementação: `src/core/undf-layout.sty`.

## Decisão Institucional Validada Nº 8 — Espaçamento Geral entre Linhas

O corpo do trabalho usa espaçamento de uma linha e meia.

Decisões adotadas:

- usar `\onehalfspacing` como padrão geral;
- usar espaçamento simples em blocos específicos, como natureza do trabalho, ficha catalográfica, banca e citações longas.

Implementação: `src/core/undf-layout.sty`, `src/identity/undf-titlepages.sty` e `src/biblatex/undf-biblatex.sty`.

## Decisão Institucional Validada Nº 9 — Identidade Visual da Capa

A capa usa a logo institucional da UnDF por padrão.

Decisões adotadas:

- arquivo padrão da logo: `identidade/logo_vertical.png`;
- largura máxima da logo: `0.66\textwidth`;
- altura máxima da logo: `5.2cm`;
- altura fixa do bloco institucional: `5.8cm`;
- a capa não oferece interface pública para trocar instituição, texto institucional ou logo;
- a instituição é fixa no backend como Universidade do Distrito Federal Professor Jorge Amaury Maia Nunes -- UnDF.

Justificativa: o modelo é institucional e deve evitar variações acidentais na identidade da UnDF. A altura fixa do bloco evita que alterações no tamanho da imagem empurrem autor, título, local e ano.

Implementação: `src/identity/undf-identity.sty` e `src/identity/undf-cover.sty`.

## Decisão Institucional Validada Nº 10 — Folha de Rosto

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

## Decisão Institucional Validada Nº 11 — Folha de Aprovação

A folha de aprovação segue a ordem:

```text
AUTOR
TÍTULO E SUBTÍTULO
NATUREZA DO TRABALHO
DATA DE APROVAÇÃO
BANCA EXAMINADORA
```

Decisões adotadas:

- manter a data de aprovação alinhada à esquerda no formato `Brasília, DF, dia de mês de ano`;
- centralizar os blocos da banca;
- usar linha de assinatura com largura de `0.7\textwidth`;
- exibir a banca no formato `Prof. Dr. Nome`;
- exibir o vínculo institucional abaixo do nome;
- não exibir titulação acadêmica em linha separada.

Implementação: `src/identity/undf-titlepages.sty`.

## Decisão Institucional Validada Nº 12 — Titulação de Orientador e Banca

Na folha de aprovação, orientador e membros da banca devem aparecer com prefixo acadêmico antes do nome.

Decisões adotadas:

- o primeiro campo de `\membrobanca` recebe o nome;
- o segundo campo recebe o prefixo acadêmico, como `Prof. Dr.` ou `Profa. Dra.`;
- a folha de aprovação combina os campos no formato `Prof. Dr. Nome`;
- o vínculo institucional permanece em linha própria;
- na folha de rosto, orientador e coorientador continuam sem prefixos no nome.

Justificativa: atende à decisão técnica do projeto de manter a titulação no formato curto antes do nome, sem repetir titulação extensa em linha inferior.

Implementação: `src/core/undf-metadata.sty` e `src/identity/undf-titlepages.sty`.

## Decisão Institucional Validada Nº 13 — Paginação

Decisões adotadas:

- capa sem numeração visível;
- folha de rosto como primeira página contada;
- verso da folha de rosto com ficha catalográfica sem contagem;
- elementos pré-textuais contados, mas sem numeração visível;
- parte textual preserva a contagem iniciada na folha de rosto;
- numeração visível em algarismos arábicos no canto superior direito;
- pós-textuais continuam a numeração da parte textual.

Implementação: `src/core/undf-structure.sty` e `src/core/undf-layout.sty`.

## Decisão Institucional Validada Nº 14 — Resumo e Abstract

O resumo e o resumo em língua estrangeira usam estrutura própria, sem depender das seções textuais.

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

## Decisão Institucional Validada Nº 15 — Validação de Elementos de Uma Página

O template estima o ajuste de elementos normalmente apresentados em uma página e informa riscos no log.

Decisões adotadas:

- emitir aviso, por padrão, quando resumo ou abstract parecem ultrapassar uma página;
- permitir elevar esse aviso a erro com `\bloquearresumoslongos`, apenas como opção explícita de revisão;
- emitir avisos, sem cortar conteúdo, para os demais elementos pré-textuais de uma página;
- verificar resumo, abstract, dedicatória, agradecimentos, epígrafe, errata e ficha catalográfica textual;
- considerar como alerta prático conteúdo acima de aproximadamente 85% da altura textual disponível;
- preservar a responsabilidade do usuário pela revisão final.

Justificativa: não há decisão institucional formal que autorize bloquear a geração por limite de uma página. O aviso preserva o conteúdo e chama atenção para a conferência visual; o erro optativo atende revisões controladas.

Implementação: `src/abnt/abnt-nbr6028-2021.sty`.

## Decisão Institucional Validada Nº 16 — Palavras-chave e Keywords

Decisões adotadas:

- termos separados por ponto e vírgula;
- ponto final acrescentado pelo template;
- quantidade adequada ao conteúdo, sem faixa numérica tratada como exigência ABNT;
- ausência de validação automática de quantidade enquanto não houver decisão formal da UnDF;
- rótulo padrão em português: `Palavras-chave`;
- rótulo padrão em inglês: `Keywords`;
- rótulo estrangeiro configurável por `keywordslabel`.

Implementação: `src/abnt/abnt-nbr6028-2021.sty`.

Justificativa: a ABNT NBR 6028:2021 define apresentação e separação das palavras-chave, mas não estabelece quantidade universal. Uma faixa somente poderá ser aplicada após deliberação institucional.

## Decisão Institucional Validada Nº 17 — Tamanho dos Títulos Pré-textuais

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

## Decisão Institucional Validada Nº 17-A — Modelo de Errata

A errata deve seguir o modelo visual da ABNT NBR 14724:2024: referência do trabalho seguida de tabela com folha, linha, trecho incorreto e correção.

Decisões adotadas:

- manter a referência do trabalho por `\errataref`;
- registrar as correções em tabela por `\erratatabela`;
- usar linhas de correção por `\erratalinha{folha}{linha}{onde se lê}{leia-se}`;
- não aplicar recuo de parágrafo na errata.

Implementação: `src/identity/undf-titlepages.sty`.

## Decisão Institucional Validada Nº 18 — Sumário

Decisões adotadas:

- o sumário é o último elemento pré-textual;
- elementos pré-textuais não entram no sumário;
- seções textuais entram conforme a profundidade configurada;
- entradas de seções primárias usam caixa alta, acompanhando a grafia exibida no texto;
- entradas de apêndices e anexos usam caixa alta, acompanhando a grafia exibida no texto;
- entradas manuais de pós-textuais usam âncoras próprias para hyperlinks do PDF;
- a profundidade de numeração e sumário vai até o quarto nível;
- seções primárias usam caixa alta e negrito;
- seções secundárias usam negrito;
- seções terciárias usam negrito e itálico;
- seções quaternárias usam itálico sem negrito;
- a hierarquia tipográfica do sumário acompanha a hierarquia do texto.

Implementação: `src/abnt/abnt-nbr6027-2012.sty`, `src/abnt/abnt-nbr14724-2024.sty`, `src/core/undf-headings.sty`, `src/core/undf-titles.sty` e `src/core/undf-toccore.sty`.

## Decisão Institucional Validada Nº 19 — Listas de Ilustrações e Tabelas

Decisões adotadas:

- lista de ilustrações e lista de tabelas são comandos explícitos;
- o modelo em branco não as exibe por padrão;
- o exemplo completo as exibe para demonstrar o recurso;
- legendas usam separador travessão visual entre número e título;
- a lista repete o identificador `Figura` ou `Tabela`.

Implementação: `src/abnt/abnt-nbr14724-2024.sty`.

## Decisão Institucional Validada Nº 20 — Figuras, Fontes e Qualidade de Imagem

Decisões adotadas:

- comando amigável principal: `\undffigura`;
- comando de comparação visual: `\undffigurasladoalado`, mantendo duas figuras independentes lado a lado, sem sublegendas do tipo `(a)` e `(b)`;
- posicionamento padrão com `[H]` para reduzir deslocamentos inesperados no exemplo;
- largura padrão: `0.8\textwidth`;
- fonte padrão: `elaboração própria`;
- identificação exibida acima da ilustração;
- fonte exibida imediatamente abaixo da ilustração;
- rótulos internos recebem prefixo `fig:`;
- o template valida automaticamente o peso de imagens usadas por `\undffigura` e `\undffigurasladoalado`;
- imagens acima de `5 MB` geram aviso na compilação;
- imagens acima de `10 MB` geram aviso mais forte, recomendando otimização para um tamanho abaixo de `5 MB`;
- `\includegraphics` direto não é interceptado, ficando sob responsabilidade do usuário;
- o template não compacta imagens automaticamente.

Recomendações editoriais:

- até `2 MB` por imagem é a faixa recomendada para a maioria dos casos;
- imagens entre `2 MB` e `5 MB` devem ser avaliadas;
- imagens acima de `5 MB` exigem justificativa ou otimização antes da entrega final;
- lado maior entre `1200 px` e `3000 px` costuma atender figuras comuns no corpo do texto;
- lado maior acima de `4000 px` tende a ser excesso quando a imagem será exibida pequena;
- lado maior abaixo de `1000 px` pode gerar perda de nitidez se houver ampliação.

Justificativa: a qualidade da imagem precisa equilibrar legibilidade e tamanho do PDF. Imagens muito pesadas dificultam envio e arquivamento; imagens pequenas demais podem comprometer a leitura.

Implementação: `src/core/undf-crossrefs.sty` e documentação de uso.

## Decisão Institucional Validada Nº 21 — Tabelas, Equações, Pseudocódigo e Referências Cruzadas

Decisões adotadas:

- tabelas podem usar ambiente `undftabela` quando houver necessidade de legenda, rótulo e fonte padronizados;
- equações podem usar `\equacao` para criar rótulo automático com prefixo `eq:`;
- pseudocódigos usam o ambiente `undfpseudocodigo` como comando único recomendado;
- a assinatura do pseudocódigo segue o padrão Cormen, com nome e entradas entre parênteses, como `PARTITION(A, p, r)`;
- o rótulo numerado e o título descritivo aparecem acima do bloco, no formato `Pseudocódigo n --- Título`;
- a assinatura aparece dentro da caixa, alinhada à esquerda;
- a fonte aparece abaixo do quadro, com `elaboração própria` como padrão;
- pseudocódigos usam numeração de linhas e palavras-chave em destaque;
- finalizadores locais como `Fim-se`, `Fim-para` e `Fim-enquanto` são preferidos para facilitar leitura;
- o ambiente tenta evitar quebra quando há pouco espaço restante na página e permite quebra natural quando o bloco não couber;
- referências cruzadas amigáveis usam comandos como `\figuraref`, `\fluxogramaref`, `\tabelaref`, `\equacaoref`, `\pseudocodigoref`, `\secaoref`, `\apendiceref` e `\anexoref`.

Implementação: `src/core/undf-crossrefs.sty`.

Revisão técnica de 14/10/2026 na branch `feature/perfis-tcc`: a prevenção de
quebras prematuras agora reserva cinco linhas para iniciar pseudocódigos e
quatro para citações em bloco, em vez de percentuais fixos da altura textual.
Títulos extensos de pseudocódigo quebram na largura do texto. Os complementos
reiniciam seções e objetos com prefixos alfabéticos e destinos distintos por
tipo. São correções técnicas de fluxo e consistência, sem criar novas exigências
de modalidade ou de entrega institucional.

## Decisão Institucional Validada Nº 21-A — Fluxogramas

Fluxogramas são tratados como ilustrações quando aparecem poucas vezes e ganham lista própria quando se tornam recorrentes no trabalho.

Decisões adotadas:

- usar o ambiente `undffluxograma` para fluxogramas;
- exibir identificação acima do desenho como `Figura n --- Título` até três ocorrências ou `Fluxograma n --- Título` quando houver lista própria;
- exibir fonte imediatamente abaixo do desenho;
- inserir fluxogramas próximos ao trecho em que são citados;
- usar balões de início e fim quando o fluxograma representar um processo completo;
- manter fluxogramas como figuras quando houver até três ocorrências no trabalho;
- criar lista própria e numeração `Fluxograma n` quando houver mais de três ocorrências.

Justificativa: a ABNT NBR 14724:2024 inclui fluxogramas no conjunto de ilustrações, mas trabalhos com muitos fluxogramas se beneficiam de lista própria. O limite de três evita criar uma lista pré-textual para poucos itens e preserva consistência quando o uso é recorrente.

Implementação: `src/core/undf-crossrefs.sty`, `src/abnt/abnt-nbr14724-2024.sty` e `exemplo/capitulos/04-analise-e-discussao.tex`.

## Decisão Institucional Validada Nº 21-B — Citações amigáveis

Decisões adotadas:

- preferir comandos em português para a interface pública de citações;
- `\citarparenteses` gera citação indireta parentética;
- `\citartexto` gera citação indireta com autoria integrada ao texto;
- `\citardireta` e `\citardiretatexto` geram citações diretas curtas;
- citações diretas longas tentam evitar corte ruim entre bloco citado e referência, mas podem quebrar naturalmente quando forem extensas.

Implementação: `src/biblatex/undf-biblatex.sty`.

## Decisão Institucional Validada Nº 22 — Dados Internacionais de Catalogação

Decisões adotadas:

- o posicionamento dos dados catalográficos segue o verso da folha de rosto;
- a obrigatoriedade e o fluxo operacional permanecem vinculados a PI-008, sem presumir manifestação da unidade competente;
- o template permite omiti-los durante a elaboração e só imprime o elemento quando houver conteúdo;
- prioridade de entrada:
  1. PDF externo;
  2. imagem;
  3. texto;
  4. placeholder apenas no comando completo;
- ficha textual usa bloco de `0.75\textwidth`, tamanho `\footnotesize` e espaçamento simples.

Implementação: `src/core/undf-metadata.sty` e `src/identity/undf-titlepages.sty`.

## Decisão Institucional Validada Nº 23 — Dedicatória, Agradecimentos e Epígrafe

Decisões adotadas:

- dedicatória sem título, posicionada à direita e na parte inferior da página;
- dedicatória com bloco de `0.42\textwidth`;
- agradecimentos com título centralizado em caixa alta;
- epígrafe sem título, em itálico, posicionada à direita e na parte inferior da página;
- epígrafe com bloco de `0.50\textwidth`;
- autor da epígrafe opcional, em tamanho menor.

Implementação: `src/identity/undf-titlepages.sty`.

## Decisão Institucional Validada Nº 24 — Resumo em Mais de Uma Língua Estrangeira

O template oferece um resumo em língua estrangeira como fluxo padrão.

Decisões adotadas:

- o título padrão é `ABSTRACT`;
- o título pode ser alterado para `RESUMEN` ou outro idioma;
- o rótulo das palavras-chave estrangeiras pode ser alterado;
- múltiplos resumos estrangeiros não são automatizados no modelo em branco;
- caso uma unidade acadêmica exija mais de um resumo estrangeiro, o usuário deve inserir explicitamente outro ambiente ou o projeto deve criar suporte específico em decisão futura.

Implementação: `src/abnt/abnt-nbr6028-2021.sty`.

## Decisão Institucional Validada Nº 25 — Modelo em Branco e Exemplo Completo

Decisões adotadas:

- `tcc.tex` deve permanecer simples e adequado para início de um trabalho real;
- `tcc-exemplo-undf.tex` deve demonstrar possibilidades do template;
- o exemplo completo pode conter elementos opcionais para fins didáticos;
- o exemplo completo demonstra nota de rodapé, citações, listas, figuras, comparação visual, fluxograma, pseudocódigo, tabela, equação, referências, glossário, apêndice e anexo;
- o modelo em branco deve evitar excesso de demonstrações para não confundir o usuário final;
- comandos em português devem ser preferidos na interface pública sempre que possível, como `\notarodape`.

## Decisão Institucional Validada Nº 26 — Arquivos Gerados, Imagens e Distribuição

Decisões adotadas:

- PDFs compilados não devem ser versionados por padrão;
- arquivos auxiliares de LaTeX não devem ser versionados;
- imagens usadas pelo modelo podem ser versionadas quando fizerem parte do exemplo ou da identidade visual;
- imagens versionadas devem ser adequadas ao uso no PDF e não devem ser desnecessariamente pesadas;
- arquivos grandes devem ser avaliados antes de entrar no histórico Git;
- imagens originais muito pesadas devem ser preservadas fora do repositório ou em distribuição própria, quando necessário;
- distribuições fechadas podem ser publicadas por release, não necessariamente no histórico principal.

Implementação: `.gitignore`, `MANIFEST.md` e documentação de uso.

## Decisão Institucional Validada Nº 27 — Licenciamento

Decisões adotadas:

- licença dos arquivos de código expressamente identificados: LPPL 1.3c ou posterior;
- texto oficial preservado em `LICENSE-LPPL-1.3c.tex`;
- nota explicativa em português em `LICENSE`;
- manifesto de arquivos do trabalho em `MANIFEST.md`.

Marcas, logotipos, identidade institucional, fontes, imagens, documentação, documentos oficiais e recursos de terceiros não são automaticamente abrangidos pela LPPL e seguem os respectivos termos de uso.
