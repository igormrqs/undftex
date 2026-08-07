# Relatório de revisão visual — 0.3.0-preliminar

Data: 7 de agosto de 2026  
Ambiente: Windows, LuaHBTeX 1.24.0 e Poppler  
Situação: revisão técnica concluída; validação institucional pendente

## Artefatos

| Artefato | Páginas | Formato | Resultado de compilação |
|---|---:|---|---|
| Parte I — Manual de TCC da UnDF | 99 | A4 | Código 0; sem `Overfull`, erro fatal ou referência indefinida |
| Parte II — Guia de Uso do UnDF-TeX | 34 | A4, com uma página horizontal | Código 0; sem `Overfull`, erro fatal ou referência indefinida |
| Volume combinado | 133 | A4, preservando a página horizontal | Código 0; sem `Overfull`, destinos duplicados ou erro estrutural |

## Procedimento

1. compilação em ciclos explícitos até estabilização;
2. extração de propriedades e contagem de páginas;
3. renderização integral do volume combinado em imagens;
4. revisão por folhas de contato de todas as 133 páginas;
5. inspeção ampliada da capa, do sumário geral, das divisórias, tabelas, página horizontal e controle;
6. inspeção específica de páginas com pouco conteúdo e transições entre apêndices;
7. verificação da sequência e dos marcadores por `pypdf`;
8. busca no texto extraído da Parte I por termos técnicos proibidos.

## Resultados

- nenhuma página cortada, sobreposta ou fora das margens;
- nenhum bloco de código ultrapassa a área útil;
- a página horizontal da referência de comandos permanece legível e corretamente orientada;
- páginas órfãs antes localizadas na rubrica e no relato de problema foram eliminadas;
- a Parte I possui capa, apresentação, sumário, paginação e controle próprios;
- a Parte II possui capa, apresentação, sumário, paginação e controle próprios;
- o volume apresenta capa, sumário, paginação e controle documental únicos, com divisórias antes de cada parte;
- o sumário geral ocupa dez páginas e reúne a hierarquia completa das Partes I e II;
- os marcadores superiores do volume apontam para a apresentação, a Parte I e a Parte II, com marcadores internos preservados;
- a Parte I apresentou zero ocorrências de UnDF-TeX, LaTeX, LuaLaTeX, BibLaTeX, Biber, nomes de módulos, comandos e compilação;
- o modelo em branco permaneceu com 12 páginas e o exemplo completo com 34 páginas após a regressão.

## Limitações

Os PDFs não possuem marcação estrutural (`Tagged: no`). A revisão visual não certifica acessibilidade, conformidade normativa integral, correção metodológica nem aprovação institucional. Essas validações permanecem em seus fluxos próprios.

## Conclusão

Não foi identificado bloqueador visual ou técnico para circulação controlada da minuta 0.3.0-preliminar. A publicação como orientação institucional depende das decisões, validações e do ato registrados nos documentos de governança.
