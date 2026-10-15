# Guia de uso do UnDF-TeX

Este guia apresenta o fluxo recomendado para usar o template a partir do arquivo `tcc.tex`.

## 1. Escolha o arquivo de entrada

Use:

- `tcc.tex` para começar um trabalho real;
- `tcc-exemplo-undf.tex` para consultar um exemplo completo;
- a pasta `exemplo/` para ver usos demonstrativos de nota de rodapé, citações, figuras, fluxogramas, tabelas, pseudocódigo, apêndices, anexos e elementos opcionais.

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

Exemplo de errata:

```tex
\errataref{SOBRENOME, Nome. Título do trabalho. 2026. Trabalho de Conclusão de Curso
(Graduação em Curso) -- Universidade do Distrito Federal Professor Jorge Amaury
Maia Nunes -- UnDF, Brasília, 2026.}

\erratatexto{%
  \erratatabela{%
    \erratalinha{16}{10}{auto-clavado}{autoclavado}
  }
}
```

## 6. Escreva as seções textuais

Os arquivos das seções primárias do modelo em branco ficam em `capitulos/`:

- `01-introducao.tex`
- `02-referencial-teorico.tex`
- `03-metodologia.tex`
- `04-dados.tex` (opcional; use quando os dados ou o corpus exigirem caracterização extensa)
- `04-analise-e-discussao.tex`
- `05-consideracoes-finais.tex`

Para ativar a seção opcional de dados, retire o comentário da linha correspondente em `tcc.tex`. Se a caracterização for breve, mantenha-a na metodologia e não inclua esse arquivo.

O `tcc-exemplo-undf.tex` inclui essa seção para demonstrar seu posicionamento entre metodologia e análise, sem torná-la obrigatória no modelo em branco.

Para criar uma seção com rótulo:

```tex
\undfsecao{Título da seção}{rotulo-da-secao}
```

Referencie depois com:

```tex
\secaoref{rotulo-da-secao}
```

## 7. Citações, referências e notas

Cadastre as referências em `obrigatorio/referencias.bib` e use as chaves BibTeX no texto. O projeto usa BibLaTeX com Biber, com `\addbibresource{...}` no arquivo principal e `\printundfreferences` ao final da parte textual.

Citação indireta:

```tex
\citarparenteses{chave}
\citarparenteses[p. 25]{chave}
```

Citação indireta com autor no texto:

```tex
\citartexto{chave}
\citartexto[p. 25]{chave}
```

Citação direta curta:

```tex
\citardireta[p. 25]{chave}{Texto citado.}
\citardiretatexto[p. 25]{chave}{Texto citado.}
```

Citação direta longa:

```tex
\begin{citacaolonga}[p. 25]{chave}
Texto citado com mais de três linhas.
\end{citacaolonga}
```

Citação de citação:

```tex
\parenciteapud{Freire}{1994}[13]{obra-consultada}[25]
\textapud{Freire}{1994}[13]{obra-consultada}[25]
```

Nessas formas, informe autoria e ano da original como texto e use uma chave apenas
para a fonte consultada. Os comandos anteriores `\apudbib` e `\apudbibonline`, com
duas chaves e localizadores como `p. 13`, continuam compatíveis. Ao gerar a lista
com `\printundfreferences`, a original usada somente nesses comandos não entra
nas referências; ela aparece se houver uma citação independente na mesma seção
bibliográfica. A filtragem pertence ao comando institucional, não a uma chamada
direta a `\printbibliography`.

Nota de rodapé:

```tex
\notarodape{Texto explicativo da nota.}
```

Use notas de rodapé com parcimônia, apenas quando a explicação complementar não couber bem no corpo do texto.

## 8. Figuras, fluxogramas, tabelas, equações e pseudocódigo

Figura:

```tex
\undffigura[0.75\textwidth]{figuras/exemplo.jpg}{Legenda da figura}{rotulo}
```

Figura com fonte:

```tex
\undffigura[0.75\textwidth]{figuras/exemplo.jpg}{Legenda da figura}{rotulo}[Autor, ano]
```

No PDF, a identificação da figura aparece acima da ilustração e a fonte aparece logo abaixo dela.

Figuras lado a lado:

```tex
\undffigurasladoalado
  {figuras/antes.jpg}{Registro anterior}{registro-anterior}[elaboração própria]
  {figuras/depois.jpg}{Registro posterior}{registro-posterior}[elaboração própria]
```

Esse comando gera duas figuras independentes, cada uma com numeração, legenda, rótulo e fonte próprios, apenas posicionadas lado a lado.

Qualidade e peso das imagens:

- prefira imagens de até `2 MB` quando possível;
- imagens acima de `5 MB` geram aviso na compilação quando usadas por `\undffigura` ou `\undffigurasladoalado`;
- imagens acima de `10 MB` geram aviso mais forte, recomendando otimização para um tamanho abaixo de `5 MB` antes da entrega final;
- imagens inseridas diretamente por `\includegraphics` não são validadas automaticamente;
- evite imagens com lado maior acima de `4000 px` quando serão exibidas pequenas no PDF;
- evite ampliar imagens com lado maior abaixo de `1000 px`, pois podem ficar borradas;
- preserve o arquivo original fora do projeto e use em `figuras/` uma cópia adequada ao PDF.

Para desligar temporariamente esses avisos, use `\undfdesabilitaravisosimagem`; para reativar, use `\undfhabilitaravisosimagem`.

Referência à figura:

```tex
\figuraref{registro-anterior}
```

Fluxograma:

```tex
\begin{undffluxograma}{Planejamento do TCC}{planejamento-tcc}
\centering
\begin{tikzpicture}
  % nós e setas do fluxograma
\end{tikzpicture}
\end{undffluxograma}
```

No corpo do texto, cite com:

```tex
\fluxogramaref{planejamento-tcc}
```

Com até três fluxogramas no trabalho, o ambiente entra na lista de ilustrações e usa numeração de figura. Com mais de três, o template passa a tratá-los como objeto próprio, usa numeração `Fluxograma n` e a chamada `\listadefluxogramas` passa a exibir a lista própria. Como essa decisão depende da contagem registrada no `.aux`, recompile quando a quantidade de fluxogramas mudar. Use balões de início e fim quando estiver representando um processo completo.

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
\begin{undfpseudocodigo}{MEDIA(V)}{media}{Calcular média dos valores de uma lista}
Entrada: lista de valores V
Saída: média dos valores

Inicio
  soma <- 0
  Para cada valor v em V Faca
    soma <- soma + v
  Fim-para
  Retorne soma / tamanho(V)
Fim
\end{undfpseudocodigo}
```

O rótulo numerado e o título descritivo aparecem acima do bloco, no formato `Pseudocódigo n --- Título`. A assinatura aparece dentro da caixa, alinhada à esquerda, no padrão Cormen, como `MEDIA(V)` ou `PARTITION(A, p, r)`. A fonte aparece abaixo do quadro e usa `elaboração própria` por padrão; para trocar a fonte, use o argumento opcional, como `\begin{undfpseudocodigo}[Cormen, 2022]{PARTITION(A, p, r)}{partition}{Particionar o arranjo}`. Prefira finalizadores locais, como `Fim-se`, `Fim-para` e `Fim-enquanto`, para melhorar a leitura de blocos longos.

O início do pseudocódigo reserva cinco linhas, e o início da citação longa reserva
quatro; não é reservada uma fração fixa da página. Títulos extensos de pseudocódigo
quebram dentro da largura do texto. Blocos maiores que uma página podem continuar
na seguinte. Tabelas multipágina devem usar `longtable`, fora de `undftabela`.

Nos dois perfis, apêndices e anexos têm sequências próprias A, B, C. Cada complemento
reinicia suas seções e objetos: a primeira seção é `A.1`, e a primeira figura,
tabela ou equação também recebe `A.1`. Os destinos dos hyperlinks distinguem
apêndices e anexos mesmo quando ambos têm a letra A.

## 9. Avisos de validação

O comando abaixo é chamado no início do documento:

```tex
\undfvalidateonepagecontents
```

Por padrão, o template emite aviso quando resumo ou abstract parecem ultrapassar o limite prático de uma página, mas continua a compilação. Os demais elementos de uma página também emitem avisos quando parecem longos demais ou próximos de ultrapassar uma página.

Para transformar o excesso estimado de resumo/abstract em erro durante uma revisão, use antes da validação:

```tex
\bloquearresumoslongos
```

O template não impõe quantidade de palavras-chave. Escolha termos suficientes para representar o conteúdo e siga eventual regra formal do curso. A ABNT exige a apresentação logo abaixo do resumo, com termos separados por ponto e vírgula e encerrados por ponto.

## 10. Compilação recomendada

Use `latexmk`, que executa LuaLaTeX e Biber quantas vezes forem necessárias (a configuração do projeto está em `.latexmkrc`):

```powershell
latexmk
```

No Overleaf, o `.latexmkrc` é lido automaticamente; defina o compilador do projeto como LuaLaTeX.

Se preferir o fluxo manual equivalente:

```powershell
lualatex -interaction=nonstopmode -halt-on-error tcc.tex
biber tcc
lualatex -interaction=nonstopmode -halt-on-error tcc.tex
lualatex -interaction=nonstopmode -halt-on-error tcc.tex
```

No fluxo manual, quando houver mudança em sumário, listas, citações ou referências, compile novamente até que os avisos de referências pendentes desapareçam.
