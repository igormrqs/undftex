# Exemplo preenchido de artigo

Compile `artigo-exemplo-undf.tex` a partir da raiz do repositório. Este conteúdo
é independente dos modelos para preenchimento em `artigo/`.

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
As referências seguem o texto sem quebra obrigatória de página. A escolha
dos títulos das seções pertence ao exemplo, não é imposta pela classe.

Verificação local com LuaLaTeX e Biber, inclusive sem Perl:

```powershell
.\scripts\verificar-perfis.ps1 -Documentos artigo-exemplo-undf.tex
```

O PDF e os logs ficam em `build/perfis/`. Com Perl disponível, também é possível
usar `latexmk -outdir=build/perfis artigo-exemplo-undf.tex`. A verificação completa
dos perfis continua disponível em `scripts/verificar-perfis.ps1` sem argumentos.

Na verificação local de 14 de outubro de 2026, o exemplo compilou em cinco
páginas, com as três fontes bibliográficas processadas e sem referências
indefinidas ou avisos de conteúdo ultrapassando a margem. Todas as páginas
foram conferidas visualmente. Os quatro destinos de figura, equação,
pseudocódigo e tabela foram comparados com as páginas dos auxiliares, e o
endereço completo do registro técnico permaneceu preservado no link do PDF.
O novo exemplo também foi incluído na compilação da integração contínua;
esse registro não atesta a execução remota do workflow.

Este é um exemplo de redação e uso técnico. Não representa TCC aprovado,
certificação de conformidade normativa ou validação de todos os documentos
que possam ser produzidos com a classe.
