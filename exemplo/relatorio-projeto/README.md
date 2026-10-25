# Exemplo didático de relatório final de projeto — 1.3

Entrada: `relatorio-projeto-exemplo-undf.tex`, na raiz.
O texto descreve a organização dos modelos de relatório final do próprio
UnDF-TeX. Os resultados se limitam aos artefatos e verificações locais;
não houve implantação em empresa, pesquisa com estudantes ou validação
institucional. Autoria, orientação e banca são demonstrativas.

Os arquivos desta pasta não são carregados pelo modelo para preenchimento.
Edite `modelos/relatorio-projeto/` para escrever seu trabalho. A extensão
reduzida serve à demonstração e não define o tamanho de um TCC.

Compile na raiz:

```powershell
.\scripts\verificar-perfis.ps1 -Documentos relatorio-projeto-exemplo-undf.tex
```

As saídas ficam em `build/perfis/`. A conferência é descrita em
[verificação dos relatórios](../../docs/verificacao-relatorios-2026-10-25.md).
