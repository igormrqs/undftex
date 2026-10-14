# Contribuindo com o UnDF-TeX

Obrigado pelo interesse em contribuir com o UnDF-TeX.

Este projeto combina código LaTeX, decisões institucionais e interpretação prática de normas acadêmicas. Por isso, contribuições devem priorizar clareza, estabilidade e rastreabilidade.

## Antes de alterar

Leia:

- `README.md`;
- `docs/guia-de-uso.md`;
- `docs/estrutura-do-projeto.md`;
- `docs/decisoes-institucionais.md`;
- `MANIFEST.md`.

## Princípios

- Faça mudanças pequenas e justificáveis.
- Preserve a estrutura modular existente.
- Não refatore arquivos não relacionados ao problema.
- Não altere decisões institucionais sem registrar o motivo.
- Não reproduza textos integrais de normas ABNT.
- Mantenha o idioma principal em português.

## Fluxo recomendado

1. Descreva o problema ou melhoria.
2. Faça a menor alteração que resolve o caso.
3. Compile o modelo afetado.
4. Atualize a documentação quando a interface pública mudar.
5. Registre mudança relevante em `CHANGELOG.md`.

## Verificação mínima

Compile os dois modelos com `latexmk` (a configuração está em `.latexmkrc`):

```powershell
latexmk tcc.tex
latexmk tcc-exemplo-undf.tex
```

Ambos devem terminar sem erros e sem warnings novos. O fluxo manual equivalente (lualatex, biber, lualatex, lualatex) continua válido e está documentado no `README.md`.

## Imagens e arquivos grandes

Antes de adicionar imagens ao repositório:

- confira peso, largura e altura do arquivo;
- evite versionar imagens acima de `5 MB`, salvo justificativa clara;
- prefira cópias otimizadas para uso no PDF, preservando originais fora do projeto;
- não substitua imagens técnicas por versões comprimidas sem verificar legibilidade;
- compile o exemplo quando alterar imagens usadas por `tcc-exemplo-undf.tex`.
## Commits

Use mensagens objetivas, preferencialmente em inglês para manter o histórico uniforme. Exemplos:

- `docs: add usage guide`
- `fix: adjust approval page spacing`
- `feat: add symbols list command`
- `chore: update license files`

## Mudanças normativas

Quando a mudança envolver ABNT ou padrão institucional, registre:

- qual elemento foi alterado;
- qual norma ou decisão motivou a mudança;
- qual impacto visual ou de uso foi esperado;
- quais arquivos foram verificados após a alteração.

## Licença das contribuições

Ao contribuir, você concorda que sua contribuição seja distribuída sob a mesma licença do projeto: LPPL 1.3c ou posterior.
