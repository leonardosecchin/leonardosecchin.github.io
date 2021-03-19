---
layout: archive
title: "Julia para Otimização - Exemplo 7"
permalink: /juliaopt_ex7/
author_profile: true
---

[<< voltar para "Julia para Otimização"](/juliaopt/)

## Objetivo: resolver modelos de otimização restrita e irrestrita por métodos disponíveis.

Ao longo da disciplina ["Otimização 2"](/otimizacao2/) utilizamos interfaces para pacotes de otimização com restrições. Sempre que disponível, damos preferência à pacotes que leêm estruturas `NLPmodels`, com derivadas automáticas, como nosso `gradiente` do [Exemplo 4](/juliaopt_ex4/).

A seguir listo alguns excelentes pacotes.

## Algencan

Algencan é uma implementação do método de Lagrangiano aumentado escrito por E. Birgin e J.M. Martínez. É um *software* livre implementado em Fortran. Uma interface para Julia com leitura de estruturas `NLPmodels` foi escrita por P.J.S. Silva.

- [Página oficial](https://www.ime.usp.br/~egbirgin/tango/codes.php)
- **Interface NLPModels Julia:** pacote [`NLPModelsAlgencan`](https://github.com/pjssilva/NLPModelsAlgencan.jl)

*Obs.: para compilar `NLPModelsAlgencan`, você precisará instalar a biblioteca de álgebra linear BLAS no seu sistema operacional. No Ubuntu, instale o pacote `libopenblas-dev`.*

## Ipopt - *Interior Point Optimizer*

Ipopt é uma implementação do método de pontos interiores, isto é, uma estratégia de penalização interna com barreira logarítmica e Newton nos subproblemas. É um *software* livre implementado em C++. É mantido pela organização *"Computation Infrastructure for Operations Research"* ([COIN-OR](https://www.coin-or.org/)).

- [Documentação oficial](https://coin-or.github.io/Ipopt/)
- **Interface NLPModels Julia:** pacote [`NLPModelsIpopt`](https://github.com/JuliaSmoothOptimizers/NLPModelsIpopt.jl)

## Interfaces para *softwares* proprietários

Existem interfaces para *softwares* proprietários. Neste caso você precisará obter o *software* e licença de uso de forma independente. Alguns pacotes são feitos para lidar apenas com modelos em **JuMP** (i.e., não usam NLPModels). Consulte a documentação do pacote para detalhes de uso.

- **Gurobi:** [site do desenvolvedor](https://www.gurobi.com/) / [interface Julia](https://github.com/jump-dev/Gurobi.jl)
- **IBM Cplex:** [site do desenvolvedor](https://www.ibm.com/products/ilog-cplex-optimization-studio) / [interface Julia](https://github.com/jump-dev/CPLEX.jl)
- **Xpress:** [site do desenvolvedor](https://www.fico.com/en/products/fico-xpress-optimization) / [interface Julia](https://github.com/jump-dev/Xpress.jl)
- **Mosek:** [site do desenvolvedor](https://www.mosek.com/) / [interface Julia](https://github.com/jump-dev/MosekTools.jl)
- **Knitro:** [site do desenvolvedor](https://www.artelys.com/knitro) / [interface Julia](https://github.com/jump-dev/KNITRO.jl) / [interface NLPModels Julia](https://github.com/JuliaSmoothOptimizers/NLPModelsKnitro.jl)

## Outros algoritmos

- A organização *"Computation Infrastructure for Operations Research"* (COIN-OR) possui implementações livres de vários métodos, incluindo métodos enumerativos para programação linear interna mista (*branch-and-cut*), metaheurísticas, métodos para programação não linear, convexa, estocástica e semi-definida. Veja a [lista de projetos da COIN-OR](https://www.coin-or.org/projects/). É comum cada projeto ter sua interface para Julia. Geralmente as interfaces são para modelos `JuMP`, e os links podem ser acessados no Github de cada projeto.
