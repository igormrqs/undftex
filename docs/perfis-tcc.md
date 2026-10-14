# Perfis de TCC: monografia e artigo

Pesquisa e decisão técnica de 14 de outubro de 2026. Desenvolvimento na branch
`feature/perfis-tcc`, a partir da base anterior registrada na `main` em `b7b5961`.

## Escopo e evidência

O perfil novo organiza **o miolo de um TCC em formato de artigo**, dentro da mesma
classe e do mesmo repositório. SBC e REIC deixam de orientar esse perfil. Não foram
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

## Características aplicadas

| Característica | Perfil de monografia | Perfil de artigo | Fundamento ou decisão |
| --- | --- | --- | --- |
| Apresentação institucional | Capa, folha de rosto, aprovação, resumos e sumário | Compartilhada no modelo demonstrativo | Preservação da apresentação atual do projeto; exigências finais dependem do curso |
| Abertura do miolo | Primeira seção extensa | Título/subtítulo, autoria, vínculo, orientação, resumo e palavras-chave | Organização de artigo, com orientação identificada separadamente da autoria |
| Estrutura textual | Seções primárias via `\chapter` | Introdução, desenvolvimento e parte conclusiva via `\section` | NBR 6022, seções 5.2 e 6.2; títulos e subdivisões adaptáveis ao estudo |
| Quebra de página | Seção primária começa em nova página | Seções e referências seguem o fluxo do artigo | Escolha de apresentação do perfil experimental |
| Espaçamento do corpo | 1,5 | Simples | Recomendação da NBR 6022, seção 6.1; pré-textuais preservam a apresentação atual |
| Fonte e margens | Fonte 12; margens institucionais | Fonte 12; mesmas margens; uma coluna | Fonte 12 recomendada na NBR 6022; margens e coluna são decisões locais, não requisitos universais de artigo |
| Numeração | Seções secundárias e objetos vinculados à seção primária | Seções 1, 1.1; figuras, tabelas e equações 1, 2… | Hierarquia e ordem de ocorrência próprias do miolo de artigo |
| Resumo | Recomendação de 150–500 palavras | Recomendação de 100–250 no miolo | NBR 6028:2021; a faixa 150–250 permite reutilizar o resumo nos dois contextos |
| Outro idioma | Resumo estrangeiro no volume | Abstract também na abertura; título estrangeiro opcional | Escolha de manter o resumo estrangeiro atual; não é exigência universal da NBR 6022 |
| Citações e referências | Camada institucional BibLaTeX/Biber | Mesma camada | Mantidas as implementações do projeto para NBR 10520 e NBR 6023 |
| Dados de periódico | Ausentes | Ausentes | DOI, ISSN e datas editoriais exigem um destino de publicação real |

O exemplo reúne fundamentação, método e resultados/discussão como subdivisões
do desenvolvimento. Essa divisão não é obrigatória: um artigo de revisão ou
tecnológico pode precisar de outra sequência. Não foi fixado limite de páginas,
quantidade de referências nem coautoria automática do orientador.

## Como utilizar

```tex
\documentclass[perfil=artigo]{undftex}
```

Comece por `tcc-artigo.tex`; preencha `artigo/resumos.tex`, `artigo/conteudo.tex`,
os metadados e a bibliografia. Os textos fornecidos são orientações e demonstrações,
sem resultados empíricos. `\undfinicioartigo` inicia o miolo, preserva a contagem
do volume, ativa espaçamento simples e imprime a abertura a partir dos metadados
e resumos compartilhados. O título em outro idioma pode ser definido com
`\tituloartigoestrangeiro{...}`.

Use `\section`, `\subsection` e `\subsubsection` e inclua arquivos com `\input`.
`\chapter` gera erro explicativo nesse perfil. Para manter o modelo atual, use
`\documentclass{undftex}` ou a opção explícita `perfil=monografia`.

O modelo conserva resumos institucionais em páginas próprias e os repete na
abertura do artigo. A manutenção dessa repetição e do sumário na entrega é uma
decisão a confirmar com o curso. O sumário pertence ao volume do TCC.

## Verificação

Execute `scripts/verificar-perfis.ps1` na raiz do repositório. O script compila os
três modelos com LuaLaTeX/Biber, verifica referências ainda indefinidas e testa
os contadores dos dois perfis. Saídas ficam em `build/perfis/`. A integração
contínua também compila os modelos e os testes nessa branch.

Na validação local desta implementação, os três modelos compilaram com citações
resolvidas; os testes de numeração passaram nos dois perfis, incluindo duas seções
de artigo na mesma página. Opção desconhecida e uso de `\chapter` no perfil de
artigo foram rejeitados com as mensagens esperadas. As oito páginas do PDF de
artigo foram conferidas visualmente; o miolo ocupa duas páginas, com referências
no fluxo do texto e hifenização inglesa no abstract.

A conferência visual deve verificar capa, aprovação, resumos, sumário, abertura
do miolo, fluxo das seções, referências e paginação. A compilação demonstra
funcionamento técnico; não comprova atendimento às exigências de cada curso.

## Fontes complementares

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
por SHA-256 com a pasta original. A retirada permanece pendente: a revisão
automática bloqueou a operação de exclusão com a mensagem `blocked by policy`,
sem detalhar o motivo; a pasta ativa continua intacta. Registro de restauração em
`../arquivo/undf-article-tex-encerramento.md`.
