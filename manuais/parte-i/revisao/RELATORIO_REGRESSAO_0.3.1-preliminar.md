# Relatório de regressão - 0.3.1-preliminar

Data: 7 de agosto de 2026  
Compilador: LuaHBTeX 1.24.0  
Método: três passagens após alterações estruturais e duas passagens após correções localizadas.

| Teste | Parte I | Parte II | Integrado |
|---|---|---|---|
| compilação com `-halt-on-error` | aprovado | aprovado | aprovado |
| páginas geradas | 106 | 40 | 146 |
| referências indefinidas | nenhuma | nenhuma | nenhuma |
| caixas excedentes (`Overfull`) | nenhuma | nenhuma | nenhuma |
| sumário estabilizado | aprovado | aprovado | aprovado |
| marca `UnDF`/`UnDF-TeX` preservada | aprovado | aprovado | aprovado |
| links fictícios não clicáveis | aprovado | não aplicável | aprovado |
| idioma e estrutura marcada | aprovado | aprovado | aprovado |
| inspeção visual integral | aprovado | aprovado | aprovado |

## Avisos aceitos

- avisos de compatibilidade de `titlesec` e `tocloft` com o modo de marcação experimental;
- caixas `Underfull` em células estreitas de tabelas, sem corte ou sobreposição visual;
- um destino sem referência estrutural no volume integrado.

## Resultado

**Aprovado para a revisão 0.3.1-preliminar.** Não foram encontrados erros de compilação, cortes, sobreposições, páginas vazias indevidas ou regressões funcionais nos três artefatos.
