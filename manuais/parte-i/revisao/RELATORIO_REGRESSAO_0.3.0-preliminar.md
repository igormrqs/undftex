# Relatório de regressão — 0.3.0-preliminar

Data: 7 de agosto de 2026

| Verificação | Resultado | Evidência |
|---|---|---|
| Compilação da Parte I | Aprovada; 99 páginas | PDF e log |
| Compilação da Parte II | Aprovada; 34 páginas | PDF e log |
| Compilação do volume combinado | Aprovada; 133 páginas e sumário único | PDF e log |
| Modelo em branco | Aprovado; 12 páginas | `tcc.pdf` e log |
| TCC de exemplo | Aprovado; 34 páginas | `tcc-exemplo-undf.pdf` e log |
| Aviso padrão de resumo longo | Código 0 e aviso no log | TEST-016 |
| Bloqueio optativo de resumo longo | Código 1 e erro intencional | TEST-016 |
| Autonomia textual da Parte I | Zero termos técnicos proibidos | TEST-013 |
| Revisão visual | Sem bloqueador | RELATORIO_REVISAO_VISUAL_0.3.0-preliminar.md |

## Riscos residuais

- PDFs ainda não marcados para acessibilidade;
- validações institucionais e normativas formais pendentes;
- interface pública específica para quadros ainda ausente no UnDF-TeX 0.1.0;
- sincronização de formatos externos permanece em fluxo próprio.

Resultado: regressão técnica aprovada para circulação controlada da minuta.
