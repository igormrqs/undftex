# Guia de uso do UnDF-TeX

Este guia apresenta o fluxo recomendado para usar o template a partir do arquivo `tcc.tex`.

## 1. Escolha o arquivo de entrada

Use:

- `tcc.tex` para começar um trabalho real;
- `tcc-exemplo-undf.tex` para consultar um exemplo completo;
- a pasta `exemplo/` para ver usos demonstrativos de figuras, tabelas, citações, apêndices, anexos e elementos opcionais.

## 2. Preencha os metadados

Os metadados principais ficam no preâmbulo do arquivo `tcc.tex`.

```tex
\autor{Nome do Aluno}
\titulo{Título do Trabalho}
\subtitulo{Subtítulo opcional}
\curso{Nome do curso}
\tipotrabalho{Trabalho de Conclusão de Curso}
\graupretendido{bacharel em Nome do curso}
\local{Brasília}
\ano{2026}
\orientador{Nome do Orientador}
\coorientador{}
\areadeconcentracao{Área de concentração}
\dataaprovacao{Brasília, DF, dia de mês de ano}
```

Para mais de um autor, use `//` como separador:

```tex
\autores{Aluno 1//Aluno 2}
```

## 3. Informe a banca examinadora

Use o primeiro campo para o nome e o segundo para o prefixo acadêmico que deve aparecer antes dele na folha de aprovação.

```tex
\limparmembrosbanca
\membrobanca{Nome do Orientador}{Prof. Dr.}{Universidade do Distrito Federal Professor Jorge Amaury Maia Nunes -- UnDF}
\membrobanca{Nome do Membro 1}{Profa. Dra.}{Universidade do Distrito Federal Professor Jorge Amaury Maia Nunes -- UnDF}
\membrobanca{Nome do Membro 2}{Prof. Dr.}{Universidade do Distrito Federal Professor Jorge Amaury Maia Nunes -- UnDF}
```

Na folha de aprovação, o resultado fica no formato `Prof. Dr. Nome`, sem linha separada para a titulação.

## 4. Edite os elementos obrigatórios

Os elementos obrigatórios do modelo em branco ficam em `obrigatorio/`.

- `obrigatorio/resumo.tex`
- `obrigatorio/abstract.tex`
- `obrigatorio/referencias.bib`

No resumo, preencha:

```tex
\undfsetcontent{resumo}{Texto do resumo.}
\undfsetcontent{palavraschave}{termo 1; termo 2; termo 3}
```

No resumo em língua estrangeira, preencha:

```tex
\undfsetcontent{abstracttitle}{ABSTRACT}
\undfsetcontent{abstract}{Foreign-language abstract text.}
\undfsetcontent{keywords}{term 1; term 2; term 3}
```

Se o idioma não for inglês, ajuste também o rótulo das palavras-chave:

```tex
\undfsetcontent{abstracttitle}{RESUMEN}
\undfsetcontent{keywordslabel}{Palabras clave}
```

## 5. Use elementos opcionais apenas quando necessário

Os arquivos opcionais ficam em `opcional/`.

- `dedicatoria.tex`
- `agradecimentos.tex`
- `epigrafe.tex`
- `ficha-catalografica.tex`
- `errata.tex`
- `glossario.tex`
- `apendices.tex`
- `anexos.tex`

Arquivos opcionais vazios ou inexistentes não são exibidos.

## 6. Escreva os capítulos

Os capítulos do modelo em branco ficam em `capitulos/`:

- `01-introducao.tex`
- `02-referencial-teorico.tex`
- `03-metodologia.tex`
- `04-analise-e-discussao.tex`
- `05-consideracoes-finais.tex`

Para criar uma seção com rótulo:

```tex
\undfsecao{Título da seção}{rotulo-da-secao}
```

Referencie depois com:

```tex
\secaoref{rotulo-da-secao}
```

## 7. Citações e referências

Cadastre as referências em `obrigatorio/referencias.bib` e use as chaves BibTeX no texto.

Citação indireta:

```tex
\citeind{chave}
\citeind[p. 25]{chave}
```

Citação indireta com autor no texto:

```tex
\citeindonline{chave}
\citeindonline[p. 25]{chave}
```

Citação direta curta:

```tex
\citedir[p. 25]{chave}{Texto citado.}
```

Citação direta longa:

```tex
\begin{citacaolonga}[p. 25]{chave}
Texto citado com mais de três linhas.
\end{citacaolonga}
```

Citação de citação:

```tex
\apudbib[p. 13][p. 25]{obra-original}{obra-consultada}
```

## 8. Figuras, tabelas e equações

Figura:

```tex
\undffigura[0.75\textwidth]{figuras/exemplo.jpg}{Legenda da figura}{rotulo}
```

Figura com fonte:

```tex
\undffigura[0.75\textwidth]{figuras/exemplo.jpg}{Legenda da figura}{rotulo}[Autor, ano]
```

Figuras lado a lado:

```tex
\undffigurasladoalado
  {figuras/antes.jpg}{Antes}
  {figuras/depois.jpg}{Depois}
  {Comparação entre dois registros}
  {comparacao}
  [elaboração própria]
```

Referência à figura:

```tex
\figuraref{rotulo}
```

Tabela:

```tex
\begin{undftabela}{Legenda da tabela}{rotulo}
\begin{tabular}{ll}
Item & Valor \\
\end{tabular}
\end{undftabela}
```

Equação:

```tex
\equacao[rotulo]{E = mc^2}
```

Referência à equação:

```tex
\equacaoref{rotulo}
```

Pseudocódigo:

```tex
\clearpage
\begin{undfpseudocodigo}{Cálculo da média}{media}
Entrada: lista de valores V
Saída: média dos valores

Inicio
  soma <- 0
  Para cada valor v em V Faca
    soma <- soma + v
  Fim
  Retorne soma / tamanho(V)
Fim
\end{undfpseudocodigo}
```

Quando um pseudocódigo curto ou médio começar perto do fim da página, use
`\clearpage` antes do bloco ou antes da seção que o apresenta. Essa é a forma
mais previsível de manter o algoritmo inteiro e preservar a ordem visual do
texto. Para pseudocódigos longos, prefira dividir o procedimento em partes
menores.

## 9. Avisos de validação

O comando abaixo é chamado no início do documento:

```tex
\undfvalidateonepagecontents
```

Por padrão, o template bloqueia a compilação quando resumo ou abstract parecem ultrapassar o limite prático de uma página. Os demais elementos de uma página emitem avisos quando parecem longos demais ou próximos de ultrapassar uma página.

Para transformar o bloqueio de resumo/abstract em aviso, use antes da validação:

```tex
\avisarresumoslongos
```

O template também emite aviso quando palavras-chave ou keywords ficam fora da faixa recomendada de 3 a 6 termos.

## 10. Compilação recomendada

```powershell
lualatex -interaction=nonstopmode -halt-on-error tcc.tex
biber tcc
lualatex -interaction=nonstopmode -halt-on-error tcc.tex
lualatex -interaction=nonstopmode -halt-on-error tcc.tex
```

Quando houver mudança em sumário, listas, citações ou referências, compile novamente até que os avisos de referências pendentes desapareçam.
