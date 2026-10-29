# Escolha e edição dos modelos

Compile sempre a entrada na raiz. Os números 1.1, 1.3 e 1.4 são modalidades
do Manual ESETI, mantido separadamente em `../Manual-ESETI/`; não são versões.

| Finalidade | Para preencher | Exemplo preenchido |
| --- | --- | --- |
| Monografia | [tcc.tex](../tcc.tex) | [tcc-exemplo-undf.tex](../tcc-exemplo-undf.tex) |
| TCC em formato de artigo | [tcc-artigo.tex](../tcc-artigo.tex) | [tcc-artigo-exemplo-undf.tex](../tcc-artigo-exemplo-undf.tex) |
| Artigo autônomo | [artigo.tex](../artigo.tex) | [artigo-exemplo-undf.tex](../artigo-exemplo-undf.tex) |
| 1.1 — Relatório final do portfólio | [portfolio.tex](../portfolio.tex) | [portfolio-exemplo-undf.tex](../portfolio-exemplo-undf.tex) |
| Registro auxiliar — relatório parcial de cada projeto | [relatorio-projeto-aplicado.tex](../relatorio-projeto-aplicado.tex) | [relatorio-projeto-aplicado-exemplo-undf.tex](../relatorio-projeto-aplicado-exemplo-undf.tex) |
| 1.3 — Relatório de Projeto Técnico/Profissional | [relatorio-projeto.tex](../relatorio-projeto.tex) | [relatorio-projeto-exemplo-undf.tex](../relatorio-projeto-exemplo-undf.tex) |
| 1.4 — Modelo de Negócios para Empresa de Base Tecnológica | [negocio-tecnologico.tex](../negocio-tecnologico.tex) | [negocio-tecnologico-exemplo-undf.tex](../negocio-tecnologico-exemplo-undf.tex) |

## Onde editar

Para o TCC final, escolha `modelos/portfolio/`, `modelos/relatorio-projeto/`
ou `modelos/negocio-tecnologico/`. Cada pasta contém:

| Arquivo | Conteúdo |
| --- | --- |
| `metadados.tex` | Autoria, título, curso, orientação e banca |
| `resumos.tex` | Resumo, palavras-chave, abstract e keywords |
| `conteudo.tex` | Roteiro de capítulos a substituir pelo relato final |
| `referencias.bib` | Fontes citadas no trabalho |
| `README.md` | Escopo e comando de compilação |

Para registrar cada projeto, use `modelos/projeto-aplicado/`: edite os
metadados de identificação, o conteúdo e a bibliografia. Não há resumos ou
banca nesse registro. A abertura comum fica em `projeto-aplicado/abertura.tex`.
Os exemplos usam pastas independentes em `exemplo/`; não as edite para seu TCC.
Os textos são curtos e não estabelecem extensão mínima ou máxima.

## Do registro parcial ao portfólio final

1. Registre contexto, atividades, decisões, entregas, limites, evidências e dúvidas de cada projeto.
2. Declare o percurso abrangido e inventarie todos os projetos que o compõem.
3. Sintetize cada projeto e distinga a contribuição individual da equipe.
4. Relacione experiências e resultados na análise integradora e conclua sobre o conjunto.

O registro parcial ajuda a memória durante ou depois do projeto. Não exige
periodicidade, nota, parecer ou cronograma. O portfólio não é uma sequência
de relatórios colados. A admissibilidade e o recorte devem ser confirmados
com o curso. Artigo científico não é exigido. Veja o [guia dos relatórios](../docs/relatorios-de-projetos.md).

## Apresentação institucional e complementos

Os modelos reutilizam `perfil=monografia`, sem criar opções da classe.
`comum/pre-textuais.tex` centraliza a apresentação dos seis documentos finais
(portfólio, projeto profissional e negócio tecnológico, cada um com exemplo),
incluindo capa, folha de rosto, aprovação, resumos e sumário. As referências
usam o mecanismo do TCC convencional e começam em página própria.
O relatório parcial tem abertura enxuta e fontes consultadas ao final.

A organização do miolo não altera a obrigatoriedade dos elementos do TCC.
Os dados catalográficos devem ser fornecidos para a versão final conforme
as orientações do projeto e do curso; a ausência durante a elaboração não
gera ficha fictícia. Configure em `metadados.tex` um dos comandos
`\dadoscatalograficos{...}`, `\fichacatalograficapdf{caminho.pdf}` ou
`\fichacatalograficaimagem{caminho.png}`. Veja `opcional/ficha-catalografica.tex`.

Para dedicatória, agradecimentos, epígrafe ou errata, crie os arquivos do
trabalho e carregue-os na entrada principal, depois de `resumos.tex` e antes
de `\begin{document}`. Os arquivos em `opcional/` demonstram os comandos.
Listas podem ser habilitadas no arquivo comum. Glossário, apêndices e anexos
entram após as referências, como no TCC convencional. Consulte o manual técnico.

## Compilação

Na raiz, com LuaLaTeX, Biber e `pdftotext`:

```powershell
.\scripts\verificar-perfis.ps1 -Documentos relatorio-projeto-aplicado.tex,relatorio-projeto-aplicado-exemplo-undf.tex,portfolio.tex,portfolio-exemplo-undf.tex
```

PDFs e logs ficam em `build/perfis/`. Com Perl e latexmk:

```powershell
latexmk -outdir=build/perfis portfolio.tex
```

No TeXstudio ou Overleaf, selecione a entrada da raiz e use LuaLaTeX + Biber.
Não compile `conteudo.tex` isoladamente. Os nomes das entradas de Projeto
Aplicado foram preservados; agora produzem os registros parciais. A montagem
anterior permanece no histórico Git. O protótipo antigo de planejamento
`projeto-aplicado/` também permanece no histórico; foi substituído pelo 1.3.
Os modelos seguem em desenvolvimento na branch `feature/perfis-tcc`.
