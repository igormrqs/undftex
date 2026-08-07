# Checklist de acessibilidade

Versão: 0.2.0-preliminar  
Situação geral: Pendente de validação. Este checklist não declara conformidade.

| Critério | Manual/PDF | LaTeX | DOCX | Google Docs | Teste exigido | Estado | Evidência/limitação |
|---|---|---|---|---|---|---|---|
| Hierarquia semântica de títulos | Visualmente hierárquica | Estrutura de seções | Estilos de título | Estilos herdados | Árvore estrutural por formato | Pendente de validação | Hierarquia visual não prova semântica no PDF. |
| Ordem lógica de leitura | Aparente | Fonte linear | Deve ser conferida | Deve ser conferida | Leitor de tela e inspeção de ordem | Pendente de validação | Não executado integralmente. |
| Texto alternativo | Parcial | Não garantido no PDF | Recurso disponível | Recurso disponível | Inventário de imagens informativas | Pendente de implementação | Cobertura incompleta. |
| Contraste | Predominantemente preto/branco | Controlado por estilos | Pode variar | Pode variar | Medição sistemática | Pendente de validação | Apenas inspeção visual anterior. |
| Uso de cor | Conteúdo não deve depender só de cor | Orientado | Orientado | Orientado | Revisão de todas as figuras | Pendente de validação | Sem ensaio integral. |
| Tabelas | Cabeçalhos visuais | Estrutura tabular | Marcação a conferir | Marcação a conferir | Navegação célula a célula | Pendente de validação | PDF não certificado. |
| Links descritivos | Parcial | Texto controlável | Parcial | Parcial | Leitura fora de contexto | Pendente de validação | Links externos não foram todos testados. |
| Idioma principal | Português no conteúdo | Metadado a conferir | Metadado a conferir | Metadado a conferir | Inspeção de propriedades | Pendente de validação | Não verificado em todos os formatos. |
| Mudança de idioma | Resumos identificados | Marcação a conferir | Marcação a conferir | Marcação a conferir | Leitor de tela | Pendente de implementação | Não garantida de ponta a ponta. |
| Legendas e fontes | Legíveis visualmente | Automatizadas | Editáveis | Editáveis | Inspeção e leitor de tela | Parcialmente concluído | AUD-001 cobre somente legibilidade visual. |
| Equações | Orientação editorial | Saída visual | Editor nativo possível | Editor nativo possível | Alternativa textual/MathML | Pendente de implementação | Não há cobertura completa. |
| Listas | Aparência consistente | Estrutura LaTeX | Estilos disponíveis | Estilos disponíveis | Navegação semântica | Pendente de validação | Exportação PDF pode perder semântica. |
| Navegação | Sumário e referências | Links internos | Campos e sumário | Campos e sumário | Teclado e leitor de tela | Pendente de validação | Cobertura parcial. |
| PDF marcado | Não certificado | Não garantido | Depende da exportação | Depende da exportação | Validador de PDF acessível | Pendente de implementação | Ausência de certificação. |
| Linguagem e instruções | Revisadas tecnicamente | Não aplicável ao motor | Conteúdo equivalente | Conteúdo desatualizado | Teste com usuários | Pendente de validação | TEST-011 não executado. |
| PDF pesquisável | Texto selecionável e pesquisável | Gerado com texto | Depende da exportação | Depende da exportação | Busca por amostra conhecida | Concluído | Confirmado nos quatro PDFs locais; não comprova marcação semântica. |
| Notas | Aparência legível | Notas nativas | Notas nativas disponíveis | Notas nativas disponíveis | Ordem de leitura com leitor de tela | Pendente de validação | Exemplo visual testado, leitura assistiva pendente. |
| Gráficos | Devem ter descrição equivalente | Texto alternativo não garantido | Recurso disponível | Recurso disponível | Inventário e teste assistivo | Pendente de implementação | Cobertura incompleta. |
| Formulários/campos | Manual não é formulário | Não aplicável ao PDF estático | Campos de orientação editáveis | Campos editáveis | Navegação, rótulo e instrução | Pendente de validação | Escopo institucional ainda não definido. |
| Marcadores | Sumário e links internos | 279 links internos no manual | Sumário/campos | Sumário nativo possível | Inspeção da árvore e navegação por teclado | Pendente de validação | Links bem formados não provam marcadores adequados. |
| Metadados | Título e autoria presentes | Metadados PDF parciais | Propriedades a conferir | Propriedades a conferir | Inspeção por formato | Pendente de implementação | Idioma e conjunto mínimo ainda não foram validados. |

## Registro dos testes

Sistema operacional: Windows; versão não registrada.

| ID | Arquivo | Ferramenta/versão | Procedimento | Resultado | Limitações | Responsável | Estado |
|---|---|---|---|---|---|---|---|
| TEST-013 | Quatro PDFs locais | Poppler pdfinfo 26.05.0 | Verificar pesquisabilidade, metadados e marcação | PDFs pesquisáveis; 0 de 4 marcados | Não avalia ordem de leitura real | Equipe técnica do projeto | Concluído |
| TEST-014 | Quatro PDFs locais | pypdf 6.10.0 | Enumerar links e estrutura raiz | 488 links internos e 22 externos bem formados; sem StructTreeRoot | Não valida a qualidade textual dos destinos | Equipe técnica do projeto | Concluído |
| TEST-015 | PDFs, DOCX e Google Docs | Pendente de definição | Conferir idioma principal e mudanças de idioma | Não executado | Ferramenta e responsável não definidos | Pendente de definição | Pendente de validação |
| TEST-016 | PDFs, DOCX e Google Docs | Pendente de definição | Navegar ordem de leitura, títulos, listas, tabelas e notas | Não executado | Requer tecnologia assistiva e amostra de usuários | Pendente de definição | Pendente de validação |
| TEST-017 | Imagens, gráficos e equações | Pendente de definição | Inventariar alternativas textuais e testar sua leitura | Não executado | Cobertura e critérios institucionais ausentes | Pendente de definição | Pendente de validação |
| TEST-018 | Páginas e figuras | Pendente de definição | Medir contraste e independência de cor | Não executado | Ferramenta não definida | Pendente de definição | Pendente de validação |
| TEST-019 | DOCX e Google Docs | Pendente de definição | Testar campos, instruções, teclado e exportação | Não executado | Cópias online estão desatualizadas | Pendente de definição | Pendente de validação |
| TEST-020 | PDFs candidatos à publicação | Pendente de definição | Validar marcadores, metadados e requisitos institucionais | Não executado | Depende de PI-017 e da versão candidata | Pendente de definição | Pendente de decisão institucional |
