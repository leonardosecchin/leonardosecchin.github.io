---
layout: archive
title: "Julia para Otimização - Exemplo 10"
permalink: /juliaopt_ex10/
author_profile: true
---

[<< voltar para "Julia para Otimização"](/juliaopt/)

## Objetivo: executar códigos fora do ambiente Julia.

É possível executar um código Julia a partir do terminal do sistema, sem entrar no Julia. Isso é útil quando queremos rodar testes longos em uma máquina remota, permitindo que os deixemos executando mesmo após deslogar.

Por exemplo, para rodar o código `roda.jl` basta executar, a partir do terminal do sistema,
~~~
> julia roda.jl
~~~

É importante que no arquivo `roda.jl` incluamos todos os pacotes e arquivos necessários para a execução. Por exemplo, para rodar os testes do [Exemplo 9](/juliaopt_ex9/), o arquivo `roda.jl` deverá conter as linhas
~~~
include("testesSIF.jl")
testesSIF()
~~~

A primeira linha include o arquivo `testesSIF.jl` (que consideramos estar no mesmo diretório que `roda.jl`), e a segunda linha invoca a função `testesSIF()` definida neste arquivo. Ou seja, o arquivo `roda.jl` deve conter exatamente os comandos que faríamos dentro do ambiente Julia, em ordem.

Ao término da execução, toda a memória alocada para as estruturas do Julia é liberada.
