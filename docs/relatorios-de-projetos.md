# Relatórios finais de projetos

O desenvolvimento distingue três documentos:

| Documento | Recorte | Entrada |
| --- | --- | --- |
| Relatório final de um Projeto Aplicado | Projeto realizado no semestre, com equipe e contribuição individual | [relatorio-projeto-aplicado.tex](../relatorio-projeto-aplicado.tex) |
| Relatório final de projeto técnico/profissional | Projeto desenvolvido em ambiente profissional, com vínculo e atuação identificados | [relatorio-projeto.tex](../relatorio-projeto.tex) |
| Portfólio de TCC | Seleção e articulação de projetos em uma entrega integradora | Consolidação ainda a definir com os professores |

O relatório de um Projeto Aplicado pode apoiar a modalidade 1.1 do Manual ESETI,
mas a entrada nova não implementa o portfólio completo. O modelo profissional
mantém a modalidade 1.3 e não transforma qualquer atividade externa em TCC admitido.

## Referências utilizadas e limite do reaproveitamento

A Parte I de `Relatorio_Final_UnDF_TeX_Entrega_REVISADO.tex`, datada de
23/08/2026, foi a referência de organização escolhida na conversa com o
responsável pelo projeto. Identificação da fonte:

- projeto exportado do Prism: `RELATORIO FINAL - APÓS AJUSTES NOVOS`;
- SHA-256 da fonte: `e3e741b4749d5e26e80924df7c7c6c1ec46236227b59a7bae81a6773fbd6dfad`;
- título: *Construção de um Modelo de Trabalho de Conclusão de Curso com a Identidade da UnDF*;
- autores do relatório: Lucas Rocha de Santana e Igor Marques dos Santos Magalhães; orientação de Fernando Lima Madeira.

| Aspecto da referência | Uso nos modelos |
| --- | --- |
| Objetivos, método, entregas, evidências, avaliação e conclusão | Conteúdo organizado no roteiro de sete seções já adotado |
| Balanço do planejamento e da execução | Registro de mudanças, atividades não realizadas e limites do escopo |
| Consolidação anual de etapas do mesmo projeto | Adaptada ao período do projeto; não tratada como portfólio de projetos diferentes |
| Artigo científico acrescentado à Parte II | Não integra os relatórios e não é exigido |
| Autoavaliação, pareceres, notas e assinaturas específicos do PIDTI | Não convertidos em novos requisitos gerais de TCC |
| Cabeçalhos, identidade visual, resultados e texto do caso original | Não copiados como padrão dos novos trabalhos |

Os trimestrais PIDTI/UnDF e o formulário parcial de IC foram consultados para
compreender o percurso e os campos proposto/executado. O conteúdo de avaliação
periódica não substitui o fechamento do projeto. Não foi estabelecida equivalência
com formulário oficial da FAPDF nem uma nova exigência de apresentação de artigo.
Os arquivos recebidos permanecem no acervo local; cópias integrais dos relatórios,
conversas e dados pessoais não foram incorporadas à distribuição.

## Apresentação e edição

As entradas reutilizam `perfil=monografia` e a apresentação em
`modelos/comum/pre-textuais.tex`, mantendo os elementos obrigatórios/opcionais
e a formatação das referências já adotados. Não foram criadas opções novas
da classe. Para entrega semestral, a identificação e as páginas institucionais
devem ser confirmadas com o curso; essa montagem não fixa novos requisitos.

Cada documento mantém seus próprios metadados, resumos, conteúdo e bibliografia.
Os exemplos são independentes dos modelos para preenchimento. Veja o
[índice de edição](../modelos/README.md).

## Evidências do exemplo de Projeto Aplicado

O exemplo descreve um validador de solicitações isoladas de reserva, com cenário
acadêmico fictício e artefatos técnicos executáveis. O programa e os seis casos
estão em `exemplo/projeto-aplicado/artefatos/`. Execute na raiz, com Python 3:

```powershell
python exemplo/projeto-aplicado/artefatos/validar_reserva.py
```

Dois casos retornam aceitação e quatro retornam impedimentos distintos. A execução
confere o resultado esperado em cada caso e falha em caso de divergência. Esses
resultados não representam implantação, pesquisa com pessoas ou avaliação de
impacto. O programa é um artefato específico do exemplo, não uma exigência para
Projetos Aplicados. A integração contínua confere esses mesmos casos.

O exemplo profissional preserva uma etapa documental anterior, com dois modelos
e dois exemplos. Seu cenário organizacional é fictício; suas evidências locais
não são apresentadas como validação de uma empresa ou de um estágio real.

## Verificação e continuidade

O script `scripts/verificar-perfis.ps1` compila os doze modelos e os casos de
regressão. `scripts/verificar-relatorios.ps1` confere os seis documentos de
relatório, incluindo a ausência de uma parte de artigo nos relatórios de projeto.
Saídas ficam em `build/perfis/`, sem versionamento de PDFs.

A implementação do portfólio consolidado depende de definir seleção, texto
integrador, identificação da contribuição individual e critérios de avaliação.
Esta etapa não fixa quantidade de projetos nem muda a admissibilidade por curso.
Os instrumentos de acompanhamento e uma futura publicação seguem como frentes
separadas. A `main` e a base pública permanecem fora desta alteração.


## Resultado da verificação local

Na verificação de 28/10/2026, os doze modelos e os dez casos de teste/validação
compilaram com LuaLaTeX/Biber. Os verificadores de artigo, relatórios e
complementos passaram. Os seis casos do artefato Python retornaram o esperado,
e a conferência organizacional aprovou 58 links locais, sem auxiliares versionados.

Os modelos e exemplos de Projeto Aplicado e projeto profissional resultaram
em 14 páginas cada, sem avisos de conteúdo ultrapassando as margens ou de
referências indefinidas. Todas as suas páginas foram renderizadas e conferidas,
incluindo as tabelas de resultados e de balanço da execução.
O Manual ESETI compilou em 7 páginas, o guia técnico em 41 e o volume integrado
em 149, com revisão visual das páginas alteradas e sem `Overfull` ou referências
indefinidas. São resultados locais; não atestam execução remota do workflow.

Os originais do Prism e seus recursos permaneceram inalterados por comparação
SHA-256. Não houve importação integral do relatório, alteração da classe,
integração à `main` ou sincronização com o repositório público.
