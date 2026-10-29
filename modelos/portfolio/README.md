# Relatório final do portfólio — modalidade 1.1

Compile [portfolio.tex](../../portfolio.tex). O relatório reúne todos os projetos
do percurso declarado e analisa as relações entre experiências, entregas,
contribuição individual e aprendizado. O curso deve confirmar o recorte,
a admissibilidade e os critérios de avaliação; o modelo não fixa quantidade.

Edite `metadados.tex`, `resumos.tex`, `conteudo.tex` e `referencias.bib`.
Os seis capítulos são um roteiro sugerido: introdução, organização, visão
geral dos projetos, desenvolvimento dos projetos, análise integradora e
conclusão. Repita o bloco de desenvolvimento para cada projeto do inventário,
sem excluir silenciosamente experiências com documentação incompleta.

Use os [relatórios parciais](../projeto-aplicado/README.md) para recuperar o
conteúdo e as evidências. Sintetize-os e escreva a análise do conjunto;
o portfólio não é uma concatenação de documentos. Identifique lacunas e
limites, distinguindo contribuição individual e trabalho coletivo.

A apresentação comum de TCC preserva elementos obrigatórios e opcionais,
resumos, sumário e referências em página própria, como no TCC convencional.
Para os complementos, consulte [o índice dos modelos](../README.md).
Artigo científico não é exigido. Este modelo não substitui o relatório
profissional 1.3 nem o negócio tecnológico 1.4.

```powershell
.\scripts\verificar-perfis.ps1 -Documentos portfolio.tex
```

Execute na raiz, com LuaLaTeX, Biber e `pdftotext`. Saídas em `build/perfis/`.
