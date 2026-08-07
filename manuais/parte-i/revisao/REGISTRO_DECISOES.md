# Decisões institucionais validadas no âmbito do projeto

Versão: 0.3.1-preliminar  
Data de referência: 7 de agosto de 2026  
Situação: controle interno do projeto; não substitui o ato de publicação institucional.

| Tema | Decisão validada | Fonte da decisão | Artefatos em que foi implementada | Situação |
|---|---|---|---|---|
| Compilador | LuaLaTeX é o compilador oficial do UnDF-TeX | Decisão 0; reuniões do projeto | `.latexmkrc`; classe; README; Parte II | validada e implementada |
| Formato e margens | A4; 3 cm nas margens superior e esquerda; 2 cm nas margens inferior e direita | Decisão 6; ABNT NBR 14724:2024 | `src/core/undf-layout.sty`; modelos; manual | validada e implementada |
| Espaçamento | Uma linha e meia no corpo; espaço simples nas exceções definidas | Decisão 8 | layout; páginas iniciais; citações; referências | validada e implementada |
| Parágrafos | Recuo de 1,25 cm, inclusive após títulos, sem espaço adicional no corpo | Decisão 7 | layout; modelos; manual | validada e implementada |
| Seções primárias | Forma `1 INTRODUÇÃO`, sem a palavra “Capítulo”, com número e título na mesma linha | Decisão 1 | títulos; sumário; exemplos | validada e implementada |
| Nome institucional | Denominação completa na primeira ocorrência e `UnDF` nas seguintes | Decisões 4 e 9 | identidade; páginas iniciais; manuais | validada e implementada |
| Marca do template | Grafia oficial `UnDF-TeX`, inclusive em títulos e marcadores | Registros editoriais da versão 0.3.1 | manuais; metadados; documentação | validada e implementada |
| Capa | Identidade institucional fixa e ausência do nome do curso | Decisões 3 e 9 | capa; modelo em branco; exemplo | validada e implementada |
| Folha de rosto | Inclusão de curso e natureza do trabalho | Decisões 4 e 10 | metadados; folha de rosto; exemplos | validada e implementada |
| Natureza do trabalho | Texto institucional e bloco com largura, alinhamento e espaçamento definidos | Decisões 4 e 5 | metadados; páginas iniciais | validada e implementada |
| Folha de aprovação | Data no formato `Brasília, DF, dia de mês de ano`; banca em formato uniforme | Decisão 11 | folha de aprovação; exemplos | validada e implementada |
| Titulação da banca | Prefixo acadêmico antes do nome, sem titulação extensa em linha separada | Decisão 12 | metadados; folha de aprovação; manual | validada e implementada |
| Resumos | Resumo em português e resumo em língua estrangeira são elementos distintos | Decisão 14; ABNT NBR 14724:2024 | módulo NBR 6028; modelos; manual | validada e implementada |
| Palavras-chave | Separação por ponto e vírgula e ausência de faixa numérica universal | Decisão 16; ABNT NBR 6028:2021 | módulo NBR 6028; exemplos; manual | validada e implementada |
| Sumário do TCC | Elementos pré-textuais não integram o sumário | Decisão 18; ABNT NBR 6027:2012 | módulos de sumário; modelos; manual | validada e implementada |
| Apêndice e anexo | Distinção pela autoria do material | ABNT NBR 14724:2024; implementação do projeto | estrutura; comandos públicos; exemplos | validada e implementada |
| Figuras lado a lado | Duas imagens independentes recebem números, títulos, fontes e chamadas próprios | Decisão 20 | referências cruzadas; exemplo; manual | validada e implementada |
| Validação de ocupação | Excesso estimado gera aviso por padrão; bloqueio é opção explícita de revisão | Decisão 15 | módulo NBR 6028; modelo; Parte II | validada e implementada |
| Modelo em branco | Versão simples destinada ao uso real | Decisão 25 | `tcc.tex`; capítulos básicos | validada e implementada |
| TCC de exemplo | Demonstração didática mais completa dos recursos do template | Decisão 25 | `tcc-exemplo-undf.tex`; pasta `exemplo` | validada e implementada |
| Conteúdo editável | Autoria e conteúdo ficam separados dos elementos institucionais padronizados | Decisões 9, 25 e 26 | classe; entradas; estrutura de arquivos | validada e implementada |
| Licença do código | LPPL 1.3c ou posterior aplica-se somente aos arquivos de código identificados | Decisão 27, refinada na versão 0.3.1 | licença; manifesto; Parte II | validada e implementada |

## Regra de interpretação

“Validada e implementada” significa que a decisão foi deliberada no desenvolvimento e incorporada aos artefatos indicados. A publicação oficial do manual, a vigência institucional e os fluxos administrativos externos permanecem controlados separadamente.
