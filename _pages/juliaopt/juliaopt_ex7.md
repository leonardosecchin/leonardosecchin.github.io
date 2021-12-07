---
layout: archive
title: "Julia para Otimização - Exemplo 7"
permalink: /juliaopt_ex7/
author_profile: true
---

[<< voltar para "Julia para Otimização"](/juliaopt/)

## Objetivo: resolver modelos de otimização restrita e irrestrita por métodos disponíveis.

Ao longo da disciplina ["Otimização 2"](/otimizacao2/) utilizamos interfaces para pacotes de otimização com restrições. Sempre que disponível, damos preferência à pacotes que leêm estruturas `NLPmodels`, com derivadas automáticas, como nosso `gradiente` do [Exemplo 4](/juliaopt_ex4/).

A seguir listo alguns excelentes pacotes. Alguns possuem interface para `NLPModels`, outros para `JuMP`, e outros para ambas as estruturas.

## Algencan

Algencan é uma implementação do método de Lagrangiano aumentado escrito por E. Birgin e J.M. Martínez. É um *software* livre implementado em Fortran. Uma interface para Julia com leitura de estruturas `NLPmodels` foi escrita por P.J.S. Silva.

- [Página oficial](https://www.ime.usp.br/~egbirgin/tango/codes.php)
- **Interface NLPModels Julia:** pacote [`NLPModelsAlgencan`](https://github.com/pjssilva/NLPModelsAlgencan.jl)

*Obs.: para compilar `NLPModelsAlgencan`, você precisará instalar a biblioteca de álgebra linear BLAS no seu sistema operacional. No Ubuntu, instale os arquivos de desenvolvimento da biblioteca OpenBLAS (pacotes `libopenblas-dev`, `libopenblas-serial-dev`, `libopenblas-openmp-dev`, `libopenblas-pthread-dev`, o que estiverem disponíveis).*

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
- **WORHP:** [site do desenvolvedor](https://worhp.de/) / [interface Julia](https://github.com/freemin7/WorhpOpt.jl)

## Pacote Optim

O pacote `Optim.jl` contém métodos para otimização irrestrita e sobre caixas. Acesse a [página do pacote](https://julianlsolvers.github.io/Optim.jl/).

Dentre os métodos implementados estão:
- [gradientes conjugados de Hager e Zhang](https://doi.org/10.1145/1132973.1132979)
- BFGS e BFGS com memória limitada (L-BFGS),
- método de Newton puro,
- Newton com regiões de confiança,
- pontos interiores para caixas
- e até as metaheurísticas *Simulated Annealing* e *Particle Swarm*.

Veja a [documentação](https://julianlsolvers.github.io/Optim.jl/stable/) para detalhes.

## Outros algoritmos

- **Juniper:** *solver* livre para problemas não lineares com variáveis inteiras implementado em Julia. [site do desenvolvedor](https://github.com/lanl-ansi/Juniper.jl)
- **Alpine:** *solver* global livre para problemas não lineares com variáveis inteiras implementado em Julia. [site do desenvolvedor](https://github.com/lanl-ansi/Alpine.jl)
- A organização *"Computation Infrastructure for Operations Research"* (COIN-OR) possui implementações livres de vários métodos, incluindo o [Simplex](https://github.com/jump-dev/Clp.jl), métodos enumerativos para programação linear interna mista ([*branch-and-cut*](https://github.com/jump-dev/Cbc.jl)), metaheurísticas, métodos para programação não linear geral (Ipopt é um deles), convexa, estocástica, não diferenciável e semi-definida. Veja a [lista de projetos da COIN-OR](https://www.coin-or.org/projects/). É comum cada projeto ter sua interface para Julia. Geralmente as interfaces são para modelos `JuMP`, e os links podem ser acessados no Github de cada projeto.
