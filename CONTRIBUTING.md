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

Para o modelo em branco:

```powershell
lualatex -interaction=nonstopmode -halt-on-error tcc.tex
biber tcc
lualatex -interaction=nonstopmode -halt-on-error tcc.tex
lualatex -interaction=nonstopmode -halt-on-error tcc.tex
```

Para o exemplo completo:

```powershell
lualatex -interaction=nonstopmode -halt-on-error tcc-exemplo-undf.tex
biber tcc-exemplo-undf
lualatex -interaction=nonstopmode -halt-on-error tcc-exemplo-undf.tex
lualatex -interaction=nonstopmode -halt-on-error tcc-exemplo-undf.tex
```

## Commits

Use mensagens objetivas. Exemplos:

- `docs: adiciona guia de uso`
- `fix: corrige espaçamento da folha de aprovação`
- `feat: adiciona comando para lista de símbolos`
- `chore: atualiza arquivos de licença`

## Mudanças normativas

Quando a mudança envolver ABNT ou padrão institucional, registre:

- qual elemento foi alterado;
- qual norma ou decisão motivou a mudança;
- qual impacto visual ou de uso foi esperado;
- quais arquivos foram verificados após a alteração.

## Licença das contribuições

Ao contribuir, você concorda que sua contribuição seja distribuída sob a mesma licença do projeto: LPPL 1.3c ou posterior.

