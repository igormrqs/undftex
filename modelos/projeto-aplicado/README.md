# Relatório parcial de cada projeto

Este registro preserva a memória de um Projeto Aplicado: o que foi realizado,
por quê, com quem, quais resultados surgiram e onde recuperar as evidências.
Pode ser preenchido durante o projeto ou retrospectivamente, com as lacunas
identificadas. Não exige periodicidade, parecer, nota ou cronograma.

Compile [relatorio-projeto-aplicado.tex](../../relatorio-projeto-aplicado.tex).
Edite `metadados.tex` (identificação), `conteudo.tex` (relato e evidências) e
`referencias.bib` (fontes efetivamente consultadas). Os seis tópicos são um
roteiro flexível: responda com o conteúdo disponível, sem inventar resultados.
Identifique a contribuição individual em trabalhos de equipe e preserve
caminhos, versões e códigos de evidência que permitam recuperar os materiais.

A abertura é enxuta, sem capa de TCC, banca, resumos ou sumário. As fontes
consultadas aparecem ao final do registro com o estilo bibliográfico comum.
O nome do arquivo principal foi preservado; ele agora produz o relatório
parcial, substituindo a montagem anterior de relatório final de um projeto.

Na consolidação, sintetize este registro em [portfolio.tex](../../portfolio.tex)
e relacione-o aos demais projetos do percurso. Não concatene os registros para
formar o TCC. A apresentação acadêmica completa pertence ao portfólio final.
Artigo científico não é exigido.

Na raiz, com LuaLaTeX, Biber e `pdftotext`:

```powershell
.\scripts\verificar-perfis.ps1 -Documentos relatorio-projeto-aplicado.tex
```

PDF e auxiliares ficam em `build/perfis/`. Não compile os arquivos de conteúdo isoladamente.
