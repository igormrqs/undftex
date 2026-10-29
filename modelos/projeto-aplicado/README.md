# Relatório final de um Projeto Aplicado

Entrada: `relatorio-projeto-aplicado.tex`, na raiz. Exemplo independente:
`relatorio-projeto-aplicado-exemplo-undf.tex`.

Este modelo relata um projeto concluído no recorte do semestre, com contexto,
objetivos, fundamentação, método, desenvolvimento, entregas, avaliação e conclusão.
Identifique unidade curricular, semestre, período, equipe e contribuição individual
no início do miolo. Os títulos e as subdivisões são um roteiro sugerido.

Edite `metadados.tex`, `resumos.tex`, `conteudo.tex` e `referencias.bib` nesta pasta.
O modelo usa `perfil=monografia` e a composição institucional existente, sem
criar novas exigências para as entregas semestrais. Para entrega semestral,
confirme com o curso a identificação do trabalho e quais páginas institucionais
devem ser utilizadas. Para o TCC, permanecem os elementos obrigatórios e opcionais
já adotados; veja o [índice dos modelos](../README.md).

Um relatório pode ser selecionado para o portfólio da modalidade 1.1 do Manual
ESETI, mas não é, sozinho, o portfólio consolidado. Critérios de seleção,
texto integrador e avaliação do conjunto ainda dependem de alinhamento com
os professores. O modelo não fixa quantidade de projetos ou critérios de elegibilidade.

O relatório final de agosto de 2026 foi referência de organização, não um modelo
a reproduzir integralmente. Artigo científico não é exigido e não faz parte
da montagem deste documento. Autoavaliação, pareceres e assinaturas do PIDTI
também não foram convertidos em elementos obrigatórios novos.

Compile na raiz:

```powershell
.\scripts\verificar-perfis.ps1 -Documentos relatorio-projeto-aplicado.tex
```

PDF e auxiliares ficam em `build/perfis/`. Consulte as
[decisões dos relatórios](../../docs/relatorios-de-projetos.md).
