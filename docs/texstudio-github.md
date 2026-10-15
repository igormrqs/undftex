# TeXstudio e GitHub no UnDF-TeX

Verificação em 14 de outubro de 2026. A instalação local identificada é
**TeXstudio 4.9.8**, build `202609111517-git_00f7c1c3d`.

## Integração disponível

A [documentação oficial do TeXstudio, GIT/SVN Support](https://texstudio-org.github.io/advanced.html#git-svn-support)
descreve um painel Git lateral para selecionar arquivos, escrever a mensagem e
fazer commit. O painel também permite fetch, pull, push, consulta de histórico e
troca de branches quando não há arquivos modificados. Assim, é possível trabalhar
com um repositório do GitHub a partir do editor, usando o Git instalado.

O clone inicial é feito por uma ferramenta Git externa. Neste projeto ele já
existe, em `undftex/`, com `origin` apontando para
`https://github.com/igormrqs/undftex.git`. O painel opera essa cópia local.

## Configuração e rotina

1. Abra `artigo.tex` (autônomo) ou `tcc-artigo.tex` (entrega institucional) dentro da pasta `undftex/` no TeXstudio.
2. Em Opções → Configurar TeXstudio, habilite a visualização das opções avançadas,
   procure SVN/GIT e selecione Git. Configure o executável Git se necessário.
3. Abra o painel Git na barra lateral e confira a branch `feature/perfis-tcc`.
4. Salve, compile e revise o diff. Selecione os arquivos pretendidos, escreva uma
   mensagem e faça commit; use push para publicar os commits da branch.
5. Antes de incorporar trabalho remoto, consulte o status e faça fetch; faça pull
   quando a árvore estiver limpa e a atualização tiver sido conferida.

Os nomes dos menus podem variar com o idioma. A opção de commit automático ao
salvar é documentada em [Configuring SVN/GIT support](https://texstudio-org.github.io/configuration.html#configuring-svn-git-support).
Para este projeto, prefira commits deliberados após a compilação e revisão.

A autenticação do push é feita pelo Git. A configuração HTTPS existente pode
usar o gerenciador de credenciais local. SSH é uma alternativa, conforme
[a documentação do GitHub](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/about-ssh),
mas não é necessário trocar o remoto para usar o painel.

Esta sessão verificou versão e documentação; não alterou preferências do editor
nem realizou um push pelo painel gráfico.

## Compilação

O modelo novo contém os comentários de editor `TeX program = lualatex` e
`BIB program = biber`. Configure a cadeia de construção para LuaLaTeX → Biber →
LuaLaTeX → LuaLaTeX, ou utilize o script na raiz do repositório:

```powershell
.\scripts\verificar-perfis.ps1 -Documentos tcc-artigo.tex
```

Os PDFs ficam em `build/perfis/`. O script funciona com a instalação local de
MiKTeX mesmo sem Perl. O `latexmk` instalado não executou nesta verificação por
ausência de Perl; a instalação dessa dependência pode ser feita posteriormente.

O `.gitignore` já exclui `build/` e os auxiliares de compilação. Antes de cada
commit, confira que somente os fontes e documentos pretendidos estão selecionados.
