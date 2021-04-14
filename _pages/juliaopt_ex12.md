---
layout: archive
title: "Julia para Otimização - Exemplo 12"
permalink: /juliaopt_ex12/
author_profile: true
---

[<< voltar para "Julia para Otimização"](/juliaopt/)

## Objetivo: tabelar resultados usando DataFrames.

Vimos no [Exemplo 9](/juliaopt_ex9/) como escrever uma tabela de resultados em arquivo TXT. Essa forma rústica assemelha-se à estratégia comumente adotada em programas C ou Fortran. Porém, o Julia oferece um recurso mais inteligente para lidar com dados tabelados: o objeto **DataFrame**. Este recurso está presente no pacote `DataFrames.jl`. Consulte a [página do pacote](github.com/JuliaData/DataFrames.jl).

Basicamente, um *Dataframe* é uma tabela com recursos de adição e exclusão de linhas e colunas, ordenamento e filtragem de linhas. Além disso, é possível exportar um *DataFrame* para arquivos CSV ou mesmo salvar em arquivos binários. Veja o [Exemplo 11](/juliaopt_ex11/) para detalhes.

EXEMPLOS EM BREVE...