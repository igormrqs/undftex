# Contribuindo com o UnDF-TeX

Obrigado pelo interesse em contribuir com o UnDF-TeX.

Este projeto combina código LaTeX, decisões institucionais e interpretação prática de normas acadêmicas. Por isso, contribuições devem priorizar clareza, estabilidade e rastreabilidade.

## Antes de alterar

Leia:

- `README.md`;
- `docs/guia-de-uso.md`;
- `docs/estrutura-do-projeto.md`;
- `docs/decisoes-institucionais.md`;
- `MANIFEST.md`.

## Princípios

- Faça mudanças pequenas e justificáveis.
- Preserve a estrutura modular existente.
- Não refatore arquivos não relacionados ao problema.
- Não altere decisões institucionais sem registrar o motivo.
- Não reproduza textos integrais de normas ABNT.
- Mantenha o idioma principal em português.

## Fluxo recomendado

1. Descreva o problema ou melhoria.
2. Faça a menor alteração que resolve o caso.
3. Compile o modelo afetado.
4. Atualize a documentação quando a interface pública mudar.
5. Registre mudança relevante em `CHANGELOG.md`.

## Verificação mínima

Compile os dois modelos com `latexmk` (a configuração está em `.latexmkrc`):

```powershell
latexmk tcc.tex
latexmk tcc-exemplo-undf.tex
```

Ambos devem terminar sem erros e sem warnings novos. O fluxo manual equivalente (lualatex, biber, lualatex, lualatex) continua válido e está documentado no `README.md`.

Para alterações nos perfis, execute a regressão completa e os testes de integridade:

```powershell
./scripts/verificar-perfis.ps1
./scripts/verificar-integridade.ps1
```

O segundo script requer LuaLaTeX e `pdftotext`; confere os nomes no PDF e testa
inclusões obrigatórias e opcionais, inclusive falhas esperadas. As fontes de teste
e suas saídas ficam em `build/integridade/`; a checagem do verificador também usa
`build/perfis/`. Nenhum desses PDFs é uma publicação oficial.

A regressão completa também compila `tests/bibliografia-listas.tex` e confere
os contratos de instituição, editora e local no PDF. Para executar esse conjunto
separadamente, com os validadores básicos dos perfis:

```powershell
./scripts/verificar-perfis.ps1 -Documentos @('tests/bibliografia-listas.tex')
```

`tests/bibliografia-listas.bib` contém os dados sintéticos e o arquivo JSON
correspondente registra contagens, ordem e ausências esperadas. O resultado por
caso fica em `build/perfis/bibliografia-listas-resultados.json`. O verificador
também pode reler um PDF já compilado com `./scripts/verificar-bibliografia.ps1`.

A mesma regressão inclui `bibliografia-datas` (20 casos),
`bibliografia-desambiguacao` (16) e `bibliografia-apud` (15). Cada trio
`.tex`/`.bib`/`.json` em `tests/` verifica sentinelas no PDF real; não basta
compilar. As chamadas são verificadas separadamente das referências, por
`refsection`. Para selecionar um conjunto:

```powershell
./scripts/verificar-perfis.ps1 -Documentos @('tests/bibliografia-apud.tex')
./scripts/verificar-bibliografia.ps1 -Documento bibliografia-apud
```

O JSON de resultados usa o nome do documento em `build/perfis/`. Datas inválidas
e ausentes nos testes são intencionais: devem produzir diagnóstico, sem usar
o ano de acesso como publicação. Os testes de homônimos incluem controles
de anos diferentes e de `et al.` para medir os efeitos de `uniquename`.

`bibliografia-eletronicos` acrescenta 39 cenários de DOI, URL, acesso, suporte
e identificadores de repositório. Os destinos dos links são extraídos do PDF
com `pdftohtml` (Poppler, como `pdftotext`), sem abrir URLs nem validar DOI
na rede. Asserções de identificadores preservam os hífens reais ao remover
somente as quebras de composição. Um cenário atravessa páginas; avisos de
linha excedendo a margem são rejeitados nessa fixture. Para executá-la:

```powershell
./scripts/verificar-perfis.ps1 -Documentos @('tests/bibliografia-eletronicos.tex')
```

Para responsabilidades bibliográficas, `bibliografia-responsabilidades` verifica
20 cenários no PDF, incluindo a precedência de `bookauthor`, funções editoriais
e controles de autoria literal, nomes acentuados e tipos herdados. Execute:

```powershell
./scripts/verificar-perfis.ps1 -Documentos @('tests/bibliografia-responsabilidades.tex')
```

Para títulos, subtítulos, volumes e herança dos dados de obras recipientes, execute
`./scripts/verificar-perfis.ps1 -Documentos @('tests/bibliografia-recipientes.tex')`.
São 18 cenários, incluindo a preservação de DOI e URL próprios do capítulo.

Para autoria institucional e entrada pelo título, execute
`./scripts/verificar-perfis.ps1 -Documentos @('tests/bibliografia-autoria.tex')`.
São 25 cenários, com distinção entre campos institucionais, rótulos e apud.
A expectativa de U08 foi ajustada para a abreviação da NBR 10520:2023,
6.1.1.4; seus dados bibliográficos e os demais contratos foram preservados.

Para a matriz de ordenação (14 cenários), execute
`./scripts/verificar-perfis.ps1 -Documentos @('tests/bibliografia-ordenacao.tex')`.
A ordem dos elementos é conferida no PDF, inclusive com citação invertida
e ajustes explícitos de ordenação.

Para integridade bibliográfica (26 cenários), execute
`./scripts/verificar-perfis.ps1 -Documentos @('tests/bibliografia-integridade.tex')`.
Os testes conferem conteúdo, pontuação, avisos esperados e indevidos,
referência completa pontual e a preservação de datas e links.

Para identidade de partes sem autor (AF03-01), execute
`./scripts/verificar-perfis.ps1 -Documentos @('tests/bibliografia-partes.tex')`.
São 21 cenários com chamadas, referências, ordenação, desambiguação,
`bookauthor`, funções editoriais, `crossref`, `xdata`, aliases e quatro apud.
A autoria herdada nativamente de um livro conhecido é um controle positivo;
o editor do recipiente não pode substituir a autoria desconhecida da parte.

Para títulos e subtítulos de periódicos (AF03-02), execute
`./scripts/verificar-perfis.ps1 -Documentos @('tests/bibliografia-periodicos.tex')`.
São 15 cenários com identificação do artigo e da revista, acentos, pontuação,
`shortjournal`, campos ausentes, `crossref`, `xdata`, DOI, URL e acesso.
O controle de `periodical` protege o comportamento herdado sem afirmar sua
conformidade integral com a ABNT.

Para notas materiais (AF03-08), execute
`./scripts/verificar-perfis.ps1 -Documentos @('tests/bibliografia-notas.tex')`.
São 36 cenários: 26 sintéticos e dez ocorrências reais de `manualundf` e
`relatoriofinal`, carregadas diretamente das bases de modelos e exemplos.
Verificam estado/escopo, campos distintos, repetição literal, ausência de notas,
URL/DOI/acesso, diagnósticos, ordenação, `fullref` e nota que atravessa página.
Os drivers próprios apresentam os complementos fornecidos antes do bloco
eletrônico; os herdados conservam as chamadas nativas. A escolha de dados
bibliográficos públicos pertence a quem mantém a base: não são inferidos
estado de aprovação, datas ou relevância por palavras-chave.

F03-G / AF03-03: títulos com grupos ou comandos são preservados na impressão.
Inglês simples declarado em langid=english usa artigo e palavra seguinte;
outros idiomas declarados conservam título completo. shorttitle explícito
prevalece. Teste: scripts/verificar-perfis.ps1 -Documentos @('tests/bibliografia-titulos.tex').
O trio tests/bibliografia-titulos.tex/.bib/.json contém 23 controles permanentes.

## Imagens e arquivos grandes

Antes de adicionar imagens ao repositório:

- confira peso, largura e altura do arquivo;
- evite versionar imagens acima de `5 MB`, salvo justificativa clara;
- prefira cópias otimizadas para uso no PDF, preservando originais fora do projeto;
- não substitua imagens técnicas por versões comprimidas sem verificar legibilidade;
- compile o exemplo quando alterar imagens usadas por `tcc-exemplo-undf.tex`.
## Commits

Use mensagens objetivas, preferencialmente em inglês para manter o histórico uniforme. Exemplos:

- `docs: add usage guide`
- `fix: adjust approval page spacing`
- `feat: add symbols list command`
- `chore: update license files`

## Mudanças normativas

Quando a mudança envolver ABNT ou padrão institucional, registre:

- qual elemento foi alterado;
- qual norma ou decisão motivou a mudança;
- qual impacto visual ou de uso foi esperado;
- quais arquivos foram verificados após a alteração.

## Licença das contribuições

Ao contribuir, você concorda que sua contribuição seja distribuída sob a mesma licença do projeto: LPPL 1.3c ou posterior.
