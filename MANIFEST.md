# Manifesto do trabalho

Este arquivo identifica, para fins práticos de distribuição sob LPPL, os grupos de arquivos que compõem o trabalho UnDF-TeX.

## Trabalho

O trabalho UnDF-TeX é composto por:

- `undftex.cls`;
- `src/undftex.cls`;
- módulos LaTeX em `src/`;
- estilos bibliográficos em `src/biblatex/`, incluindo `undf-abnt.bbx` e `undf-abnt.cbx`;
- modelos `tcc.tex`, `tcc-exemplo-undf.tex`, `artigo.tex` e `tcc-artigo.tex`;
- conteúdos de exemplo em `capitulos/`, `obrigatorio/`, `opcional/`, `exemplo/` e `artigo/`;
- recursos visuais próprios em `figuras/` e `identidade/`;
- manual técnico do template em `manuais/parte-ii/`;
- manual acadêmico de TCC em `manuais/parte-i/`;
- volume integrado em `manuais/manual-completo.tex`;
- documentação e metadados de distribuição em `README.md`, `CONTRIBUTING.md`, `CHANGELOG.md`, `VERSION.txt`, `LICENSE`, `LICENSE-LPPL-1.3c.tex`, `MANIFEST.md` e `docs/`;
- infraestrutura de compilação e verificação em `.latexmkrc`, `.github/workflows/`, `scripts/` e `tests/`.

## Fora do trabalho distribuído

Não fazem parte do trabalho distribuído por padrão:

- arquivos auxiliares gerados por compilação LaTeX;
- PDFs compilados localmente;
- caches, logs e arquivos temporários;
- cópias integrais de normas ABNT;
- arquivos grandes, imagens originais pesadas ou arquivos usados apenas para teste local;
- credenciais, configurações pessoais de editor ou dados privados.

## Manutenção

Ao adicionar arquivos de código, documentação, exemplo ou identidade visual que devam ser distribuídos com o projeto, atualize este manifesto.
