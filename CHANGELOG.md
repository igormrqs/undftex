# Changelog

Todas as mudanças relevantes deste projeto devem ser registradas neste arquivo.

O formato segue uma adaptação simples do Keep a Changelog, em português.

## [Não lançado]

### Alterado

- Guia e exemplo de pseudocódigo atualizados para recomendar `\clearpage` antes de blocos curtos ou médios quando a quebra automática prejudicar a leitura.

## [0.1.0] - 2026-05-05

### Adicionado

- Documentação inicial do repositório para publicação no GitHub.
- Guia de uso em `docs/guia-de-uso.md`.
- Documento técnico de estrutura em `docs/estrutura-do-projeto.md`.
- Registro de decisões institucionais em `docs/decisoes-institucionais.md`.
- Arquivo `MANIFEST.md` para apoiar a identificação do trabalho sob LPPL.
- Arquivos de licenciamento LPPL.
- Exemplo completo com nota de rodapé, citação curta, citação longa, listas, figuras comparativas, fluxograma e pseudocódigo.
- Comando `\undffigurasladoalado` para comparação visual com duas imagens.
- Ambiente `undfpseudocodigo` para blocos de pseudocódigo com numeração de linhas.

### Alterado

- Organização do projeto para uso da classe pública `undftex`.
- Modelo em branco e exemplo completo alinhados à estrutura modular do template.
- Folha de aprovação ajustada para exibir banca no formato `Prof. Dr. Nome`, sem titulação em linha separada.
- Data de aprovação padronizada no modelo `Brasília, DF, dia de mês de ano`.
- Capa ajustada para não imprimir texto institucional quando a logo já estiver configurada.
- Validação de resumo e abstract passa a bloquear compilação quando o conteúdo parece ultrapassar uma página.
- Errata ajustada para evitar recuo de parágrafo no texto de correção.

### Observação

- PDFs compilados e arquivos auxiliares de LaTeX não devem ser versionados por padrão.
