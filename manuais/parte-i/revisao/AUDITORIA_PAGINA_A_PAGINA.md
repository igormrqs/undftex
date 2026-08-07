# Auditoria visual e técnica de compilação — página a página

Arquivo auditado: `manual-tcc-undf.pdf`  
Versão: 0.2.0-preliminar  
Total: 113 páginas físicas  
Método: renderização integral, inspeção visual das páginas e conferência textual complementar.

> O resultado “OK” indica ausência de falhas visuais evidentes de diagramação, cortes, sobreposições, páginas vazias indevidas, problemas de margem e falhas aparentes de legibilidade. Esse resultado não representa, isoladamente, certificação normativa, jurídica, institucional ou de acessibilidade digital.

## Controle das auditorias

| ID | Categoria | Arquivo/versão | Data | Responsável | Ferramenta | Páginas | Método | Resultado | Limitações | Evidência | Pendências |
|---|---|---|---|---|---|---:|---|---|---|---|---|
| AUD-001 | Visual | manual-tcc-undf.pdf / 0.2.0-preliminar | 06/08/2026 | Equipe técnica do projeto | Poppler e inspeção humana | 113 | Renderização e inspeção de todas as páginas | Concluído | Não avalia semântica, conteúdo normativo ou tecnologia assistiva | Tabela página a página abaixo | Repetir após alterações |
| AUD-002 | Compilação | Manuais e modelos locais / 0.2.0-preliminar | 06/08/2026 | Equipe técnica do projeto | LuaHBTeX 1.24.0 e Biber; ciclos explícitos | 113/30/12/34 | Compilação dos artefatos definidos em TEST-002 a TEST-005 | Concluído | O latexmk não pôde ser usado porque o MiKTeX não encontrou Perl; os ciclos equivalentes foram executados diretamente | Logs de compilação | Repetir após deliberações |
| AUD-003 | Paginação | PDFs locais / 0.2.0-preliminar | 06/08/2026 | Equipe técnica do projeto | Inspeção PDF | 113/30/12/34 | Contagem, exibição e sumário | Concluído | Não equivale a homologação institucional | TEST-002 a TEST-005 | Revalidar após decisões |
| AUD-004 | Referências cruzadas | PDFs locais / 0.2.0-preliminar | 06/08/2026 | Equipe técnica do projeto | Logs, pypdf e inspeção PDF | 113/30/12/34 | Sumário, citações internas e referências de figuras/tabelas | Parcialmente concluído | Todos os cenários de edição não foram testados | TEST-007 | Ampliar teste de edição |
| AUD-005 | Normativa | Manual / 0.2.0-preliminar | 06/08/2026 | Equipe técnica do projeto | Leitura comparativa das NBR disponíveis | 113 | Regras citadas no manual | Pendente de validação | Revisão técnica não substitui parecer institucional competente | MATRIZ_ALTERACOES.md | Registrar VAL-001 |
| AUD-006 | Bibliográfica | Manual e exemplo / 0.2.0-preliminar | 06/08/2026 | Pendente de definição institucional | Pendente de definição | 113/34 | Referências, exemplos e chamadas | Pendente de validação | Não houve validação bibliotecária formal | CHK-009 | Registrar VAL-002 |
| AUD-007 | Links | PDFs locais / 0.2.0-preliminar | 06/08/2026 | Equipe técnica do projeto | pypdf, navegador e inspeção | 113/30/12/34 | 488 links internos e 22 externos; destinos reais e didáticos classificados | Parcialmente concluído | Endereço da UnDF foi inconclusivo no ambiente; URLs de exemplo não são destinos operacionais | TEST-007 | Repetir teste externo antes da publicação |
| AUD-008 | Acessibilidade | Todos os formatos / 0.2.0-preliminar | 06/08/2026 | Pendente de definição institucional | pdfinfo e inspeção preliminar | 113/30/12/34 | Critérios do checklist de acessibilidade | Pendente de validação | PDFs não marcados; sem teste completo com leitor de tela | CHK-041 a CHK-061 | Deliberar PI-017 |
| AUD-009 | Compatibilidade | LaTeX, DOCX, Google Docs e PDFs / 0.2.0-preliminar | 06/08/2026 | Equipe técnica do projeto | Comparação estrutural e visual | 113/30/12/34; DOCX 26/27 na execução registrada | Comparação das 25 regras do quadro | Parcialmente concluído | Tipografia, títulos, automações e cópias online divergem | COMP-001 a COMP-025 | Deliberar PI-004, PI-005 e PI-018 |
| AUD-010 | Institucional | Conjunto documental / 0.2.0-preliminar | 06/08/2026 | Pendente de definição institucional | Não aplicável | Não aplicável | Aprovação, vigência, autoridade e publicação | Pendente de decisão institucional | Não há ato, autoridade ou canal definidos | PI-001 a PI-019 | Executar plano de fechamento |

## Inspeção visual

Legenda: **OK** = sem sobreposição, corte, página vazia indevida ou falha de legibilidade identificada no método visual declarado.

| Página | Conteúdo principal | Resultado |
|---:|---|---|
| 1 | Capa do manual | OK |
| 2 | Apresentação | OK |
| 3 | Como ler o manual | OK |
| 4 | Sumário, início | OK |
| 5 | Sumário, continuação | OK |
| 6 | Sumário, continuação | OK |
| 7 | Sumário, continuação | OK |
| 8 | Sumário, continuação | OK |
| 9 | Sumário, continuação | OK |
| 10 | Sumário, continuação | OK |
| 11 | Sumário, final | OK |
| 12 | Contexto institucional | OK |
| 13 | Alcance e documentos complementares | OK |
| 14 | Princípios do TCC | OK |
| 15 | Qualidade e responsabilidade | OK |
| 16 | Percurso do TCC | OK |
| 17 | Etapas e planejamento | OK |
| 18 | Modalidades de TCC | OK |
| 19 | Relatório e produto acadêmico | OK |
| 20 | Escolha da modalidade | OK |
| 21 | Tema, problema, objetivos e justificativa | OK |
| 22 | Problema e objetivos | OK |
| 23 | Projeto de pesquisa | OK |
| 24 | Estrutura do projeto | OK |
| 25 | Cronograma e riscos | OK |
| 26 | Ética e responsabilidade | OK |
| 27 | Animais, material biológico e autorização | OK |
| 28 | Validação e proteção das respostas | OK |
| 29 | Fontes e rastreabilidade | OK |
| 30 | Metodologia | OK |
| 31 | Pesquisa de campo | OK |
| 32 | Coleta digital e qualidade | OK |
| 33 | Estrutura geral do TCC | OK |
| 34 | Elementos obrigatórios e opcionais | OK |
| 35 | Ordem dos elementos | OK |
| 36 | Elementos pré-textuais | OK |
| 37 | Ficha e folha de aprovação | OK |
| 38 | Resumo, palavras-chave e resumo estrangeiro | OK |
| 39 | Exemplo de paginação | OK |
| 40 | Elementos textuais | OK |
| 41 | Desenvolvimento e metodologia | OK |
| 42 | Resultados, discussão e conclusão | OK |
| 43 | Elementos pós-textuais | OK |
| 44 | Anexos e índice | OK |
| 45 | Escrita acadêmica | OK |
| 46 | Pessoa discursiva e revisão | OK |
| 47 | Normalização gráfica | OK |
| 48 | Tipografia e espaçamentos | OK |
| 49 | Títulos, paginação e sumário | OK |
| 50 | Consistência visual | OK |
| 51 | Modelos comentados | OK |
| 52 | Modelo de folha de rosto | OK |
| 53 | Modelo de folha de aprovação | OK |
| 54 | Errata e resumo | OK |
| 55 | Referências, apêndice e anexo | OK |
| 56 | Introdução aos exemplos visuais | OK |
| 57 | Captura da capa | OK |
| 58 | Captura da folha de rosto | OK |
| 59 | Captura da errata | OK |
| 60 | Captura da folha de aprovação | OK |
| 61 | Captura do resumo | OK |
| 62 | Captura do sumário | OK |
| 63 | Captura de figuras e tabelas | OK |
| 64 | Captura de fluxograma | OK |
| 65 | Captura de pseudocódigo | OK |
| 66 | Captura de glossário | OK |
| 67 | Captura de apêndice | OK |
| 68 | Captura de anexo | OK |
| 69 | Limites de uso das capturas | OK |
| 70 | Citações e referências | OK |
| 71 | Citação de citação e notas | OK |
| 72 | Conferência cruzada | OK |
| 73 | Casos especiais de citação | OK |
| 74 | Fonte sem autoria e autores homônimos | OK |
| 75 | Grifo, tradução e supressões | OK |
| 76 | Ilustrações e tabelas | OK |
| 77 | Quadros e continuação de tabelas | OK |
| 78 | Fluxogramas e pseudocódigo | OK |
| 79 | Orientação, apresentação e avaliação | OK |
| 80 | Apresentação oral | OK |
| 81 | Acessibilidade | OK |
| 82 | Conferência de acessibilidade | OK |
| 83 | Entrega e arquivamento | OK |
| 84 | Arquivamento | OK |
| 85 | Integridade e tecnologias | OK |
| 86 | Prevenção ao plágio | OK |
| 87 | Uso de IA por atividade | OK |
| 88 | Direitos autorais e licenças | OK |
| 89 | Governança e validação | OK |
| 90 | Manutenção e controle | OK |
| 91 | Referências normativas | OK |
| 92 | Decisões e documentos institucionais | OK |
| 93 | Acessibilidade e atualização | OK |
| 94 | Modelos de referências, início | OK |
| 95 | Livros, capítulos e trabalhos acadêmicos | OK |
| 96 | Legislação e jurisprudência | OK |
| 97 | Relatórios e normas | OK |
| 98 | Entrevistas e imagens | OK |
| 99 | Dados, software e mídias sociais | OK |
| 100 | Problemas recorrentes | OK |
| 101 | Discussão e fechamento | OK |
| 102 | Apêndice A: roteiro de projeto | OK |
| 103 | Apêndice A: justificativa a referências | OK |
| 104 | Apêndice A: apêndices, anexos e índice | OK |
| 105 | Apêndice B: matriz de coerência | OK |
| 106 | Apêndice C: checklists | OK |
| 107 | Apêndice C: checklist final | OK |
| 108 | Apêndice D: rubrica | OK |
| 109 | Apêndice D: observação final | OK |
| 110 | Apêndice E: cronograma | OK |
| 111 | Apêndice F: declaração de IA | OK |
| 112 | Apêndice G: paginação | OK |
| 113 | Ficha de controle documental | OK |

## Verificações complementares

- não há páginas fisicamente vazias;
- o sumário ocupa páginas próprias e termina antes do texto;
- elementos pré-textuais não aparecem no sumário;
- as 12 capturas estão legíveis, identificadas e acompanhadas de fonte;
- não há referências cruzadas indefinidas no log final;
- não há caixas de texto excedendo as margens registradas como `Overfull` no log final;
- a versão continua identificada como preliminar.

## Artefatos complementares verificados

| Artefato | Páginas | Verificação | Resultado |
|---|---:|---|---|
| Manual técnico do UnDF-TeX | 30 | Compilação, log e inspeção visual integral | Concluído |
| Modelo de TCC em branco | 12 | LuaLaTeX, Biber, log e inspeção visual integral | Concluído |
| TCC de exemplo | 34 | LuaLaTeX, Biber, log e inspeção visual integral | Concluído |
| Modelo DOCX exportado para PDF | 26 | Exportação e inspeção visual da execução registrada | Concluído |

Situação controlada do Google Docs: **implementação local concluída; validação e publicação online pendentes**.
