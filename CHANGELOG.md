# Changelog

Todas as mudanças relevantes deste projeto devem ser registradas neste arquivo.

O formato segue uma adaptação simples do Keep a Changelog, em português.

## [Não lançado]

### Alterado

- Hierarquia visual de seções terciárias e quaternárias refinada para seguir diferenciação tipográfica progressiva.
- Fluxogramas agora possuem ambiente `undffluxograma`, fonte padronizada e exemplo com início/fim.
- Fluxogramas agora alternam automaticamente entre figura e lista própria quando passam de três ocorrências.
- Documentação revisada para refletir comandos atuais, política de imagens, BibLaTeX/Biber e decisões institucionais recentes.
- Comandos amigáveis em português para citações parentéticas, citações com autoria no texto e citações diretas curtas.
- Comandos oficiais de figura agora avisam na compilação quando imagens passam de `5 MB` e reforçam o aviso acima de `10 MB`, recomendando otimização para abaixo de `5 MB`.
- Pseudocódigo padronizado com rótulo e título acima do bloco, assinatura estilo Cormen alinhada à esquerda dentro do quadro, fonte abaixo e finalizadores locais como `Fim-se` e `Fim-para`.
- Figuras lado a lado agora são tratadas como figuras independentes, cada uma com legenda, rótulo, fonte e numeração próprios.
- Exemplo de errata atualizado para usar tabela no padrão visual da ABNT NBR 14724:2024.
- Paginação textual agora preserva a contagem iniciada na folha de rosto, sem contar o verso da folha de rosto com ficha catalográfica.
- Entradas de capítulos primários no sumário agora acompanham a grafia em caixa alta usada no texto.
- Entradas de apêndices e anexos no sumário agora acompanham a grafia em caixa alta usada no texto.
- Entradas manuais do sumário agora recebem âncoras próprias para melhorar hyperlinks no PDF.
- Figuras agora exibem identificação acima da ilustração e fonte abaixo da ilustração.
- Logo da capa ampliada no bloco institucional.
- Documentação revisada para refletir versão registrada, validações, módulos carregados, política de imagens e padrão de commits.

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
