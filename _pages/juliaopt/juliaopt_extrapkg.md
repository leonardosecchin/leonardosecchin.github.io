---
layout: archive
title: "Pacotes interessantes (avançado)"
permalink: /juliaopt_extrapkg/
author_profile: true
---

- [`BenchmarkTools.jl`](https://github.com/JuliaCI/BenchmarkTools.jl)  
   Pacote para contagem precisa de tempo de CPU e gasto de memória de um trecho de código. Útil quando queremos saber qual dentre diferentes maneiras de fazer uma mesma conta é mais eficiente. É a opção recomendável frente à diretiva `@time`.

- [`GFlops.jl`](https://github.com/triscale-innov/GFlops.jl)  
   Conta o número de operações de ponto flutuante (operações básicas com números tipo `Float`) em um trecho de código.

- [`MKL.jl`](https://github.com/JuliaLinearAlgebra/MKL.jl)  
   Interface para a BLAS da Intel voltada aos seus processadores. É necessário ter instalada a [*Math Kernel Library* (MKL)](https://software.intel.com/content/www/us/en/develop/tools/oneapi/components/onemkl.html) da Intel no sistema. Ao carregar a interface, a BLAS da MKL é acionada em comandos do pacote `LinearAlgebra.jl` voltados para operações matriciais de alto desempenho (como `dot` e `mul!`), em substituição à implementação BLAS padrão do sistema (usualmente, OpenBLAS).

- [`Quadmath.jl`](https://github.com/JuliaMath/Quadmath.jl)  
   Interface para a biblioteca de sistema `libquadmath`, que implementa o tipo numérico de ponto flutuante de 128 bits `Float128`. Útil quando é imperativo realizar contas com precisão acima da dupla (64 bits).