# Exemplo preenchido de artigo

Compile `artigo-exemplo-undf.tex` a partir da raiz do repositório. Este conteúdo
é independente dos modelos para preenchimento em `artigo/`.

Para a entrega institucional preenchida, compile `tcc-artigo-exemplo-undf.tex`.
Ela compartilha estes metadados, resumo, miolo e referências, acrescentando
capa, folha de rosto e folha de aprovação demonstrativa. Os dados de curso e
orientação ficam no arquivo principal institucional; os nomes da banca são
fictícios e o documento informa expressamente que não houve defesa ou aprovação.
Listas, sumário e ficha catalográfica não são incluídos neste exemplo.

O texto relata, para fins didáticos, a revisão local registrada em
`docs/verificacao-estrutural.md` no commit `242953c`. A autoria e o contato são
demonstrativos. As contagens e os resultados foram extraídos desse registro;
não foram inventados participantes, entrevistas ou medições de desempenho.
O artigo novo não integra os quatro modelos anteriores contados no estudo.

As referências externas são páginas efetivamente consultadas do LaTeX Project
e do CTAN. O registro do projeto também é citado e pode ser lido no checkout
local; o acesso ao endereço no GitHub depende das permissões do repositório.
Entradas bibliográficas fictícias de `tests/` não são fontes científicas deste
artigo. O pseudocódigo é uma explicação do procedimento, não o script executável.

O exemplo demonstra resumo, palavras-chave, seções e subseções, citações
indiretas, figura vetorial em TikZ, tabela, equação, pseudocódigo, referências
cruzadas e bibliografia. Não inclui abstract, capa, aprovação ou sumário.
Essa ausência se refere ao artigo autônomo; a versão institucional acrescenta
os elementos de apresentação descritos acima, mantendo o resumo único.
As referências começam em nova página, com o mesmo título institucional do
TCC convencional, conforme a decisão de 20 de outubro de 2026. A escolha
dos títulos das seções pertence ao exemplo, não é imposta pela classe.

Verificação local com LuaLaTeX e Biber, inclusive sem Perl:

```powershell
.\scripts\verificar-perfis.ps1 -Documentos artigo-exemplo-undf.tex
```

Para verificar somente a versão institucional, use o argumento
`-Documentos tcc-artigo-exemplo-undf.tex` no mesmo comando.

O PDF e os logs ficam em `build/perfis/`. Com Perl disponível, também é possível
usar `latexmk -outdir=build/perfis artigo-exemplo-undf.tex`. A verificação completa
dos perfis continua disponível em `scripts/verificar-perfis.ps1` sem argumentos.

Na verificação local de 14 de outubro de 2026, anterior à padronização da
abertura das referências, o exemplo compilou em cinco
páginas, com as três fontes bibliográficas processadas e sem referências
indefinidas ou avisos de conteúdo ultrapassando a margem. Todas as páginas
foram conferidas visualmente. Os quatro destinos de figura, equação,
pseudocódigo e tabela foram comparados com as páginas dos auxiliares, e o
endereço completo do registro técnico permaneceu preservado no link do PDF.
O novo exemplo também foi incluído na compilação da integração contínua;
esse registro não atesta a execução remota do workflow.

A versão institucional preenchida foi verificada na mesma data: oito páginas,
sendo três de apresentação institucional e cinco do artigo, com resumo único,
referências resolvidas e sem conteúdo ultrapassando a margem. Todas as páginas
foram conferidas visualmente e os quatro destinos dos objetos foram confirmados
com a paginação dos auxiliares, que não conta a capa. A compilação institucional
também foi adicionada à integração contínua, sem atestar sua execução remota.

Este é um exemplo de redação e uso técnico. Não representa TCC aprovado,
certificação de conformidade normativa ou validação de todos os documentos
que possam ser produzidos com a classe.

Após a padronização das referências em 20 de outubro de 2026, os exemplos
autônomo e institucional compilaram em seis e nove páginas, respectivamente.
O título de referências foi conferido em nova página, centralizado, com o
mesmo recurso de abertura do TCC convencional. Os quatro destinos dos objetos
continuam corretos em cada exemplo; o resumo único e os demais casos da
verificação completa passaram.
