# Verificação de referências, manual e protótipo de projeto

Revisão de 20 de outubro de 2026 em `feature/perfis-tcc`.

- `scripts/verificar-perfis.ps1` executado integralmente: seis modelos,
  protótipo de projeto e casos de regressão compilaram com referências
  resolvidas; contadores, resumo único, complementos, apud e objetos extensos
  passaram nas verificações existentes.
- A abertura das referências no artigo usa o mesmo recurso de título
  institucional da monografia, mantendo nível de seção no eventual sumário.
  Uma verificação adicional confirma que não existe texto anterior ao título
  na página de abertura. As entradas continuam usando a camada compartilhada.
- Os exemplos preenchidos de artigo autônomo e TCC-artigo têm seis e nove
  páginas. Foram conferidas visualmente as páginas de referências e verificados
  os quatro destinos de figura, tabela, equação e pseudocódigo em cada arquivo.
- O protótipo `relatorio-projeto.tex` tem nove páginas. Foram conferidos
  visualmente capa, folha de rosto, sumário, orientações, conteúdo, cronograma
  e referências. Trata-se de planejamento com contexto hipotético, sem declarar
  coleta, desenvolvimento ou avaliação realizados.
- O manual acadêmico compilou em 108 páginas e o volume integrado em 148.
  Os sumários e referências internas estabilizaram. Foram conferidas as páginas
  das orientações acrescentadas e sua continuação nos dois volumes. O endereço
  público está preservado como link completo nos PDFs.
- Não foram encontrados avisos de conteúdo ultrapassando a margem ou
  referências indefinidas nos documentos alterados. A classificação dos
  elementos obrigatórios e opcionais nos capítulos de estrutura e pré-textuais
  permanece sem alteração.

As saídas ficam em `build/perfis/`, `build/manual-academico/` e
`build/manual-integrado/`. A leitura e inspeção não constituem validação
institucional integral nem auditoria completa de acessibilidade. A execução
remota da integração contínua não é atestada por este registro.

A publicação da base estável está documentada separadamente em
[publicação dos repositórios](publicacao-repositorios.md). A `main` privada
permanece em `b7b596122aa2e3e76659f43d29756f07b12b17ab`; não houve merge
do desenvolvimento experimental.
