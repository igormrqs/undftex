# Registros de projetos e portfólio final

| Documento | Finalidade | Entrada |
| --- | --- | --- |
| Relatório parcial de cada projeto | Preservar memória, conteúdo e evidências para a escrita posterior | [relatorio-projeto-aplicado.tex](../relatorio-projeto-aplicado.tex) |
| Relatório final do portfólio 1.1 | Reunir todos os projetos do percurso declarado e analisar o conjunto | [portfolio.tex](../portfolio.tex) |
| Relatório final de projeto técnico/profissional 1.3 | Apresentar projeto realizado em ambiente profissional e a atuação do estudante | [relatorio-projeto.tex](../relatorio-projeto.tex) |
| Relatório final de negócio tecnológico 1.4 | Apresentar o modelo de negócio consolidado, evidências e limites da análise | [negocio-tecnologico.tex](../negocio-tecnologico.tex) |

## Do registro à análise do conjunto

O registro parcial é um relato flexível: contexto e objetivos; o que realizei
e como; decisões, dificuldades e aprendizados; entregas, resultados e limites;
evidências recuperáveis; dúvidas e pontos a retomar. Pode ser escrito durante
ou depois do projeto, identificando lacunas. Não exige periodicidade, nota,
parecer ou cronograma, nem uma conclusão antecipada. O nome da entrada anterior
foi preservado, mas a montagem de relatório final de um projeto foi substituída.

O portfólio final declara seu percurso e inclui todos os projetos desse
conjunto no inventário e nas sínteses. A análise integradora relaciona
conhecimentos, decisões, resultados e aprendizado, com evidências e distinção
entre contribuição individual e equipe. Não é uma colagem dos registros.
O curso deve confirmar o recorte, a admissibilidade e os critérios de avaliação.
O modelo não fixa quantidade de projetos.

O parcial tem abertura enxuta e fontes consultadas ao final. O portfólio final,
o projeto profissional e o negócio tecnológico mantêm a apresentação comum
em `modelos/comum/pre-textuais.tex`, os elementos obrigatórios/opcionais e as
referências em página própria, como no TCC convencional. Todos reutilizam
`perfil=monografia`; não há nova opção da classe. Veja o [índice de edição](../modelos/README.md).

Artigo científico não é obrigatório e não integra os registros, o portfólio
ou o relatório profissional. Os modelos 1.3 e 1.4 mantêm seus escopos próprios.

## Referência escolhida e limites de uso

A Parte I de `Relatorio_Final_UnDF_TeX_Entrega_REVISADO.tex`, datada de
23/08/2026, foi a referência de organização escolhida na conversa com o
responsável pelo projeto:

- exportação Prism: `RELATORIO FINAL - APÓS AJUSTES NOVOS`;
- SHA-256: `e3e741b4749d5e26e80924df7c7c6c1ec46236227b59a7bae81a6773fbd6dfad`;
- título: *Construção de um Modelo de Trabalho de Conclusão de Curso com a Identidade da UnDF*;
- autores: Lucas Rocha de Santana e Igor Marques dos Santos Magalhães; orientação de Fernando Lima Madeira.

Objetivos, procedimentos, entregas, evidências, limitações e conclusão apoiaram
a organização do relato conclusivo. A consolidação de etapas do mesmo projeto
na referência não foi tratada como portfólio de projetos distintos. O artigo
da Parte II, os cabeçalhos, o texto, os resultados, as notas, as autoavaliações
e os pareceres PIDTI não foram transformados em requisitos gerais de TCC.
Os trimestrais PIDTI/UnDF e o formulário parcial de IC serviram à compreensão
do percurso; não estabelecem equivalência com formulário oficial da FAPDF.
O registro parcial agora prioriza memória e documentação, conforme a decisão
do responsável, sem reproduzir acompanhamento periódico.

Os originais permanecem no acervo local. Relatórios integrais, conversas e
dados pessoais não foram incorporados à distribuição.

## Evidências dos exemplos

O [exemplo parcial de P01](../exemplo/projeto-aplicado/README.md) descreve um
validador de solicitações isoladas, com cenário acadêmico fictício. Na raiz,
com Python 3:

```powershell
python exemplo/projeto-aplicado/artefatos/validar_reserva.py
```

Os seis casos conferem duas aceitações e quatro recusas. A execução falha se
houver divergência. Esses resultados não demonstram implantação, pesquisa com
pessoas ou impacto. P01-E01 identifica o programa, P01-E02 as entradas e
P01-E03 a saída reproduzível. A integração contínua executa os mesmos casos.

O [exemplo de portfólio](../exemplo/portfolio/README.md) reúne P01 e P02, todos
os projetos do percurso didático declarado. P02 produziu um guia documental
(P02-E01), acompanhado de registro de memória (P02-E02). O guia não foi
avaliado com leitores. Dois projetos são apenas uma escolha demonstrativa.
Inventário, desenvolvimento e análise integradora usam esses identificadores.

O exemplo profissional preserva seu cenário fictício e as evidências da etapa
documental anterior; não representa validação de empresa ou estágio real.

## Verificação e continuidade

`scripts/verificar-perfis.ps1` compila quatorze documentos de uso e dez casos
de regressão/validação. `scripts/verificar-relatorios.ps1` distingue os dois
parciais enxutos dos seis relatórios finais: apresentação, resumos, estrutura,
fontes/referências e ausência de uma parte de artigo nos projetos e portfólios.
Os PDFs e logs ficam em `build/perfis/`, sem versionamento.

O Manual ESETI acompanha essa distinção na modalidade 1.1 e permanece um
projeto local separado. A aprovação institucional e a conferência das fontes
dos PPCs continuam pendentes. A implementação técnica não supre essa análise.
A integração à `main` e a sincronização com a base pública são etapas futuras.


## Resultado da verificação local — 28/10/2026

Os quatorze documentos de uso e dez casos de regressão/validação compilaram
com LuaLaTeX/Biber. Passaram os verificadores de artigo, contadores,
complementos, registros parciais e relatórios finais. Após o ajuste visual
do espaçamento dos parciais, os dois foram recompilados e o verificador dos
oito documentos de relatório foi executado novamente com sucesso.

Os parciais preenchível e demonstrativo têm duas páginas cada; os portfólios,
treze cada. Todas as suas páginas foram renderizadas e conferidas. O Manual
ESETI tem sete páginas; o guia técnico, 41; o volume integrado, 149. As páginas
alteradas dos manuais e seu contexto foram conferidos visualmente. Os logs
desses sete documentos não apresentaram conteúdo excedendo margens ou
referências indefinidas. A inspeção não representa aprovação institucional.

A conferência organizacional aprovou 77 links locais, sem auxiliares
versionados. Os seis casos técnicos de P01 passaram, e os materiais de P02
estão presentes. Os 41 arquivos do acervo de referência do Prism mantiveram
seus hashes SHA-256. A classe, os modelos 1.3/1.4, a `main` e o checkout público
não foram alterados. São verificações locais; não atestam execução remota do workflow.
