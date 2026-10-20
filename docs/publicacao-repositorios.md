# Publicação da base estável e desenvolvimento privado

Organização definida em 20 de outubro de 2026:

| Finalidade | Endereço | Visibilidade |
| --- | --- | --- |
| Base estável de monografia | https://github.com/igormrqs/undftex-publico | Pública |
| Desenvolvimento e perfis experimentais | https://github.com/igormrqs/undftex | Privada |

O GitHub define a visibilidade por repositório, não por branch. Por isso,
`feature/perfis-tcc` permanece no repositório privado, com as proteções contra
exclusão e force push preservadas. Não foi feita integração à `main` privada.

A publicação pública partiu exclusivamente do conteúdo da `main` privada no
commit `b7b596122aa2e3e76659f43d29756f07b12b17ab`. Ela foi preparada como
cópia independente, com uma única raiz de histórico e nota de procedência
no README. O primeiro commit público é
`923440c5e567594f62fc8a90283ca8dc46b07fbf`. Licença e arquivos de distribuição
foram preservados. Não foram enviados commits, arquivos ou branches da
implementação experimental.

Os diretórios locais são `undftex/` (desenvolvimento privado) e
`../undftex-publico/` (publicação da base estável). Cada um tem seu próprio
remoto `origin`. A cópia pública não recebe sincronização automática e não
deve receber `git push --mirror` do repositório privado. Uma futura atualização
pública deverá selecionar somente o conteúdo cuja publicação tiver sido definida.

A publicação não declara aprovação institucional dos manuais ou do template.
A versão e as pendências de validação continuam identificadas nos documentos.

Foram conferidos a origem da árvore, os padrões usuais de credenciais nos
arquivos da base e os nomes de artefatos restritos. A API confirmou a cópia
pública com apenas `main` e o original privado com a proteção de
`feature/perfis-tcc` preservada.

Referência: [visibilidade dos repositórios no GitHub](https://docs.github.com/en/repositories/creating-and-managing-repositories/about-repositories#about-repository-visibility).
