# Protótipo de relatório de planejamento de projeto aplicado

Entrada: `relatorio-projeto.tex`, na raiz. O documento ilustra o planejamento
do texto de acompanhamento das modalidades “Relatório técnico ou científico”
e “Produto técnico, tecnológico ou educacional” já descritas no manual.
Não é um novo perfil da classe nem relatório final de execução.

Edite `metadados.tex`, `conteudo.tex` e `referencias.bib` nesta pasta. O tema
de manutenção de laboratório é hipotético: não houve coleta, desenvolvimento
ou teste. O texto distingue diagnóstico a confirmar, proposta e resultados
esperados de evidências de execução.

O protótipo usa capa, folha de rosto, sumário, quatro partes textuais e
referências. A escolha da apresentação é demonstrativa para o planejamento;
não redefine a tabela de elementos obrigatórios/opcionais do TCC final e
não declara conformidade integral com a NBR 10719 ou a NBR 15287.

O miolo contém orientações, tema/contexto, proposta, metodologia e plano de
trabalho com responsáveis, dependências, recursos, riscos e cronograma.
A passagem ao relatório final exige registrar o produto, os resultados da
avaliação, a discussão e a conclusão, além dos elementos exigidos pelo curso.

Compile a partir da raiz, inclusive sem Perl:

```powershell
.\scripts\verificar-perfis.ps1 -Documentos relatorio-projeto.tex
```

As saídas ficam em `build/perfis/`. Com Perl, pode usar
`latexmk -outdir=build/perfis relatorio-projeto.tex`.

Na verificação de 20 de outubro de 2026, o protótipo compilou em nove páginas,
com referência bibliográfica e chamada da tabela resolvidas. Todas as páginas
foram conferidas visualmente, incluindo o cronograma e as referências. Não
foram encontrados avisos de conteúdo ultrapassando a margem. A compilação
foi incluída no fluxo local e na integração contínua; esta verificação não
atesta a execução remota do workflow.
