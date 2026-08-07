# Relatório de regressão — 0.2.0-preliminar

Data: 6 de agosto de 2026  
Versão de entrada: estado local anterior à consolidação documental  
Versão avaliada: 0.2.0-preliminar  
Responsável técnico: equipe técnica do projeto

## Escopo

- manual de TCC e respectivo PDF;
- manual técnico;
- modelo LaTeX em branco;
- TCC de exemplo;
- DOCX local e cópias online identificadas;
- documentação e arquivos de controle.

## Mudanças abrangidas

Aviso de minuta, ficha de controle documental, estados controlados, matriz mestra, registro de decisões, governança das pendências, quadro de compatibilidade, planos de fechamento, testes, sincronização, acessibilidade, usabilidade e critérios de publicação.

## Execuções

| Teste | Resultado | Evidência | Limitação |
|---|---|---|---|
| Execução de TEST-001 | Concluído | AUD-001; 113 páginas renderizadas | Resultado restrito à inspeção visual declarada. |
| Execução de TEST-002 | Concluído | manual-tcc-undf.pdf; log | 113 páginas; ciclo direto porque latexmk não encontrou Perl. |
| Execução de TEST-003 | Concluído | manual-undf.pdf; log | 30 páginas; avisos não bloqueadores registrados. |
| Execução de TEST-004 | Concluído | tcc.pdf; relatório DOCX | LaTeX recompilado com 12 páginas; DOCX não foi alterado. |
| Execução de TEST-005 | Concluído | tcc-exemplo-undf.pdf; log | 34 páginas; cobertura visual integral. |
| Execução de TEST-006 | Parcialmente concluído | ALT; CHK; AUD-005 | Falta validação institucional. |
| Execução de TEST-007 | Parcialmente concluído | AUD-007 | Cobertura externa limitada. |
| Execução de TEST-008 | Pendente de validação | AUD-008 | Sem teste assistivo integral. |
| Execução de TEST-009 | Parcialmente concluído | COMP-001 a COMP-025 | Índice atual de 36%. |
| Execução de TEST-010 | Pendente de implementação | PI-018; COMP-009 | Cópias online desatualizadas. |
| Execução de TEST-011 | Pendente de validação | Plano de usabilidade | Não executado com participantes. |
| Execução de TEST-012 | Concluído | Este relatório | Deve ser repetido após decisões e sincronização online. |

## Resultado

Nenhuma decisão institucional foi presumida. Os quatro PDFs locais foram recompilados e integralmente inspecionados sem bloqueador visual ou de compilação. O manual tem 113 páginas, o manual técnico 30, o modelo em branco 12 e o TCC de exemplo 34. Os PDFs são A4 e não são marcados para acessibilidade.

Permanecem pendentes as validações normativa, bibliográfica, institucional e de acessibilidade, os testes com usuários e a sincronização do Google Docs. Uma nova regressão será obrigatória quando essas decisões e implementações ocorrerem.
