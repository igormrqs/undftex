# Verificação estrutural dos perfis

Revisão de 14 de outubro de 2026, na branch `feature/perfis-tcc`.

## Problemas reproduzidos e correções

Os casos mínimos confirmaram três problemas antes da alteração:

- a primeira seção do apêndice no artigo continuava em `2`, em vez de `A.1`;
- o pseudocódigo curto era deslocado para a página seguinte apesar de caber no
  espaço disponível, devido à reserva de meia página;
- a bibliografia do caso `apud` sem consulta independente incluía a obra original.

A inspeção das referências também encontrou títulos incorretos em `\nameref`
para complementos da monografia. Esses títulos agora são registrados com a
letra e o texto do complemento, sem depender do último título de seção.

Apêndices e anexos mantêm sequências alfabéticas separadas. Cada complemento
reinicia suas seções, figuras, tabelas, equações, pseudocódigos e fluxogramas
com o prefixo da letra. Os destinos de hyperlinks incluem o tipo de complemento,
evitando colisões entre o apêndice A e o anexo A. Os títulos permanecem sem
indicativo numérico, como antes.

Os comandos `\apudbib` e `\apudbibonline` preservam suas assinaturas. A consulta
de autoria/ano da original é distinguida de uma citação independente. A lista
gerada por `\printundfreferences` omite a original usada apenas como citação de
citação, mas a inclui se citada independentemente na mesma `refsection`, antes
ou depois do `apud`. A decisão é separada por seção bibliográfica. Os dados da
original continuam disponíveis nos auxiliares para montar a chamada no texto;
a filtragem é da lista impressa, não da base de dados. Chamadas diretas a
`\printbibliography` não aplicam esse filtro institucional.

As formas `\parenciteapud` e `\textapud` permitem informar autoria/ano originais
como texto e usar uma chave apenas para a consultada. Não exigem cadastrar a
obra original no arquivo bibliográfico.

## Casos de regressão

| Caso | Verificação |
| --- | --- |
| `tests/complementos-monografia.tex` | Apêndices A/B e anexos A/B com seções, subseções, figuras, tabelas e equações; referências por número e título |
| `tests/complementos-artigo.tex` | Mesma matriz no artigo, preservando o fluxo contínuo |
| `tests/apud.tex` | Somente a consultada; original citada antes; original citada depois; isolamento entre seções bibliográficas |
| `tests/objetos-extensos.tex` | Blocos curtos no espaço disponível, título extenso, pseudocódigo, tabela e citação atravessando páginas |
| `tests/pagina-externa.tex` e `tests/inclusao-pdf.tex` | PDF gerado para teste incluído uma vez como apêndice e uma vez como anexo |

Os dados bibliográficos de `tests/apud.bib`, as falas de teste e os procedimentos
do pseudocódigo são fictícios e não representam pesquisa ou transcrição reais.
As verificações usam dados próprios dos testes, sem exigir alterações nos modelos
editáveis dos estudantes.

## Execução

Na raiz do repositório, execute:

```powershell
.\scripts\verificar-perfis.ps1
```

O script compila os modelos e casos de teste, executa Biber e estabiliza as
referências. Em seguida, `scripts/verificar-estrutura.ps1` verifica os rótulos,
os avisos de referências indefinidas ou destinos duplicados, as quatro listas
bibliográficas, a inclusão do PDF e a continuação dos objetos. Os contadores
de complementos e o aproveitamento das páginas dos blocos curtos também são
verificados durante a compilação por asserções LaTeX.

Os arquivos ficam em `build/perfis/`. A integração contínua usa os mesmos casos.
Para a inclusão de PDF, `pagina-externa.tex` deve ser compilado antes de
`inclusao-pdf.tex`; o script e o workflow já respeitam essa ordem.

## Limites da alteração

O pseudocódigo comum reserva cinco linhas para seu início, e a citação longa,
quatro. Essa reserva não promete que o bloco inteiro caiba. Os blocos extensos
podem continuar na página seguinte, e títulos longos de pseudocódigo quebram
dentro da largura textual.

`undftabela` continua sendo uma tabela flutuante de uma página; para tabelas
que devam continuar entre páginas, use `longtable`. Figuras permanecem como
unidades indivisíveis: ajuste suas dimensões para caber na área textual. Não
foram alteradas as regras de passagem entre três e quatro fluxogramas nem
criado um modo novo de posicionamento de figuras.

## Resultado local

Os quatro modelos principais e os casos de regressão compilaram com referências
resolvidas. As verificações de estrutura, `apud`, objetos multipágina e inclusão
de PDF passaram. Uma inspeção dos PDFs também confirmou que os 48 destinos dos
rótulos de complementos apontam para as páginas registradas nos auxiliares.
Os casos visuais de complementos nos dois perfis, os quatro cenários de `apud`,
as sete páginas de objetos e as quatro de inclusão de PDF foram conferidos.

O guia técnico atualizado compilou em 40 páginas. A execução remota do workflow
não é apresentada como resultado desta verificação local. A `main` permanece
na base anterior; as correções e testes estão na branch de desenvolvimento.
