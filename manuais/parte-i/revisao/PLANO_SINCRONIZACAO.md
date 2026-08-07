# Plano de sincronização dos artefatos

Versão-base: 0.3.1-preliminar

| ID | Artefato | Fonte controlada | Situação atual | Divergências conhecidas | Ação | Teste | Estado |
|---|---|---|---|---|---|---|---|
| SYNC-001 | Parte I em LaTeX | manuais/parte-i/*.tex | Separada e revisada localmente | Validações institucionais abertas | Compilar e auditar após cada decisão acadêmica | TEST-002; TEST-013 | Parcialmente concluído |
| SYNC-002 | PDF da Parte I | manuais/parte-i/manual-tcc-undf.pdf | Gerado localmente | Aprovação institucional pendente | Substituir apenas pelo PDF compilado da mesma revisão | TEST-001; TEST-002; TEST-013 | Pendente de validação |
| SYNC-003 | Parte II técnica | manuais/parte-ii/*.tex | Revisada para a versão 0.3.1-preliminar | Deve acompanhar comandos do template 0.1.0 | Compilar e revisar após mudanças da interface pública | TEST-003; TEST-014 | Parcialmente concluído |
| SYNC-004 | Modelo LaTeX em branco | tcc.tex e fontes | Implementado localmente | Decisões PI-004 a PI-012 podem alterar saída | Recompilar após deliberações | TEST-004 | Parcialmente concluído |
| SYNC-005 | TCC de exemplo | tcc-exemplo-undf.tex e exemplo/* | Implementado localmente | Deve cobrir recursos e permanecer didático | Manter cobertura e compilar | TEST-005 | Parcialmente concluído |
| SYNC-006 | DOCX modelo | docx-google-docs/UnDF-TeX_Google_Docs.docx | Implementação local concluída | Tipografia e títulos dependem de PI-004/PI-005 | Regerar após decisões | TEST-004; TEST-009 | Parcialmente concluído |
| SYNC-007 | DOCX exemplo | docx-google-docs/UnDF-TeX_Google_Docs_EXEMPLO.docx | Implementação local concluída | Mesmas decisões do modelo | Regerar e exportar PDF | TEST-004; TEST-009 | Parcialmente concluído |
| SYNC-008 | Google Docs modelo | Cópia online identificada | Contém regra antiga de três a seis palavras-chave | Falta controle de versão e autorização de republicação | Corrigir cópia controlada e retirar/arquivar versão antiga | TEST-010 | Pendente de implementação |
| SYNC-009 | Google Docs exemplo | Cópia online identificada | Conteúdo não está sincronizado integralmente | Falta controle de versão e autorização de republicação | Corrigir, revisar e publicar com registro | TEST-010 | Pendente de implementação |
| SYNC-010 | Documentação pública | README, guias e changelog | Em revisão local | Links online podem apontar para cópias antigas | Atualizar após PI-018 | TEST-007; TEST-012 | Pendente de implementação |
| SYNC-011 | Documentos de controle | manuais/parte-i/revisao/*.md | Consolidados nesta versão | Resultados de testes ainda devem ser atualizados | Manter IDs e estados sincronizados | TEST-012 | Parcialmente concluído |
| SYNC-012 | PDF da Parte II | manuais/parte-ii/manual-undf.pdf | Gerado localmente | Aprovação editorial pendente | Manter versão documental e compatibilidade visíveis | TEST-014 | Pendente de validação |
| SYNC-013 | Volume combinado | manuais/manual-completo.pdf | Integrado na versão 0.3.1-preliminar | Compartilha os capítulos-fonte das Partes I e II | Regenerar após alterações nos capítulos ou estilos compartilhados | TEST-015 | Concluído no escopo local |

Situação controlada do Google Docs: **implementação local concluída; validação e publicação online pendentes**.
