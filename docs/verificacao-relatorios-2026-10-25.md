# Verificação dos relatórios finais — 25 de outubro de 2026

As modalidades 1.3 e 1.4 correspondem às seções do Manual ESETI, mantido em
projeto local independente. A numeração não identifica versões do pacote.
O relatório 1.3 substitui o protótipo anterior de planejamento; o 1.4 foi
criado nesta alteração. Ambos são modelos de conteúdo no perfil de monografia,
sem mudança na classe ou nos modelos existentes de monografia e artigo.

## Organização conferida

- Entradas de compilação na raiz, preservando `relatorio-projeto.tex`.
- Modelos preenchíveis em `modelos/relatorio-projeto/` e `modelos/negocio-tecnologico/`.
- Exemplos independentes em `exemplo/relatorio-projeto/` e `exemplo/negocio-tecnologico/`.
- Metadados, resumos, miolo e bibliografia próprios de cada documento.
- Somente a apresentação institucional compartilhada em `modelos/comum/pre-textuais.tex`.
- Índice de escolha e instruções em `modelos/README.md`.
- Conteúdo de planejamento anterior recuperável no histórico Git, sem manter uma segunda pasta ativa obsoleta.

## Compilação e estrutura

Verificação local com MiKTeX, LuaLaTeX, Biber e `pdftotext` no Windows:

```powershell
.\scripts\verificar-perfis.ps1
```

Foram compilados os dez documentos de uso e os sete documentos de regressão
listados no parâmetro padrão do script. Também passaram os dois testes de
contadores e o teste de validação dos campos do artigo, totalizando vinte
entradas LaTeX. Os verificadores de artigo, de relatórios e de complementos
concluíram sem erro. A última atualização bibliográfica dos quatro relatórios
foi recompilada e conferida com o parâmetro `-Documentos`.

| Entrada | Páginas físicas | Seções primárias numeradas |
| --- | ---: | ---: |
| `relatorio-projeto.tex` | 14 | 7 |
| `relatorio-projeto-exemplo-undf.tex` | 14 | 7 |
| `negocio-tecnologico.tex` | 15 | 8 |
| `negocio-tecnologico-exemplo-undf.tex` | 15 | 8 |

Os quatro documentos contêm capa, folha de rosto, aprovação demonstrativa,
um resumo em português, um abstract, sumário e referências em página própria.
As citações foram resolvidas, sem avisos de conteúdo ultrapassando a margem
(`Overfull`) ou de tamanho dos resumos fora da faixa orientadora. Os dados
catalográficos permanecem sem preenchimento nas demonstrações, com instruções
para sua inclusão na entrega final. Não foi alterada sua obrigatoriedade.

Todas as páginas foram renderizadas e conferidas visualmente. A inspeção
incluiu as tabelas de componentes e de cenários financeiros do exemplo 1.4,
os resumos, a folha de aprovação e as referências. Saídas, logs e imagens de
conferência ficam em `build/perfis/`, sem versionamento de artefatos gerados.
O Manual ESETI foi recompilado em seis páginas após atualizar os apontamentos
para os modelos; sua fonte continua independente do repositório.

## Escopo dos resultados

O exemplo 1.3 relata a produção documental local, sem alegar implantação
profissional ou eficácia acadêmica. O exemplo 1.4 contém análise documental
e simulação didática, sem coleta com clientes, vendas ou dados do mercado
brasileiro. Seu equilíbrio aritmético não é apresentado como viabilidade
comercial comprovada. Autoria e banca são demonstrativas.

A bibliografia aponta a minuta do Manual ESETI efetivamente usada como roteiro,
sem atribuir a ela a versão editorial do manual completo. As páginas do LaTeX
Project e da Strategyzer são fontes primárias do exemplo, consultadas em
25 de outubro de 2026. O quadro de componentes é uma síntese textual própria.

O workflow foi ampliado com as quatro entradas e o verificador de relatórios.
Este registro documenta a execução local; não atesta a conclusão remota do
GitHub Actions. O desenvolvimento permanece em `feature/perfis-tcc`, sem
integração à `main` ou sincronização com a base pública.
