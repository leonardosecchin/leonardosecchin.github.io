---
layout: archive
title: "Bancos de problemas-teste e interfaces para Julia"
permalink: /juliaopt_problems/
author_profile: true
---

Esta página reúne fontes de problemas-teste para otimização contínua, otimização combinatória, programação linear inteira mista e outros. A ênfase é nas fontes que possuem interface para Julia desenvolvidas pela comunidade científica. Cada interface possue uma forma específica de leitura dos problemas, consulte a página/documentação de cada pacote. Em geral, o uso dessas interfaces no Julia é bastante simples.


## Otimização contínua (em geral, problemas não lineares)

- CUTEst (*Constrained and Unconstrained Testing Environment with safe threads*): [`CUTEst.jl`](https://github.com/JuliaSmoothOptimizers/CUTEst.jl). Inclui problemas-teste lineares da [NETLIB](https://www.netlib.org/). Veja [este link](/juliaopt_ex8/) para uso
- Problemas de quadrados mínimos não lineares de [Moré, Garbow e Hillstrom (1981)](https://doi.org/10.1145/355934.355936): [`NLSModels.jl`](https://github.com/JuliaSmoothOptimizers/NLSProblems.jl)
- Problemas irrestritos: [`OptimizationProblems.jl`](https://github.com/JuliaSmoothOptimizers/OptimizationProblems.jl)


## Programação linear inteira mista e otimização combinatória

- Problema do caixeiro viajante (*Traveling Salesman Problem*): [`TSPLIB.jl`](https://github.com/matago/TSPLIB.jl)
- Problemas de localização de facilidades (*Facility Location Problems*): [`FacilityLocationProblems.jl`](https://github.com/rafaelmartinelli/FacilityLocationProblems.jl)
- Problema de alocação generalizado (*Generalized Assignmnent Problem*): [`AssignmentProblems.jl`](https://github.com/rafaelmartinelli/AssignmentProblems.jl)
- Problema de empacotamento (*Bin Packing Problem*): [`BPPLib.jl`](https://github.com/rafaelmartinelli/BPPLib.jl)
- *Capacitated Lot Sizing Problem*: [`LotSizingProblems.jl`](https://github.com/rafaelmartinelli/LotSizingProblems.jl)
- *Multi-Depot Vechile Scheduling Problem*: [`MDVSP.jl`](https://github.com/rafaelmartinelli/MDVSP.jl)
- Problema de roteamento de veículos capacitado (*Capacitated Vehicle Routing Problem*): [`CVRPLIB.jl`](https://github.com/chkwon/CVRPLIB.jl)
- *Inventory Routing Problem*: [`InventoryRoutingProblems.jl`](https://github.com/rafaelmartinelli/InventoryRoutingProblems.jl)
- *Capacitated Arc Routing Problem*: [`CARPData.jl`](https://github.com/rafaelmartinelli/CARPData.jl)

## Banco de matrizes

- Matrizes esparsas da [Suite Sparse Matrix Collection](https://sparse.tamu.edu/): [`MatrixDepot.jl`](https://github.com/JuliaMatrices/MatrixDepot.jl) ou [`SuiteSparseMatrixCollection.jl`](https://github.com/JuliaSmoothOptimizers/SuiteSparseMatrixCollection.jl). Veja [este link](/juliaopt_ex8/) para uso


## Conjuntos de dados para aprendizado de máquina

- [`MLDatasets.jl`](https://github.com/JuliaML/MLDatasets.jl)


## Formatos específicos

- Leitura de arquivos [AMPL](https://ampl.com/) (`.nl`): [`AmplNLReader.jl`](https://github.com/JuliaSmoothOptimizers/AmplNLReader.jl)
- Leitura de arquivos `MPS` e `QPS` (programação linear e quadrática): [`QPSReader.jl`](https://github.com/JuliaSmoothOptimizers/QPSReader.jl)


## Fontes sem interface para Julia

- [Página com links para várias bibliotecas](http://people.brunel.ac.uk/~mastjjb/jeb/info.html)
- [Problemas com restrições de equilíbrio/complementaridade](https://wiki.mcs.anl.gov/leyffer/index.php/MacMPEC)