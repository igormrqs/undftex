# Auditoria de acessibilidade - 0.3.1-preliminar

Data: 7 de agosto de 2026  
Escopo: PDFs da Parte I, Parte II e volume integrado.

## Verificações executadas

| Critério | Parte I | Parte II | Integrado |
|---|---|---|---|
| Idioma do documento (`/Lang`) | `pt-BR` | `pt-BR` | `pt-BR` |
| PDF marcado (`/MarkInfo /Marked`) | sim | sim | sim |
| Árvore estrutural (`/StructTreeRoot`) | presente | presente | presente |
| Metadados de título, autoria, assunto e palavras-chave | presentes | presentes | presentes |
| Texto extraível em todas as páginas | sim | sim | sim |
| Páginas sem conteúdo textual inesperado | nenhuma | nenhuma | nenhuma |
| Contraste e legibilidade visual | adequados na inspeção | adequados na inspeção | adequados na inspeção |

Não há imagens incorporadas nos três manuais publicados nesta revisão; portanto, não houve imagem editorial que exigisse texto alternativo nesses PDFs. Os exemplos são compostos por texto e elementos vetoriais do próprio documento.

## Limites do resultado

O resultado comprova marcação estrutural básica, não conformidade PDF/UA. `titlesec` e `tocloft` têm compatibilidade incompleta com a marcação experimental utilizada; `fancyvrb` possui suporte parcial. O log do volume integrado mantém um aviso de destino sem referência estrutural. Não foi possível executar veraPDF porque o validador não está instalado no ambiente. Também não foi realizado ensaio integral com leitor de tela nem validação humana por usuários de tecnologia assistiva.

## Classificação

**Parcialmente concluído.** A revisão melhora materialmente a base acessível dos PDFs, mas certificação e homologação institucional permanecem pendentes.
