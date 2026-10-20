# Manual 1.0.0: versão editorial e links

Revisão de 20 de outubro de 2026 em `feature/perfis-tcc`.

A versão editorial 1.0.0 foi aplicada à capa, aos metadados PDF, às referências
entre as partes, à matriz de compatibilidade e aos controles documentais.
As duas partes autônomas foram alinhadas com o volume completo. A versão
técnica de referência do template continua 0.1.0, e o histórico dos registros
anteriores de auditoria não foi reescrito. A situação de validação institucional
continua identificada nos documentos.

O repositório público foi vinculado nos pontos de apresentação, obtenção do
pacote, consulta à documentação, versionamento, relato de problemas,
referências técnicas e controle documental. O texto distingue a base pública
de monografia do desenvolvimento experimental privado.

Foram compilados com LuaLaTeX, até estabilizar:

- volume completo: 148 páginas em `build/manual-integrado/manual-completo.pdf`;
- manual acadêmico: 108 páginas em `build/manual-academico/manual-tcc-undf.pdf`;
- guia técnico: 40 páginas em `build/manual-tecnico/manual-undf.pdf`.

As saídas foram verificadas quanto à versão visível, aos metadados, à ausência
da versão editorial anterior no texto e aos destinos dos links. O volume e o
guia contêm os seis destinos esperados: repositório, README, guia de uso,
estrutura do projeto, CHANGELOG e issues. Não restaram avisos de conteúdo
ultrapassando a margem ou referências indefinidas.

Foram conferidas visualmente, no volume completo, a capa, a apresentação,
as páginas de versões, obtenção, manutenção, referências técnicas e controle
documental. A revisão não equivale a validação institucional ou auditoria
integral de acessibilidade.

As alterações editoriais permanecem no desenvolvimento privado. Não houve
integração à `main`, alteração do Manual ESETI ou atualização automática da
cópia pública da base estável.
