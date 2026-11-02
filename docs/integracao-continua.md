# Contrato da integração contínua

O workflow `build` executa `scripts/verificar-ci.ps1` em um único contêiner
TeX Live completo/Debian do ecossistema xu-cheng. PowerShell, Poppler, Git e
Python 3 são instalados explicitamente nesse ambiente. LuaLaTeX, Biber e os
leitores compartilham o mesmo ambiente; as versões efetivas ficam no diagnóstico.
O workflow mantém os eventos push de main/feature/perfis-tcc, pull_request e
workflow_dispatch. A imagem atual pode receber atualizações; mudanças de versão
que alterem contratos devem ser investigadas, não contornadas com tetos de avisos.

## Cobertura obrigatória

| Grupo | Contrato |
| --- | --- |
| Perfis/modelos | 43 ciclos LuaLaTeX → Biber → LuaLaTeX → LuaLaTeX e três controles de uma passagem: 46 documentos |
| Bibliografia | 22 suítes, 604 cenários com leitura de chamadas, referências, ordem, letras, avisos e destinos aplicáveis |
| F01 | 35 casos de nomes e metadados da folha de rosto |
| F02 | Inclusões positivas e negativas, caminho/espaços/ordem, erro obrigatório com e sem halt, propagação pelo verificador e input de artigo |
| Compatibilidade | Nove tipos originalmente herdados; compilar não certifica padronização universal |
| Auditoria | 32 casos originais e dois documentos mínimos, com asserções dos contratos atuais e limites preservados |
| Corpus | Onze bases reais isoladas por refsection, 35 ocorrências de registros; chaves no BBL e títulos/notas materiais no PDF |
| Manuais | Três entradas em três passagens, resolução de referências, sumário e PDF legível; sem fixar quantidade de páginas |
| Integridade adicional | Organização/links/auxiliares Git, artefato Python do Projeto Aplicado e injeções negativas da infraestrutura |

A seleção auditável está em [regressao.json](../tests/regressao.json). O script
confere sua correspondência com os trios bibliográficos permanentes e as contagens
dos JSONs. Arquivos auxiliares e cenários deliberadamente inválidos não são
descobertos indiscriminadamente como documentos compiláveis. Os 54 controles
complementares (9 + 32 + 11 bases + 2 mínimos) são relatados separadamente dos
604 cenários, assim como F01/F02 e as injeções de infraestrutura.

Os testes de auditoria preservam os dados originais. V14 verifica também o eid original após F03-N;
V20 tem title ausente; V32 não certifica todos os elementos complementares.
Asserções desses controles protegem o comportamento delimitado, não eliminam
suas pendências editoriais. As bases do corpus não são corrigidas por inferência.

## Reproduzir

Em checkout sem diretórios de saída anteriores, com PowerShell 7, LuaLaTeX,
BibLaTeX/Biber compatíveis, Poppler (`pdftotext`, `pdftohtml`, `pdfinfo`), Git
e Python 3 disponíveis:

```powershell
pwsh -NoProfile -File ./scripts/verificar-ci.ps1
```

O nome padrão de Python é `python3`; outra instalação pode ser informada com
`-Python python` ou com o caminho do executável. O script recusa `build/perfis`,
`build/integridade`, `build/controles-ci` e as pastas de saída dos manuais já
existentes. Não as apaga automaticamente. Use outro checkout para repetir a
validação integral preservando evidências anteriores. Isso impede que PDFs ou
logs antigos sejam usados como prova de uma execução atual.

Para investigar uma suíte individual, em checkout de trabalho:

```powershell
./scripts/verificar-perfis.ps1 -Documentos @('tests/bibliografia-tradutores.tex')
./scripts/verificar-integridade.ps1 -Caso F02
```

Uma execução individual é **parcial**. Também executa os três controles básicos
e os leitores aplicáveis, mas não equivale ao CI integral. O resumo de perfis
identifica documentos efetivamente produzidos, suítes, cenários avaliados,
aprovados/reprovados e a condição integral/parcial. Saídas esperadas vazias,
fixtures ausentes, contagens divergentes e erros nativos interrompem a execução.
Mesmo em erro, registra os documentos não compilados, suítes não avaliadas e a
causa. Execuções parciais usam `build/perfis/resumo-parcial.json`, preservando o
resumo da execução integral; o teste negativo de F02 também segue essa regra.
Um BBL vazio é aceito somente para documento cujo BCF não contenha nenhuma
citação; os quatro controles sem citações da regressão exercitam essa exceção.

## Erros esperados e Biber

F02 aceita a falha deliberada somente com retorno de erro e mensagem da causa
esperada. Sucesso indevido ou erro de outra causa reprovam o teste. As injeções
de infraestrutura usam uma cópia descartável; incluem ausência de fixture e
saída, cenário reprovado, BCF inválido processado pelo Biber real, contagem errada,
campo indevido, negativo sem falha/causa errada e propagação de exit code.
Também substituem um aviso mantendo a mesma quantidade, para demonstrar que o
guarda confere o conteúdo e não somente um total ou teto.

A validação `biber --validate-datamodel` é obrigatória nas suítes acadêmica,
periódicos integrais, patentes, tradutores e localizadores. O contrato
[avisos-biber.json](../tests/avisos-biber.json) registra mensagens por tipo/chave,
categoria e multiplicidade. Atualmente são 10/18/14/44/34 avisos, respectivamente;
não são uma soma de defeitos independentes. Há ausências intencionais/editoriais,
identificadores sintéticos e limites de schema nos controles de outros gêneros.
Erro de execução, saída incompleta, aviso novo, remoção ou substituição de aviso
sem revisão explícita reprovam. Não se ignoram todos os warnings nem se inventam
autores/campos para eliminá-los. Os demais avisos editoriais do estilo continuam
sujeitos às asserções existentes e à revisão das fontes.

## Evidência local e homologação remota

`build/perfis/resumo.json` contém as métricas da regressão bibliográfica.
`build/ci/resumo.json` lista os grupos concluídos e não executados; em erro,
`completo` permanece false e a causa é registrada. Os resultados por cenário,
categorias de avisos e injeções negativas complementam o resumo. O job preserva
diagnósticos como artefato; não publica/substitui PDFs oficiais.

A aprovação local é a execução integral sem erro, com todos os grupos concluídos.
A homologação remota exige um run real de `build` no **mesmo SHA** publicado
posteriormente por ação autorizada do mantenedor. Depois disso, abra Actions,
selecione build e a branch desejada (ou examine o run do push/PR), confira SHA,
status, resumo e artefato `verificacao-ci`. Não basta um workflow estar configurado.
Sem push autorizado, a situação é “implementada e validada localmente, com
homologação remota pendente”.

Comparação de PDFs entre commits, coordenadas, quebras visuais e revisão normativa
continuam procedimentos de auditoria local: o CI não tem baseline visual
versionada e não afirma executá-los. F06/F07 e F04/F05 permanecem separados.
Os nomes atuais dos 46 documentos são distintos; a execução é sequencial e
mantém os diretórios já suportados. Não houve correção global de nomes ou do
mecanismo de distribuição. O CI não certifica conformidade integral ABNT.
