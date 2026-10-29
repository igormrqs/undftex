# Exemplo didático de Projeto Aplicado

Entrada: `relatorio-projeto-aplicado-exemplo-undf.tex`, na raiz. O exemplo relata
um protótipo de validação de solicitações, com identificação de semestre,
equipe e contribuição individual em cenário fictício.

Os papéis, a turma e o laboratório são fictícios. Os artefatos técnicos foram
produzidos para este exemplo e seus seis casos foram executados: dois retornam
aceitação e quatro recusam entradas por motivos distintos. Não houve pesquisa
com pessoas, uso em laboratório real ou avaliação de impacto institucional.

Na raiz do repositório, com Python 3 disponível:

```powershell
python exemplo/projeto-aplicado/artefatos/validar_reserva.py
```

`artefatos/casos.json` documenta entradas e resultados esperados. O programa
confere o conjunto e interrompe a execução em caso de divergência. O contrato
de entrada é restrito às chaves e tipos do exemplo; não é um serviço de produção.

Compile o documento na raiz:

```powershell
.\scripts\verificar-perfis.ps1 -Documentos relatorio-projeto-aplicado-exemplo-undf.tex
```

Os arquivos para escrever um trabalho real ficam em `modelos/projeto-aplicado/`.
Este documento não exige um artigo e não implementa o portfólio consolidado.
O relatório final do UnDF-TeX foi citado somente como referência de organização.
