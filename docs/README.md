# Documentação do UnDF-TeX

## Para usar

- [Escolha do modelo e arquivos para edição](../modelos/README.md).
- [Guia de uso](guia-de-uso.md).
- [Manuais acadêmico, técnico e integrado](../manuais/README.md).
- [Integração TeXstudio–GitHub](texstudio-github.md).
- [Adaptação para Google Docs](../docx-google-docs/GUIA_USO_GOOGLE_DOCS.md).

## Para manter

- [Estrutura e responsabilidades dos módulos](estrutura-do-projeto.md).
- [Decisões institucionais do projeto](decisoes-institucionais.md).
- [Perfis de TCC e limites do artigo](perfis-tcc.md).
- [Base pública e desenvolvimento privado](publicacao-repositorios.md).
- [Contribuição](../CONTRIBUTING.md), [histórico](../CHANGELOG.md) e [manifesto](../MANIFEST.md).

Execute `scripts/verificar-organizacao.ps1` para conferir destinos dos links
locais em Markdown e a ausência de auxiliares versionados. O script usa os
arquivos do índice Git, não acessa links externos nem valida âncoras internas.
A compilação dos modelos continua em `scripts/verificar-perfis.ps1`.

## Registros de verificações

Estes documentos registram o estado e os resultados na data indicada; não
substituem os guias atuais nem uma nova execução dos testes:

- [Estrutura, complementos e referências](verificacao-estrutural.md).
- [Manual 1.0.0](verificacao-manual-1.0.0.md).
- [Projeto/artigo — 20 de outubro de 2026](verificacao-projeto-artigo-2026-10-20.md).
- [Relatórios finais — 25 de outubro de 2026](verificacao-relatorios-2026-10-25.md).

A revisão organizacional de 28 de outubro está registrada no workspace em
`planejamento/undftex/revisao-organizacao-2026-10-28.md`, relativo à raiz
do workspace; esse registro não integra a distribuição do pacote.
