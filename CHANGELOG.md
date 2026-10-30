# Changelog

Todas as mudanças relevantes deste projeto devem ser registradas neste arquivo.

O formato segue uma adaptação simples do Keep a Changelog, em português.

## [Não lançado]

### Adicionado

- Campos GitHub e versão no relatório parcial, com orientação para repositório do projeto, README e evidências vinculadas a commit ou tag.
- Relatório final do portfólio de Projetos Aplicados, com modelo preenchível, exemplo independente, inventário completo e análise integradora do conjunto.
- Relatório parcial de cada projeto para preservar memória, conteúdo e evidências; exemplo com seis casos técnicos reproduzíveis e guia documental de um segundo projeto.

- Verificação da organização documental, dos links locais em Markdown e da ausência de auxiliares versionados, integrada ao GitHub Actions.
- Modelo final 1.4 de desenvolvimento e análise de negócio tecnológico, com exemplo didático independente e simulação financeira identificada.
- Exemplo preenchido do relatório final 1.3, índice de escolha dos modelos, arquivos editáveis separados por modalidade e conferência automática dos quatro PDFs.

### Alterado

- Publicação consolidada no repositório `undftex`, com base anterior na `main` e modelos atuais em `feature/perfis-tcc`; links dos manuais e guias atualizados para o repositório único.

- Roteiros parciais orientam piloto de síntese de até cinco páginas, com método, avaliação e evidências externas identificadas; portfólios distinguem a proposta de mínimo de três projetos ainda em revisão das regras aprovadas pelo curso.

- Entradas de Projeto Aplicado convertidas em registros parciais enxutos, sem apresentação de TCC; manual, índices e verificadores distinguem os registros do portfólio final.

- Roteiro de projeto técnico/profissional ampliado com vínculo, contribuição individual, evidências e balanço de execução; referência de agosto adotada sem exigir artigo.

- Guias de escolha e organização passam a indicar todas as modalidades e distinguem o caminho legado `opcional/` da obrigatoriedade dos dados catalográficos na entrega final.
- Índices de documentação e manuais acrescentados para separar uso, manutenção e registros históricos.
- Exemplos de compilação local passam a direcionar PDFs e auxiliares para `build/perfis/`.
- Protótipo de planejamento 1.3 convertido em relatório final de projeto técnico/profissional, com desenvolvimento realizado, entregas, resultados, avaliação, discussão e conclusão.
- Conteúdo anterior de `projeto-aplicado/` reorganizado em `modelos/relatorio-projeto/`; apresentação institucional compartilhada em `modelos/comum/`, preservando o perfil de monografia e os elementos obrigatórios/opcionais.

## [1.0.0] - 2026-10-20

### Adicionado

- Orientações para reaproveitar o TCC-artigo em submissão a revista, preservando a entrega acadêmica e adaptando o manuscrito às instruções editoriais.
- Protótipo de relatório de planejamento de projeto aplicado, com contexto, proposta, metodologia, entregáveis e cronograma, sem criar novo perfil nem alterar os elementos obrigatórios/opcionais do TCC.
- Entrega institucional preenchida em `tcc-artigo-exemplo-undf.tex`, com capa, folha de rosto e aprovação demonstrativa, compartilhando o conteúdo do artigo preenchido e integrada às verificações local e contínua.
- Artigo preenchido em `artigo-exemplo-undf.tex`, com conteúdo independente em `exemplo/artigo/`, resultados locais rastreáveis e demonstrações de citações, figura, tabela, equação e pseudocódigo; compilação incluída na verificação local e na integração contínua.
- Perfis `monografia` (padrão preservado) e `artigo` (experimental) na classe `undftex`.
- Modelos `artigo.tex` (autônomo) e `tcc-artigo.tex` (entrega institucional demonstrativa), com conteúdo compartilhado, resumo único e apresentação institucional condicionada ao curso.
- Identificação, vínculo e contato do autor em nota própria, título traduzido e abstract/keywords opcionais, e complementos pós-textuais em fluxo contínuo no perfil de artigo.
- Especificação consolidada da modalidade artigo, com adaptações institucionais explícitas e distinção entre monografia, TCC-artigo e manuscrito destinado a publicação.
- Verificações de resumo único, ausência de apresentação institucional no artigo autônomo, campos obrigatórios e limites inclusivos da faixa orientadora de 100–250 palavras.
- Pesquisa das características de TCC em formato de artigo, sem adotar SBC/REIC como base editorial, e guia de integração TeXstudio–GitHub.
- Verificação local dos perfis sem dependência de Perl e compilação do artigo e dos testes de numeração na integração contínua.

- Arquivo `.latexmkrc` para compilação em uma única chamada (`latexmk`), com LuaLaTeX + Biber, compatível com uso local e Overleaf.
- Workflow de integração contínua em `.github/workflows/build.yml` compilando o modelo em branco e o exemplo completo em ambiente limpo.
- Seção opcional de dados ou corpus após a metodologia, disponível no modelo em branco e demonstrada no exemplo completo.
- Manual acadêmico de TCC da UnDF em fonte LaTeX, separado do manual técnico do template.

### Corrigido

- Apêndices e anexos reiniciam seções e objetos com prefixo alfabético nos dois perfis, preservando sequências e destinos de hyperlinks distintos, inclusive nas referências por título.
- A bibliografia institucional omite obras originais usadas somente pelos comandos `apud` com duas chaves e as mantém quando citadas independentemente na mesma seção bibliográfica.
- Início de citações em bloco e pseudocódigos usa uma reserva de linhas, evitando que blocos curtos sejam antecipados por percentuais fixos da página; títulos extensos de pseudocódigo passam a quebrar na largura do texto.

- `.gitignore`: adicionadas as extensões `*.lofl` (lista de fluxogramas) e `texput.log`; removida a regra `*.lua`, que ocultaria código Lua legítimo; abertas exceções para PDFs que são fonte do trabalho em `figuras/`, `identidade/` e `opcional/` (ficha catalográfica, anexos e figuras vetoriais).
- Removidos artefatos de compilação órfãos espalhados em `capitulos/`, `exemplo/`, `obrigatorio/`, `opcional/` e `src/core/`.
- Glossário unificado em uma única implementação: o ambiente oficial `undfglossario` e o comando `\undfglossitem` passam a ser definidos em `abnt-nbr14724-2024.sty`, junto dos demais elementos pós-textuais; os nomes antigos `glossario`/`\glossariotermo` (implementação paralela não usada, com visual divergente) viram sinônimos de compatibilidade da mesma implementação, sem mudança visual para os modelos.
- `abnt-nbr10520-2023.sty` convertido em registro documental sem código executável: a interface manual legada de citações duplicava o fluxo oficial BibLaTeX/Biber e conflitava com o ambiente `citacaolonga` de `undf-biblatex.sty` caso fosse carregada manualmente. `abnt-nbr6024-2012.sty` recebeu o mesmo formato, apontando onde a numeração progressiva é implementada.

### Alterado

- Versão do UnDF-TeX alinhada em 1.0.0 no arquivo `VERSION.txt`, na identificação da classe e na documentação de compatibilidade.
- Versão editorial do manual completo e de suas partes alinhada em 1.0.0, com data de 20/10/2026 e links para o repositório público nos pontos de obtenção, documentação e manutenção.
- Referências do perfil de artigo passam a abrir em nova página com título centralizado, usando a mesma apresentação institucional do TCC convencional; a formatação das entradas continua compartilhada.
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
- Entradas de seções primárias no sumário agora acompanham a grafia em caixa alta usada no texto.
- Entradas de apêndices e anexos no sumário agora acompanham a grafia em caixa alta usada no texto.
- Entradas manuais do sumário agora recebem âncoras próprias para melhorar hyperlinks no PDF.
- Figuras agora exibem identificação acima da ilustração e fonte abaixo da ilustração.
- Logo da capa ampliada no bloco institucional.
- Documentação revisada para refletir versão registrada, validações, módulos carregados, política de imagens e padrão de commits.
- Modalidades de TCC reorganizadas, com a escolha da modalidade em seção própria e pôster tratado como forma de apresentação.
- Orientações ampliadas sobre ética, autorizações, proteção de dados, autenticidade da coleta, plágio, população, amostra e gestão de dados.
- Estrutura textual esclarecida conforme a ABNT NBR 14724:2024, incluindo alternativas para resultados e discussão e para o título da parte conclusiva.
- Terminologia pública revisada para tratar as divisões do TCC como seções, preservando os comandos e diretórios internos por compatibilidade.
- Obrigatoriedade de dados catalográficos, folha de aprovação, resumo em língua estrangeira e referências explicitada para a versão final.

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
