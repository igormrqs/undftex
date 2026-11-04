# F04 — Medição pré-textual e notas de rodapé

## Defeito e delimitação

No commit anterior `517af20`, a composição antecipada em `vbox` executava o
conteúdo sem restaurar incrementos globais de contadores. Uma prova com notas
em resumo e agradecimentos passou de `footnote=0, Hfootnote=0` para `2, 2`
somente ao validar; as primeiras notas impressas receberam 3 e 4. Um
`refstepcounter` sintético avançou de 0 para 1 e uma citação presente somente
na caixa descartada entrou no BCF. Labels comuns nessa caixa não apareceram
no AUX: não se atribuiu a eles um defeito que a reprodução não demonstrou.

A correção mantém a composição, restaura os valores que os contadores registrados
pelo LaTeX tinham antes de medir e desabilita, localmente, escrita de auxiliares e solicitação/
rastreamento bibliográfico. O registro institucional de fontes consultadas
respeita a solicitação do BibLaTeX: medir uma citação não equivale a consultá-la.
Notas e citações não são apagadas nem substituídas por texto fictício para medir.
Na mesma prova corrigida, os contadores permaneceram em 0, as notas impressas
foram 1 e 2, o contador sintético permaneceu em 0 e a chave descartada não entrou
no BCF.

Isso não é uma transação geral de TeX: definições globais arbitrárias, criação
de contadores durante a medição, escrita imediata explícita do autor e comandos
que alterem a estrutura documental não são conteúdo admitido para essa análise.
Declare macros/contadores no preâmbulo; os blocos devem conter conteúdo de
composição. A altura continua sendo uma estimativa da caixa, não uma garantia
de paginação final com todas as inserções, títulos, imagens ou floats.

## Modelos e critérios normativos

`tcc.tex` e `tcc-exemplo-undf.tex` chamam a validação diretamente. Portfólio,
Relatório de Projeto e Negócio Tecnológico, com seus exemplos, usam
[pre-textuais.tex](../modelos/comum/pre-textuais.tex). São medidos resumo,
abstract, dedicatória, agradecimentos, epígrafe, errata e ficha textual.
Projeto Aplicado não chama esse validador. O artigo verifica palavras em sua
abertura, sem essa medição; a chamada explícita à validação também é testada
nesse perfil, preservando a nota de autoria com símbolo separado.

Foram consultadas as cópias locais da NBR 10520:2023 (8 e 8.2), NBR 14724:2024
(5.2 e 5.2.1), NBR 6028:2021 (4.1.2 e 4.1.8) e NBR 6022:2018 (5.1.2 e 6.3),
em `referencias/normas-abnt/` do workspace. No arquivo da NBR 6028, a consulta
normativa se limita ao texto da norma, sem usar o material de terceiros anexado.

- A NBR 10520 exige sequência consecutiva para notas explicativas, recomenda
  início por capítulo/parte e não permite reinício por página. Preservou-se a
  monografia com reinício por capítulo e o artigo com sequência entre seções e
  páginas. A nota de autoria usa chamada própria, coerente com a NBR 6022.
- A NBR 6028 orienta parágrafo único e faixas de palavras: 150–500 para trabalhos
  acadêmicos/relatórios e 100–250 para artigos de periódicos. As faixas, a contagem
  heurística e os avisos existentes foram preservados. O limiar de 85% da altura
  e o bloqueio opcional de resumo longo são políticas práticas do projeto.
- A NBR 14724 trata também de fonte menor, espaçamento simples, filete de 5 cm
  e alinhamento das linhas das notas. Esta correção não certifica esse conjunto:
  a classe ainda herda o filete de `0.4\columnwidth` e a composição de notas de
  `report`. A revisão tipográfica pertence à F05 e permanece pendente.

Cópias do texto normativo acessíveis para conferência:
[NBR 10520](https://coc.fiocruz.br/wp-content/uploads/2024/03/Abnt_nbr_10520_2023.pdf),
[NBR 14724](https://engenhariaedesenvolvimentosustentavel.ufes.br/sites/engenhariaedesenvolvimentosustentavel.ufes.br/files/field/anexo/abnt_nbr_14724.pdf),
[NBR 6028](https://universidadeniltonlins.com.br/wp-content/uploads/2021/09/6028-Resumo-atualizada-em-18.05.2021-.pdf).
Compilar ou aprovar esses testes não certifica conformidade ABNT integral.

## Regressão permanente

Execute em checkout descartável, com as ferramentas do CI disponíveis:

```powershell
pwsh -NoProfile -File ./scripts/verificar-medicao.ps1
```

Sete resultados obrigatórios em `build/ci/f04.json` verificam:

- os sete blocos medidos duas vezes, em ambos os perfis, com valores iniciais
  não nulos de notas, destinos Hyperref e contadores com dependências;
- números e textos no PDF, nota explícita, minipágina, capítulos/seções/páginas,
  nota de autoria do artigo, referência a nota e ausência de destinos duplicados;
- AUX sem label descartado e com label impresso; BCF sem chave oculta, mas com
  as fontes reais do `apud`; referências sem promover a original a consultada;
- entrada real do TCC com primeira nota dos agradecimentos em 1, além do caminho
  compartilhado pelos relatórios exercitado no teste de monografia;
- avisos de resumo curto/longo e de tamanho de bloco, aviso de palavras,
  impressão em modo de aviso e erro esperado no modo de bloqueio.

A implementação anterior reprova o teste de contador. A prova focal e a regressão
integral devem usar fontes atuais e saídas novas; PDFs oficiais não são entradas
nem destinos desses testes. F03, F06 e F07 mantêm seus contratos e limites.
