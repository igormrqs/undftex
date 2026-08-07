# Quadro de compatibilidade entre manual e modelos

Versão: 0.3.1-preliminar  
Data de referência: 7 de agosto de 2026

Estados: consistente; parcialmente consistente; inconsistente; não implementado; não aplicável; pendente de decisão.

| ID | Regra | Manual | LaTeX | DOCX | Google Docs | PDF de exemplo | Validação automática | Estado | Ação necessária |
|---|---|---|---|---|---|---|---|---|---|
| COMP-001 | Papel A4 | Definido | Configurado | Configurado | Herdado do DOCX | Verificado | TEST-002 a TEST-005 | consistente | Manter em regressão. |
| COMP-002 | Margens 3 cm/2 cm | Definido | Automatizadas | Configuradas | Herdadas, sujeitas à exportação | Verificado | TEST-002 a TEST-005 | consistente | Revalidar após alterações de estilo. |
| COMP-003 | Corpo em 12 pt | Definido | Configurado | Configurado | Configurado | Verificado visualmente | TEST-004; TEST-009 | consistente | Manter. |
| COMP-004 | Família tipográfica | Legibilidade e uniformidade exigidas | Latin Modern | Times New Roman | Times New Roman | Latin Modern | TEST-009 | inconsistente | Definir equivalência controlada ou sincronizar os formatos. |
| COMP-005 | Título de seção primária | Forma `1 INTRODUÇÃO` validada | 12 pt, negrito e caixa alta | Heading 1 em 16 pt | Heading 1 em 16 pt | Reflete o LaTeX | TEST-009 | inconsistente | Sincronizar a escala sem alterar a forma validada. |
| COMP-006 | Demais níveis de título | Hierarquia descrita | Estilos próprios | 12 pt com variação de destaque | Herda o DOCX | Reflete o LaTeX | TEST-009 | parcialmente consistente | Consolidar quadro tipográfico. |
| COMP-007 | Recuo de 1,25 cm | Decisão institucional validada no projeto | Automatizado | Configurado | Herdado por estilo | Verificado | TEST-004; TEST-005 | consistente | Manter em regressão. |
| COMP-008 | Primeiro parágrafo recuado | Decisão institucional validada no projeto | Automatizado | Configurado | Herdado por estilo | Verificado | TEST-004; TEST-005 | consistente | Manter em regressão. |
| COMP-009 | Quantidade de palavras-chave | Sem faixa fixa | Sem faixa fixa | Sem faixa fixa | Cópias online ainda dizem “três a seis” | Exemplo local atualizado | TEST-010 | inconsistente | Atualizar, validar e republicar as cópias online. |
| COMP-010 | Estimativa de ocupação do resumo | Não cria limite por si só | Emite aviso técnico; erro somente por opção explícita | Não automatizado | Não automatizado | Teste de excesso disponível no LaTeX | TEST-005; TEST-016 | parcialmente consistente | Preservar aviso e documentar diferenças entre ferramentas. |
| COMP-011 | Resumo em língua estrangeira | Elemento distinto | Suportado | Suportado | Suportado | Presente | TEST-004; TEST-005 | consistente | Manter. |
| COMP-012 | Sumário sem pré-textuais | Definido | Automatizado | Atualização por campo | Atualização por campo | Verificado | TEST-002 a TEST-005 | consistente | Orientar atualização antes da entrega. |
| COMP-013 | Contagem de páginas | Definida | Automatizada | Configurada por seções | Herdada do DOCX | Verificada | TEST-002 a TEST-005 | parcialmente consistente | Revalidar exportações online. |
| COMP-014 | Folha de aprovação | Modelo validado no projeto | Automatizada | Modelo local | Modelo online em revisão | Presente | TEST-004; TEST-005 | parcialmente consistente | Sincronizar a cópia online sem reabrir o modelo. |
| COMP-015 | Dados catalográficos | Fluxo pendente | Campo opcional | Campo orientativo | Campo orientativo | Exemplo disponível | TEST-004; TEST-005 | pendente de decisão | Deliberar PI-008. |
| COMP-016 | Citações NBR 10520:2023 | Orientadas | Estilo implementado | Exemplos editáveis | Exemplos editáveis | Casos compilados | TEST-005; TEST-006 | parcialmente consistente | Concluir validação normativa e bibliográfica. |
| COMP-017 | Referências NBR 6023:2025 | Orientadas | Estilo implementado | Exemplos editáveis | Exemplos editáveis | Lista compilada | TEST-005; TEST-006 | parcialmente consistente | Concluir validação bibliográfica. |
| COMP-018 | Figuras e tabelas | Orientadas | Ambientes disponíveis | Modelos disponíveis | Modelos disponíveis | Exemplos presentes | TEST-004; TEST-005 | consistente | Manter em regressão. |
| COMP-019 | Figuras independentes lado a lado | Orientadas | Comando/exemplo disponível | Montagem manual possível | Montagem manual possível | Exemplo presente | TEST-005 | parcialmente consistente | Documentar limitações de edição no DOCX/Google Docs. |
| COMP-020 | Fluxograma | Tratado como ilustração | Exemplo disponível | Inserção manual | Inserção manual | Exemplo presente | TEST-005 | consistente | Manter título, fonte, chamada e legibilidade. |
| COMP-021 | Pseudocódigo | Orientado | Ambiente disponível | Formatação manual | Formatação manual | Exemplo presente | TEST-005 | parcialmente consistente | Manter orientação sobre divisão de blocos. |
| COMP-022 | Identificador de versão no artefato | Presente | Presente nos manuais | Ausente no conteúdo | Ausente nas cópias online | Presente no manual | TEST-009; TEST-010 | não implementado | Definir onde exibir versão nos modelos editáveis. |
| COMP-023 | Links e referências cruzadas | Índice e remissões disponíveis | Automatizados | Campos parcialmente automatizados | Campos parcialmente automatizados | Navegação local disponível | TEST-007 | parcialmente consistente | Ampliar teste de links externos e exportações. |
| COMP-024 | Semântica e acessibilidade | Orientada | PDF marcado, idioma `pt-BR`; sem certificação PDF/UA | Recursos parciais | Recursos parciais | Marcação parcial | TEST-008; TEST-017 | parcialmente implementado | Executar veraPDF e teste assistivo antes de homologar. |
| COMP-025 | Controle de publicação | Ficha criada | Repositório versionado | Arquivo local controlado | Cópias online sem sincronização | PDF preliminar identificado | TEST-010; TEST-012 | parcialmente consistente | Definir autoridade, canal e fluxo de substituição. |

## Índice de consistência

Critério: número de linhas com estado **consistente** dividido pelo total de linhas aplicáveis. Linhas “não aplicável” seriam excluídas do denominador; nesta versão não há linhas nessa situação.

- linhas consistentes: 9;
- linhas aplicáveis: 25;
- índice atual: **36%**.

O índice mede igualdade operacional entre os formatos. Não mede aprovação institucional, conformidade normativa integral nem acessibilidade.

## Compatibilidade documental da edição 0.3.1-preliminar

| Artefato | Versão documental | Versão técnica relacionada | Autonomia |
|---|---|---|---|
| Parte I — Manual de TCC da UnDF | 0.3.1-preliminar | Independente de ferramenta | Completa |
| Parte II — Guia de Uso do UnDF-TeX | 0.3.1-preliminar | UnDF-TeX 0.1.0 | Completa |
| Volume combinado | 0.3.1-preliminar | UnDF-TeX 0.1.0 na Parte II | Reúne integralmente as duas partes |

Alterações futuras do software exigem revisar a Parte II e sua indicação de compatibilidade. Elas não devem modificar a Parte I, salvo quando também houver mudança acadêmica, normativa ou institucional.
