# Relatório de compatibilidade com DOCX e Google Docs

Versão de controle: 0.2.0-preliminar  
Data de referência: 6 de agosto de 2026

## Escopo testado

Foram avaliados o modelo em branco e o exemplo preenchido nos fluxos de geração do DOCX, abertura e exportação pelo LibreOffice 26.2.4.2, renderização do PDF, importação para Google Docs e leitura estrutural das cópias online. O Microsoft Word não estava disponível no ambiente.

## Resultados separados

| Artefato/etapa | Resultado | Estado | Limitação |
|---|---|---|---|
| DOCX modelo local | 26 páginas na execução registrada; sem corte ou sobreposição visual identificados | Concluído | Resultado restrito à versão e ao ambiente testados |
| DOCX exemplo local | 27 páginas na execução registrada; sem corte ou sobreposição visual identificados | Concluído | Não substitui teste no Microsoft Word |
| Estrutura importada no Google Docs | Títulos, tabelas, imagens, nota e listas foram reconhecidos na execução registrada | Parcialmente concluído | Recursos automáticos do Word e do LaTeX não são equivalentes |
| Conteúdo das cópias online atuais | Foi localizada orientação superada de “três a seis” palavras-chave | Pendente de implementação | As cópias online não estão sincronizadas com os arquivos locais |
| Exportação online | PDFs anteriores foram inspecionados | Pendente de validação | Deve ser repetida depois da correção e republicação |
| Acessibilidade | Imagens locais possuem texto alternativo em parte do fluxo | Pendente de validação | Não houve certificação, auditoria integral ou teste completo com tecnologia assistiva |

## Estrutura observada

- Times New Roman 12 pt no estilo normal;
- alinhamento justificado, espaçamento de 150% e recuo de 35,45 pt;
- títulos reconhecidos como `HEADING_1` a `HEADING_4`;
- tabelas e imagens editáveis;
- nota de rodapé nativa;
- listas com marcadores e numeração;
- expressão matemática preservada como texto editável.

## Limitações funcionais

| Recurso | Situação | Ação do usuário ou do mantenedor |
|---|---|---|
| Novo capítulo e numeração | Parcialmente consistente | Duplicar título equivalente, continuar numeração e revisar sequência |
| Sumário | Parcialmente consistente | Recriar como sumário nativo e atualizar antes da exportação |
| Listas de figuras e tabelas | Não implementado automaticamente | Atualizar manualmente depois da paginação |
| Referências cruzadas | Parcialmente consistente | Conferir números depois de alterações |
| Validação do resumo | Não implementado | Conferir extensão e página manualmente |
| Figuras lado a lado | Parcialmente consistente | A tabela invisível preserva o arranjo, mas exige revisão |
| Pseudocódigo | Parcialmente consistente | Dividir blocos longos e conferir a exportação |
| PDF acessível | Não implementado | Definir padrão e executar TEST-008 |

## Situação controlada

**Implementação local concluída; validação e publicação online pendentes.**

As cópias online não devem ser declaradas vigentes nem sincronizadas até a correção da regra de palavras-chave, a repetição dos testes de edição/exportação e o registro da autorização prevista em PI-018.
