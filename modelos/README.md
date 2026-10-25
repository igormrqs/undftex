# Escolha e edição dos modelos

Compile sempre a entrada na raiz do repositório. Os números 1.3 e 1.4
correspondem às modalidades do Manual ESETI, mantido separadamente em
`../Manual-ESETI/`; não são versões do UnDF-TeX.

| Finalidade | Para preencher | Exemplo preenchido |
| --- | --- | --- |
| Monografia | [tcc.tex](../tcc.tex) | [tcc-exemplo-undf.tex](../tcc-exemplo-undf.tex) |
| TCC em formato de artigo | [tcc-artigo.tex](../tcc-artigo.tex) | [tcc-artigo-exemplo-undf.tex](../tcc-artigo-exemplo-undf.tex) |
| Artigo autônomo | [artigo.tex](../artigo.tex) | [artigo-exemplo-undf.tex](../artigo-exemplo-undf.tex) |
| 1.3 — Relatório de Projeto Técnico/Profissional | [relatorio-projeto.tex](../relatorio-projeto.tex) | [relatorio-projeto-exemplo-undf.tex](../relatorio-projeto-exemplo-undf.tex) |
| 1.4 — Modelo de Negócios para Empresa de Base Tecnológica | [negocio-tecnologico.tex](../negocio-tecnologico.tex) | [negocio-tecnologico-exemplo-undf.tex](../negocio-tecnologico-exemplo-undf.tex) |

## Onde editar 1.3 e 1.4

Escolha a pasta `modelos/relatorio-projeto/` ou `modelos/negocio-tecnologico/`.
Cada uma contém seus próprios arquivos:

| Arquivo | Conteúdo |
| --- | --- |
| `metadados.tex` | Autoria, título, curso, orientação e banca |
| `resumos.tex` | Resumo, palavras-chave, abstract e keywords |
| `conteudo.tex` | Roteiro de seções a substituir pelo relato final |
| `referencias.bib` | Fontes citadas no trabalho |
| `README.md` | Escopo da modalidade e comando de compilação |

Os exemplos usam conteúdo independente em `exemplo/relatorio-projeto/` e
`exemplo/negocio-tecnologico/`. Não altere essas pastas para preencher seu TCC.
Os textos demonstrativos são curtos e não estabelecem extensão mínima ou máxima.
As seções são um roteiro sugerido: adapte suas subdivisões ao objeto e ao curso.

## Apresentação institucional e complementos

Os dois relatórios reutilizam `perfil=monografia`. São modelos de conteúdo;
não existem opções `perfil=projeto` ou `perfil=startup` na classe.
O arquivo `comum/pre-textuais.tex` centraliza somente a apresentação dos
quatro documentos, incluindo capa, folha de rosto, aprovação, resumo,
abstract e sumário. As referências usam o mesmo mecanismo do TCC convencional
e começam em página própria.

A organização do miolo não altera a obrigatoriedade dos elementos acadêmicos.
Os dados catalográficos devem ser fornecidos para a versão final conforme as
orientações adotadas pelo projeto e pelo curso. Durante a elaboração, sua
ausência não gera uma ficha fictícia. Configure em `metadados.tex` um dos
comandos `\dadoscatalograficos{...}`, `\fichacatalograficapdf{caminho.pdf}` ou
`\fichacatalograficaimagem{caminho.png}`. Consulte também
`opcional/ficha-catalografica.tex`.

Para dedicatória, agradecimentos, epígrafe ou errata, crie os arquivos do seu
trabalho e carregue-os na entrada principal, depois de `resumos.tex` e antes
de `\begin{document}`. Os arquivos em `opcional/` demonstram os comandos;
copie e adapte apenas os elementos pertinentes. As listas podem ser habilitadas
no arquivo comum. Glossário, apêndices e anexos entram após as referências,
como no TCC convencional. Consulte o manual técnico em `manuais/parte-ii/`.

## Compilação

Execute na raiz, com LuaLaTeX, Biber e `pdftotext` disponíveis:

```powershell
.\scripts\verificar-perfis.ps1 -Documentos relatorio-projeto.tex,negocio-tecnologico.tex,relatorio-projeto-exemplo-undf.tex,negocio-tecnologico-exemplo-undf.tex
```

O parâmetro também aceita uma única entrada. PDFs e logs ficam em
`build/perfis/`. Com Perl e latexmk, pode compilar uma entrada diretamente:

```powershell
latexmk -outdir=build/perfis negocio-tecnologico.tex
```

No TeXstudio ou Overleaf, selecione a entrada da raiz como documento principal
e use LuaLaTeX + Biber. Não compile `conteudo.tex` isoladamente.

O protótipo anterior em `projeto-aplicado/` foi substituído pelo relatório final
1.3; sua versão de planejamento permanece recuperável pelo histórico Git.
Os modelos estão em desenvolvimento na branch `feature/perfis-tcc` e ainda
precisam de conferência das exigências de cada curso.
