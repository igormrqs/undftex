# Resumo executivo da consolidação

Documento: Manual de Trabalhos de Conclusão de Curso da UnDF  
Versão: 0.3.1-preliminar  
Data de referência: 7 de agosto de 2026  
Nível de liberação atual: A - circulação interna

> Minuta preliminar — não constitui orientação institucional definitiva.

## Diagnóstico de entrada

O conjunto reúne manual acadêmico, manual técnico, template LaTeX, modelo em branco, TCC de exemplo, DOCX, Google Docs e documentos de controle. O conteúdo acadêmico e normativo foi amplamente revisado e os PDFs locais foram compilados e inspecionados. Permanecem abertas decisões de governança, identidade editorial, fluxos institucionais, acessibilidade e publicação online.

Na edição 0.3.1-preliminar, o conteúdo permanece dividido em Parte I acadêmica, independente de ferramenta, e Parte II exclusivamente técnica. As partes autônomas possuem 106 e 40 páginas; o volume integrado possui 146 páginas, capa, sumário, paginação e controle documental únicos.

## Maturidade por dimensão

| Dimensão | Situação | Estado controlado | Evidência | Limitação |
|---|---|---|---|---|
| Técnica | Modelos LaTeX compilam; DOCX local abre e exporta | Parcialmente concluído | AUD-001, AUD-002 e TEST-001 a TEST-004 | Decisões futuras exigirão nova regressão |
| Normativa | Regras centrais foram conferidas nas NBR utilizadas | Pendente de validação | ALT-001 a ALT-031; AUD-005 | Revisão técnica não equivale a validação institucional |
| Visual | Manual, manual técnico, modelos e PDF do DOCX foram inspecionados | Concluído | AUD-001 | Resultado limitado ao escopo visual declarado; não certifica acessibilidade, mérito acadêmico ou aprovação |
| Compatibilidade | Estrutura principal é semelhante entre formatos | Parcialmente concluído | COMP-001 a COMP-025 | Tipografia, títulos, automações e Google Docs divergem |
| Acessibilidade | PDFs declaram idioma, metadados e estrutura marcada | Parcialmente concluído | AUDITORIA_ACESSIBILIDADE_0.3.1-preliminar.md | Não houve certificação PDF/UA nem teste completo com tecnologia assistiva |
| Governança | Pendências e níveis de liberação estão formalizados | Pendente de decisão institucional | PI-001 a PI-019 | Responsáveis, prazos, ato, vigência e canal não foram definidos |
| Prontidão institucional | Material apto para análise e deliberação | Pendente de validação | DOC-001 a DOC-020 | Não pode ser publicado como orientação institucional definitiva |

## Correções consolidadas

- elementos pré-textuais foram retirados do sumário;
- paginação foi explicada segundo a contagem normativa;
- resumo em língua estrangeira foi mantido como elemento distinto;
- foi removida a faixa não normativa de três a seis palavras-chave nos artefatos locais;
- chamadas autor-data e modelos de referências foram atualizados;
- modalidades de TCC foram condicionadas aos PPCs e regulamentos;
- ética, proteção de dados, integridade, IA e acessibilidade receberam tratamento próprio;
- ambiguidades de estado foram substituídas por estados controlados;
- resumo, dados catalográficos, folha de aprovação e DOCX/Google Docs foram separados em registros independentes;
- foi criada rastreabilidade entre decisões, alterações, checklist, compatibilidade, pendências, testes e auditorias.

## Compatibilidade entre formatos

O DOCX local usa Times New Roman; o Google Docs publicado também apresenta Times New Roman, mas ainda contém a regra antiga de palavras-chave; o LaTeX usa Latin Modern. A proposta de TeX Gyre Termes permanece sem deliberação. A escala dos títulos também diverge: o LaTeX usa tamanho maior nas seções primárias e o DOCX usa 16 pt em `Heading 1`. Esses itens permanecem em PI-004 e PI-005.

Situação controlada do Google Docs: **implementação local concluída; validação e publicação online pendentes**. A cópia online foi identificada e auditada, mas não foi substituída nem declarada vigente.

## Riscos prioritários

| ID | Risco | Nível | Controle atual |
|---|---|---:|---|
| RISCO-001 | Publicação sem ato, responsável ou vigência | Alto | Nível A e aviso de minuta preliminar |
| RISCO-002 | Divergência tipográfica e de títulos | Alto | PI-004, PI-005 e COMP-004 a COMP-006 |
| RISCO-003 | Google Docs manter regra superada | Alto | PI-018 e TEST-010 |
| RISCO-004 | Fluxos de ficha, depósito e ética não definidos | Alto | PI-008, PI-009 e PI-015 |
| RISCO-005 | Orientação de acessibilidade ser confundida com conformidade | Alto | AUD-008 e checklist específico |
| RISCO-006 | Validação de uma página variar entre ferramentas | Médio | PI-012 e COMP-010 |
| RISCO-007 | Modalidade geral ser interpretada como autorização do curso | Médio | PI-010 e FLUXO-004 |
| RISCO-008 | Versões obsoletas permanecerem em circulação | Médio | PI-002, PI-016 e PI-018 |

## O que impede a versão 1.0.0

Impedem a liberação institucional: definição de governança; ato e vigência; fluxos de ficha e depósito; decisão tipográfica e de títulos; validação da folha de aprovação; critérios e homologação de acessibilidade; sincronização do Google Docs; testes de usabilidade; auditoria de regressão após as deliberações; registro das validações formais em PI-019.

## Recomendação

Adotar primeiro os blocos de governança, depois deliberar sobre identidade e fluxos, implementar as decisões em todos os artefatos e executar nova regressão. A versão 1.0.0 só deve ser atribuída quando o checklist de publicação estiver integralmente acompanhado das evidências exigidas.

**O manual está tecnicamente pronto para deliberação institucional, mas ainda não está institucionalmente pronto para publicação oficial.**
