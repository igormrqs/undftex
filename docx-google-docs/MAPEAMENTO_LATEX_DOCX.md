# Mapeamento do UnDF-TeX para DOCX e Google Docs

## Princípio de conversão

O código LaTeX permanece como referência normativa e visual. O DOCX reproduz as mesmas decisões por estilos, seções, tabelas editáveis e campos compatíveis, sem converter páginas do PDF em imagens.

| Elemento | Implementação no LaTeX | Implementação no DOCX | Google Docs | Diferença ou decisão |
|---|---|---|---|---|
| Papel | A4, retrato | Seção A4 | Preservado | Nenhuma diferença observada |
| Margens | 3 cm esquerda/superior; 2 cm direita/inferior | Margens de seção | Preservado | Conferir se o documento está no modo Páginas |
| Fonte | Latin Modern Roman | Times New Roman | Preservado | Substituição escolhida por disponibilidade |
| Corpo | 12 pt, justificado | Estilo Normal 12 pt | Preservado | Sem diferença material |
| Entrelinhas | 1,5 | Estilo Normal 150% | Preservado | Confirmado no conector |
| Recuo | 1,25 cm inclusive no primeiro parágrafo | 35,45 pt no estilo Normal | Preservado | Confirmado no conector |
| Capa | Logo e blocos verticais | Parágrafos e imagem em linha | Preservado visualmente | Posicionamento depende de espaçamento |
| Folha de rosto | Bloco de natureza com 0,55 da largura | Tabela invisível de duas colunas | Preservado | Tabela usada somente para estabilidade |
| Ficha catalográfica | PDF, imagem ou texto | Quadro editável | Parcial | Deve ser substituído pela ficha oficial |
| Errata | Referência e tabela | Tabela nativa 2 x 4 | Preservado | Sem recuo de parágrafo |
| Folha de aprovação | Bloco de natureza e banca | Tabelas de uma coluna com borda superior | Preservado visualmente | Assinaturas continuam editáveis |
| Dedicatória | Bloco inferior à direita | Tabela invisível de posicionamento | Preservado | Excluir quando não utilizada |
| Agradecimentos | Título centralizado | Estilo pré-textual | Preservado | Uma página recomendada |
| Epígrafe | Bloco inferior à direita | Tabela invisível e estilo próprio | Preservado | Autor em linha separada |
| Resumo e abstract | Ambiente próprio, sem recuo | Estilo Resumo | Preservado | Limites não são validados automaticamente |
| Palavras-chave | Comando sem limite quantitativo automático | Parágrafo com rótulo em negrito | Visual preservado | Quantidade adequada ao conteúdo ou definida pelo curso |
| Listas de ilustrações | Geradas pelo LaTeX | Lista manual tabulada | Parcial | Atualização manual no Docs |
| Siglas e símbolos | Ambientes com rótulo de 4 cm | Tabelas invisíveis de duas colunas | Preservado | Mantém alinhamento estável |
| Sumário | Automático pela estrutura LaTeX | Campo TOC com níveis 1–4 | Parcial | No Docs, inserir sumário nativo |
| Capítulos | `chapter`, número e título na mesma linha | Heading 1 e lista multinível | Preservado | Ao inserir novos títulos, continuar a lista anterior |
| Seções | `section` a `paragraph` | Heading 2–4 | Preservado | Quatro níveis confirmados |
| Paginação | Contada desde a folha de rosto; exibida no texto | Seções e campo PAGE | Preservado no modelo estável | Remoção de páginas exige conferência |
| Citação curta | Comandos de citação no parágrafo | Texto normal com aspas | Preservado | Referência bibliográfica não é automática |
| Citação longa | 4 cm, 10 pt, espaço simples | Estilo Citação direta longa | Preservado | Confirmado no PDF |
| Nota de rodapé | Comando próprio | Parte OOXML de nota real | Preservado | Importada como nota nativa do Docs |
| Figura | Ambiente flutuante com legenda e fonte | Imagem em linha | Preservado | Sem flutuação automática |
| Figuras lado a lado | Minipáginas independentes | Tabela invisível 1 x 2 | Preservado | Cada figura conserva legenda e fonte próprias |
| Tabela | Ambiente tabular | Tabela nativa com geometria fixa | Preservado | Tabelas longas exigem revisão |
| Quadro | Variação tabular | Estilo e tabela nativa | Preservado visualmente | Numeração manual no Docs |
| Equação | Matemática LaTeX | Expressão linear editável | Preservado | Equações complexas devem usar editor nativo |
| Fluxograma | TikZ ou ambiente de figura | Tabela vertical editável | Aproximado | Evita imagem fixa e caixas flutuantes |
| Pseudocódigo | Ambiente numerado | Tabela com linhas e Courier New | Preservado | Pode quebrar se o bloco ficar maior que uma página |
| Código-fonte | Ambiente monoespaçado | Estilo Código em quadro | Preservado | Não corresponde a bloco de código nativo do Docs |
| Referências cruzadas | Rótulos e comandos automáticos | Texto visível | Parcial | Conferência manual após alterações |
| Referências | BibLaTeX/Biber | Estilo Referência bibliográfica | Visual preservado | Sem automação equivalente |
| Glossário | Ambiente próprio | Parágrafo com termo em negrito | Preservado | Ordenação manual |
| Apêndices e anexos | Contadores alfabéticos | Títulos pós-textuais manuais | Parcial | Letras e páginas devem ser conferidas |
| Índice | Condicionado | Estrutura manual opcional | Parcial | Sem indexação automática confiável |
| Avisos de uma página | Verificação durante compilação | Orientação e checklist | Não reproduzido | Google Docs não executa validações do template |

## Estrutura textual adotada no DOCX

O DOCX segue a solicitação específica para uma estrutura inicial com capítulos separados: Introdução, Referencial teórico, Metodologia, Resultados, Discussão e Conclusão. Isso difere deliberadamente do exemplo LaTeX atual, que admite capítulo de dados e combina análise e discussão.
