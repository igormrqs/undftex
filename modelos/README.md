# Escolha e edição dos modelos

Compile sempre a entrada na raiz do repositório. Os números 1.1, 1.3 e 1.4
correspondem às modalidades do Manual ESETI, mantido separadamente em
`../Manual-ESETI/`; não são versões do UnDF-TeX.

| Finalidade | Para preencher | Exemplo preenchido |
| --- | --- | --- |
| Monografia | [tcc.tex](../tcc.tex) | [tcc-exemplo-undf.tex](../tcc-exemplo-undf.tex) |
| TCC em formato de artigo | [tcc-artigo.tex](../tcc-artigo.tex) | [tcc-artigo-exemplo-undf.tex](../tcc-artigo-exemplo-undf.tex) |
| Artigo autônomo | [artigo.tex](../artigo.tex) | [artigo-exemplo-undf.tex](../artigo-exemplo-undf.tex) |
| Projeto Aplicado — relatório que pode compor o portfólio 1.1 | [relatorio-projeto-aplicado.tex](../relatorio-projeto-aplicado.tex) | [relatorio-projeto-aplicado-exemplo-undf.tex](../relatorio-projeto-aplicado-exemplo-undf.tex) |
| 1.3 — Relatório de Projeto Técnico/Profissional | [relatorio-projeto.tex](../relatorio-projeto.tex) | [relatorio-projeto-exemplo-undf.tex](../relatorio-projeto-exemplo-undf.tex) |
| 1.4 — Modelo de Negócios para Empresa de Base Tecnológica | [negocio-tecnologico.tex](../negocio-tecnologico.tex) | [negocio-tecnologico-exemplo-undf.tex](../negocio-tecnologico-exemplo-undf.tex) |

## Onde editar os relatórios finais

Escolha `modelos/projeto-aplicado/`, `modelos/relatorio-projeto/` ou
`modelos/negocio-tecnologico/`.
Cada uma contém seus próprios arquivos:

| Arquivo | Conteúdo |
| --- | --- |
| `metadados.tex` | Autoria, título, curso, orientação e banca |
| `resumos.tex` | Resumo, palavras-chave, abstract e keywords |
| `conteudo.tex` | Roteiro de seções a substituir pelo relato final |
| `referencias.bib` | Fontes citadas no trabalho |
| `README.md` | Escopo da modalidade e comando de compilação |

Os exemplos usam conteúdo independente nas pastas correspondentes em `exemplo/`. Não altere essas pastas para preencher seu TCC.
Os textos demonstrativos são curtos e não estabelecem extensão mínima ou máxima.
As seções são um roteiro sugerido: adapte suas subdivisões ao objeto e ao curso.

## Apresentação institucional e complementos

Os três roteiros de relatório reutilizam `perfil=monografia`. São modelos de conteúdo;
não existem opções `perfil=projeto` ou `perfil=startup` na classe.
O arquivo `comum/pre-textuais.tex` centraliza somente a apresentação dos
seis documentos, incluindo capa, folha de rosto, aprovação, resumo,
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

## Projeto Aplicado, projeto externo e portfólio

O Projeto Aplicado identifica unidade curricular, semestre, período, equipe e
contribuição individual. O roteiro 1.3 trata do ambiente profissional externo,
com organização, vínculo do estudante e evidências da atuação. Os dois relatam
trabalho concluído; o [guia dos relatórios](../docs/relatorios-de-projetos.md)
explica o uso da referência de agosto e as diferenças de escopo.

O relatório de um Projeto Aplicado pode alimentar o portfólio 1.1, cuja
consolidação ainda precisa de critérios e texto integrador próprios. A entrada
nova não é um modelo de portfólio completo. Artigo científico não é exigido
nem acrescentado aos relatórios de projeto. As páginas da entrega semestral
devem ser confirmadas com o curso; os elementos do TCC permanecem os já adotados.

## Compilação

Execute na raiz, com LuaLaTeX, Biber e `pdftotext` disponíveis:

```powershell
.\scripts\verificar-perfis.ps1 -Documentos relatorio-projeto-aplicado.tex,relatorio-projeto-aplicado-exemplo-undf.tex
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
