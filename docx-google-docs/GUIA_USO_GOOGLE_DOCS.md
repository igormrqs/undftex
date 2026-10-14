# Guia de uso do modelo UnDF no Google Docs

> Situação em 6 de agosto de 2026: as cópias online abaixo estão em revisão e ainda contêm uma orientação superada sobre a quantidade de palavras-chave. Para trabalho controlado, use os arquivos DOCX locais desta versão. A atualização, validação e republicação online dependem de PI-018.

## Arquivos e versões nativas

- `UnDF-TeX_Google_Docs.docx`: modelo em branco, com campos entre colchetes e orientações removíveis.
- `UnDF-TeX_Google_Docs_exemplo_preenchido.docx`: exemplo completo de preenchimento e dos recursos acadêmicos.
- [Modelo nativo no Google Docs](https://docs.google.com/document/d/1PzEvxibqbeg1n8cmBkd45cjtBv2UWx8JIc3UefgVzcM)
- [Exemplo preenchido no Google Docs](https://docs.google.com/document/d/1BqGegcGNKJR52PNtxW6NBjMkVBr7iZXjIyxqHqYdHCY)

O arquivo DOCX local é a versão portável da implementação atual. Os links são mantidos para rastreabilidade e não devem ser tratados como cópias sincronizadas até o encerramento de PI-018.

## Preparação inicial

1. Mantenha o documento no modo **Páginas**, com papel A4.
2. Faça uma cópia do modelo em branco.
3. Substitua os campos entre colchetes, como `[NOME DO AUTOR]` e `[TÍTULO DO TRABALHO]`.
4. Exclua os parágrafos iniciados por `[ORIENTAÇÃO - EXCLUA ESTE PARÁGRAFO]` depois de cumprir a instrução.
5. Exclua páginas opcionais que não serão usadas: ficha catalográfica, errata, dedicatória, agradecimentos, epígrafe, glossário, apêndices, anexos e índice.

## Formatação principal

O modelo usa papel A4, margens de 3 cm à esquerda e acima e 2 cm à direita e abaixo. O texto normal usa Times New Roman 12 pt, alinhamento justificado, espaçamento 1,5 e recuo de primeira linha de 1,25 cm.

Não formate capítulos manualmente. Use os estilos:

- **Título 1**: capítulos, como `1 INTRODUÇÃO`;
- **Título 2**: seções, como `1.1 Contextualização`;
- **Título 3**: subseções, como `1.3.1 Objetivo geral`;
- **Título 4**: quarto nível de seção.

Ao criar um título novo no Google Docs, a numeração pode iniciar uma lista separada. A forma mais segura é duplicar um título existente do mesmo nível, substituir o texto e usar **Continuar numeração anterior** quando necessário. Confira toda a sequência depois de inserir, excluir ou mover seções.

## Elementos pré-textuais

Preencha capa, folha de rosto e folha de aprovação sem alterar os blocos de posicionamento. Na banca, mantenha o padrão `Prof. Dr. Nome` ou `Profa. Dra. Nome`, com a instituição na linha seguinte. A data de aprovação segue `Brasília, DF, dia de mês de ano`.

O resumo e o abstract devem:

- permanecer em uma página cada;
- formar um único parágrafo, sem recuo;
- conter de 150 a 500 palavras;
- apresentar palavras-chave em quantidade adequada ao conteúdo, separadas por ponto e vírgula e encerradas por ponto.

O DOCX e o Google Docs não bloqueiam conteúdo longo. A conferência é manual.

## Sumário e listas

O DOCX contém um campo de sumário baseado em `Heading 1–4`. No Word, use **Atualizar campo > Atualizar o índice inteiro**. Depois da conversão para Google Docs, apague a mensagem do campo importado e use **Inserir > Elementos da página > Sumário**.

As listas de ilustrações e tabelas são manuais no Google Docs. Atualize títulos e páginas somente depois que o texto e a paginação estiverem estáveis.

## Figuras, tabelas e quadros

Mantenha a legenda acima e a fonte abaixo:

```text
Figura 1 - Título da figura
[IMAGEM]
Fonte: Autor, ano.
```

Duas figuras lado a lado estão dentro de uma tabela sem bordas com duas colunas. Cada figura é independente, com número, título e fonte próprios. Substitua as imagens em cada célula sem excluir a tabela e mantenha ambas como imagens **em linha**.

Tabelas e quadros devem ter título acima, cabeçalho destacado e fonte abaixo. Para tabelas extensas, repita o cabeçalho, evite dividir uma linha entre páginas e confira se nenhuma coluna ultrapassa as margens.

## Equações, fluxogramas, código e pseudocódigo

A equação do exemplo usa uma expressão linear editável para preservar a compatibilidade. Para expressões complexas, use o editor de equações do Google Docs e confira o PDF exportado.

O fluxograma demonstrativo é formado por células editáveis, sem imagem fixa. O pseudocódigo usa tabela com numeração de linhas e fonte monoespaçada. Não aplique recuo de parágrafo normal nesses blocos.

## Citações, notas e referências

- Citação direta curta: até três linhas, no parágrafo e entre aspas.
- Citação direta longa: fonte 10 pt, espaço simples, recuo de 4 cm à esquerda e sem aspas.
- Nota de rodapé: use **Inserir > Nota de rodapé**.
- Referências: alinhadas à esquerda, em espaço simples, separadas entre si por uma linha equivalente.

Não existe equivalência completa para BibLaTeX. Use um gerenciador de referências quando possível, revise a saída e aplique o estilo `Referência bibliográfica`.

## Revisão e exportação

Antes da entrega:

1. atualize o sumário e as listas;
2. confira a numeração das seções;
3. verifique a contagem oculta dos pré-textuais e o primeiro número textual;
4. confirme que resumo, abstract e demais páginas controladas não transbordaram;
5. revise legendas, fontes e referências no texto;
6. use **Arquivo > Fazer download > Documento PDF**;
7. examine todas as páginas do PDF, especialmente quebras, tabelas, figuras e referências.
