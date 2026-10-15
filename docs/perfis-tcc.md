# Perfis de TCC: monografia e artigo

Pesquisa e decisão técnica de 14 de outubro de 2026. Desenvolvimento na branch
`feature/perfis-tcc`, a partir da base anterior registrada na `main` em `b7b5961`.

## Escopo e evidência

O perfil organiza **um TCC em formato de artigo baseado na ABNT NBR 6022:2018,
com adaptações institucionais explícitas**, dentro da mesma classe e do mesmo
repositório. A apresentação institucional não é herdada automaticamente da
monografia. SBC e REIC não orientam esse perfil. Não foram
importados arquivos, medidas gráficas, fontes ou estilos bibliográficos desses modelos.

A cópia local do [PPC de Ciência da Computação, seção 11.2](https://universidade.df.gov.br/documents/9295213/40058982/PPC_Ciencia_da_Computacao-20-02-2025.pdf)
admite artigo científico/tecnológico avaliado por banca. Ela foi conferida em
`../referencias/institucionais/pesquisa-undf/Bacharelado/` porque o PDF do portal
não pôde ser recuperado pela ferramenta de pesquisa nesta sessão. A admissão da
modalidade não estabelece, por si só, o leiaute de entrega. Confirmar a vigência e
as exigências específicas com o curso antes de utilizar o perfil em versão final.

A NBR 6022:2018, consultada na cópia local em
`../referencias/normas-abnt/Opcionais/ABNT NBR 6022-2018.pdf`, trata de artigo em
publicação periódica. Seus princípios de organização ajudam a definir o miolo;
campos de submissão e aprovação para publicação não se confundem com aprovação
pela banca. O perfil não se declara um modelo completo de submissão editorial.

## Separação das finalidades

| Finalidade | Implementação atual |
| --- | --- |
| Monografia acadêmica | `perfil=monografia`, padrão preservado em `tcc.tex` e `tcc-exemplo-undf.tex` |
| TCC em formato de artigo | `perfil=artigo`, com `artigo.tex` autônomo e `tcc-artigo.tex` para demonstrar a apresentação de entrega |
| Artigo destinado a publicação | Finalidade conceitualmente distinta; perfil editorial não implementado, pois depende de um destino específico |

Os dois arquivos principais de artigo compartilham `artigo/metadados.tex`,
`artigo/resumos.tex`, `artigo/conteudo.tex` e a camada bibliográfica. Não há cópia
paralela do texto científico. A classe base interna continua sendo `report` para
preservar os mecanismos existentes; isso não insere capa, aprovação, listas,
sumário ou resumos em páginas próprias no artigo autônomo.

## Estrutura da modalidade artigo

| Elemento | Tratamento |
| --- | --- |
| Título e autoria | Obrigatórios |
| Identificação sucinta, vínculo institucional e contato | Previstos no modelo, em nota de autoria com símbolo próprio |
| Resumo e palavras-chave | Obrigatórios; resumo único no idioma do artigo |
| Introdução, desenvolvimento e considerações finais | Obrigatórios, com títulos e subdivisões adaptáveis à pesquisa |
| Referências | Obrigatórias |
| Título traduzido, abstract e keywords | Opcionais; keywords acompanham o abstract quando incluído |
| Glossário, apêndices, anexos e agradecimentos | Opcionais; agradecimentos ao final dos complementos |
| Capa, folha de rosto, aprovação, listas e sumário | Condicionados às exigências da entrega institucional |

Fundamentação teórica, método e resultados/discussão constituem uma sequência
sugerida de desenvolvimento, não seções impostas pela classe. A validação emite
avisos quando título, autoria, resumo ou palavras-chave não foram preenchidos;
não avalia a suficiência científica dos textos nem exige títulos específicos.

## Características aplicadas

| Característica | Perfil de monografia | Perfil de artigo | Fundamento ou decisão |
| --- | --- | --- | --- |
| Apresentação institucional | Capa, folha de rosto, aprovação, resumos e sumário | Ausente no artigo autônomo; demonstrada separadamente em `tcc-artigo.tex` | Exigências finais dependem do curso |
| Abertura do miolo | Primeira seção extensa | Título/subtítulo, autoria com nota de identificação/vínculo/contato, orientação opcional, resumo e palavras-chave | Organização de artigo, com orientação identificada separadamente da autoria |
| Estrutura textual | Seções primárias via `\chapter` | Introdução, desenvolvimento e parte conclusiva via `\section` | NBR 6022, seções 5.2 e 6.2; títulos e subdivisões adaptáveis ao estudo |
| Quebra de página | Seção primária começa em nova página | Seções e referências seguem o fluxo do artigo | Escolha de apresentação do perfil experimental |
| Espaçamento do corpo | 1,5 | Simples | Recomendação da NBR 6022, seção 6.1; pré-textuais preservam a apresentação atual |
| Fonte e margens | Fonte 12; margens institucionais | Fonte 12; mesmas margens; uma coluna | Fonte 12 recomendada na NBR 6022; margens e coluna são decisões locais, não requisitos universais de artigo |
| Numeração | Seções secundárias e objetos vinculados à seção primária | Seções 1, 1.1; figuras, tabelas e equações 1, 2… | Hierarquia e ordem de ocorrência próprias do miolo de artigo |
| Resumo | Recomendação de 150–500 palavras | Único; faixa orientadora de 100–250 | Escolha do modelo inspirada na NBR 6028:2021 para artigos de periódicos; não é limite universal de TCC |
| Outro idioma | Resumo estrangeiro no volume | Abstract/keywords e título traduzido opcionais | Ausência não gera aviso de obrigatoriedade; elementos presentes devem ser preenchidos de forma coerente |
| Citações e referências | Camada institucional BibLaTeX/Biber | Mesma camada | Mantidas as implementações do projeto para NBR 10520 e NBR 6023 |
| Dados de periódico | Ausentes | Ausentes | DOI, ISSN e datas editoriais exigem um destino de publicação real |

O exemplo reúne fundamentação, método e resultados/discussão como subdivisões
do desenvolvimento. Essa divisão não é obrigatória: um artigo de revisão ou
tecnológico pode precisar de outra sequência. Não foi fixado limite de páginas,
quantidade de referências nem coautoria automática do orientador.

## Adaptações conscientes

As datas de submissão e aprovação são obrigatórias na estrutura editorial da
NBR 6022. Não são geradas no TCC-artigo independente de periódico; a omissão é
uma adaptação acadêmica explícita, não uma reclassificação desses campos na norma.
A data de aprovação da banca, quando usada na apresentação institucional, tem
outra finalidade. Não são gerados DOI obrigatório nem cabeçalhos de periódico.

A fonte 12 e o espaçamento simples seguem a recomendação da NBR 6022. As margens
superior/esquerda de 3 cm e inferior/direita de 2 cm são escolhas do projeto,
mantidas da apresentação atual. A faixa de resumo apenas produz avisos orientadores:
textos fora de 100–250 palavras não são bloqueados por esse critério.

## Como utilizar

```tex
\documentclass[perfil=artigo]{undftex}
```

Comece por `artigo.tex` para trabalhar no artigo autônomo. Edite os metadados em
`artigo/metadados.tex`, o resumo/palavras-chave em `artigo/resumos.tex`, o texto
em `artigo/conteudo.tex` e a bibliografia em `obrigatorio/referencias.bib`.
Os textos fornecidos são orientações e demonstrações, sem resultados empíricos.

`\undfinicioartigo` imprime a abertura em espaçamento simples. A paginação começa
em 1 no artigo autônomo e preserva a contagem quando houver apresentação de TCC.
O resumo é impresso uma única vez em ambos os documentos.

```tex
\identificacaoautor{Graduando em Nome do curso.}
\vinculoautor{Instituição e unidade acadêmica.}
\emailautor{aluno@example.org}
% \tituloartigoestrangeiro{Title in another language}
```

Se desejar abstract e keywords, preencha `artigo/abstract.tex` e habilite sua
inclusão no arquivo principal escolhido. A ausência do arquivo opcional não
gera exigência de tradução; a presença de abstract sem keywords, ou de keywords
sem abstract, gera aviso de preenchimento incoerente.

Use `\section`, `\subsection` e `\subsubsection` e inclua arquivos com `\input`.
`\chapter` gera erro explicativo nesse perfil. Para manter o modelo atual, use
`\documentclass{undftex}` ou a opção explícita `perfil=monografia`.

`tcc-artigo.tex` demonstra capa, folha de rosto e aprovação antes do mesmo artigo.
Esses comandos são explícitos no arquivo de entrega e devem ser mantidos apenas
quando exigidos. Listas, ficha catalográfica e sumário ficam comentados. Não há
resumo institucional duplicado; eventual exigência diferente do curso deve ser
analisada como nova adaptação, sem alterar silenciosamente o artigo autônomo.

Complementos podem ser incluídos após `\printundfreferences`:

```tex
\begin{undfglossario}
  \undfglossitem{Termo}{Definição.}
\end{undfglossario}
\apendice{Material elaborado pelo autor}
Texto do apêndice.
\anexo{Material de outra autoria}
Texto do anexo.
\begin{agradecimentos}
  Agradecimentos pertinentes à pesquisa.
\end{agradecimentos}
```

Esses elementos só aparecem quando chamados; no artigo seguem o fluxo do texto.

## Verificação

O exemplo preenchido `artigo-exemplo-undf.tex` usa conteúdo próprio em
`exemplo/artigo/`. Relata didaticamente resultados da revisão estrutural,
com fontes e limites explícitos; não substitui os arquivos para preenchimento
em `artigo/`. A [documentação do exemplo](../exemplo/artigo/README.md) explica
a origem dos dados e a compilação isolada.

Execute `scripts/verificar-perfis.ps1` na raiz do repositório. O script compila os
cinco modelos com LuaLaTeX/Biber e o caso de artigo com todos os opcionais.
Verifica referências, contadores, resumo único, campos de autoria, ausência de
apresentação institucional no artigo autônomo e avisos de preenchimento. São
testados 99, 100, 250 e 251 palavras para a faixa orientadora inclusiva. Saídas
ficam em `build/perfis/`; a leitura dos PDFs requer `pdftotext`. A integração
contínua compila os mesmos casos e executa `scripts/verificar-artigo.ps1`.

Além dos testes, comparar os PDFs de monografia antes e depois da alteração e
conferir visualmente o artigo autônomo, a entrega institucional e o caso com
abstract e complementos. A `main` permanece na base anterior, e as alterações de
perfis continuam isoladas em `feature/perfis-tcc`.

Na verificação de 14 de outubro de 2026, os quatro modelos e os casos opcionais
compilaram com referências resolvidas. A comparação por SHA-256 do texto extraído
com disposição preservada confirmou ausência de alteração nos dois modelos de
monografia. Os testes de contadores, resumo único, campos obrigatórios e limites
orientadores passaram. A nota de autoria não consumiu a numeração das notas
textuais. As duas páginas do artigo autônomo, cinco da entrega demonstrativa e
três do caso com complementos foram conferidas visualmente.

A conferência visual deve verificar capa, aprovação, resumos, sumário, abertura
do miolo, fluxo das seções, referências e paginação. A compilação demonstra
funcionamento técnico; não comprova atendimento às exigências de cada curso.

## Fontes complementares

As correções e os casos mínimos de apêndices/anexos, referências cruzadas, `apud`
e objetos extensos estão registrados em [Verificação estrutural](verificacao-estrutural.md).


- [Biblioteca da UNILA: estrutura do artigo segundo a NBR 6022](https://portal.unila.edu.br/informes/normas-da-abnt-6): distingue os elementos do artigo e a opcionalidade do título e resumo em outro idioma.
- [Sistema de Bibliotecas da UFJ: NBR 6028:2021](https://sibi.ufj.edu.br/resumo-resenha-e-recensao-abnt-nbr-60282021/): parágrafo único, palavras-chave e faixas de extensão por tipo documental.
- [IFESP: Manual de normalização de artigo científico, 2022](https://www.ifesp.edu.br/pk/wp-content/uploads/2024/Documentos/Biblioteca/artigo.pdf): exemplo de instituição que acrescenta exigências de TCC ao artigo. Suas regras locais e referências antigas de citações não foram transplantadas.

As cópias de ABNT e PPC são referências de consulta fora do repositório. Seus textos
integrais não são redistribuídos com o perfil.

## Encerramento de undf-article-tex

A nova implementação é independente do pacote `undfarticle.sty` e não precisa do
repositório separado para compilar. O levantamento de modalidades do projeto antigo
também existe em `../documentacao/manual-tcc-computacao/`; as orientações gerais de
artigo já estão no manual acadêmico deste repositório.

O usuário confirmou que o projeto antigo nunca foi enviado ao GitHub: a retirada
é apenas local. A implementação substitui a prova de conceito separada. A exclusão
da pasta ativa deve ocorrer depois da validação, preservando seu histórico, alterações
locais e material comparativo em um arquivo de salvaguarda em `../arquivo/`.
O arquivo preparado é `undf-article-tex-encerramento-2026-10-14.zip`; seus 119
arquivos, incluindo `.git` e as três alterações locais pendentes, foram comparados
por SHA-256 com a pasta original. Após o bloqueio da exclusão automatizada, o
usuário removeu a pasta manualmente em 14 de outubro de 2026. A ausência da pasta
ativa e a presença da salvaguarda foram verificadas. Registro de restauração em
`../arquivo/undf-article-tex-encerramento.md`.
