# Exemplo de relatório parcial — P01

Compile [relatorio-projeto-aplicado-exemplo-undf.tex](../../relatorio-projeto-aplicado-exemplo-undf.tex).
O documento registra a memória de um validador de solicitações de reserva.
Semestre, participantes e contexto acadêmico são fictícios; programa e casos
acompanham o exemplo. O registro não representa acompanhamento obrigatório,
avaliação institucional ou relatório final de TCC.

Na abertura, o campo GitHub aponta para o acervo existente do UnDF-TeX.
O commit `685e69e` preserva a versão dos artefatos demonstrados; não é um
repositório de uma equipe real. Em seu registro, substitua esses campos pelo
repositório e pela versão do seu próprio projeto, com README e acesso documentado.

Os identificadores P01-E01 (programa), P01-E02 (entradas) e P01-E03 (saída
reproduzível) reaparecem no [exemplo de portfólio](../portfolio/README.md).
Na raiz do repositório, execute com Python 3:

```powershell
python exemplo/projeto-aplicado/artefatos/validar_reserva.py
```

Os seis casos verificam duas aceitações e quatro recusas distintas. A aceitação
indica apenas atendimento às regras implementadas; não comprova implantação,
reserva real, disponibilidade ou impacto. Os resultados não devem ser
transplantados para um trabalho real.

Use [o modelo preenchível](../../modelos/projeto-aplicado/README.md) para seu
registro. As dúvidas e limitações preservadas aqui subsidiam a análise final.
