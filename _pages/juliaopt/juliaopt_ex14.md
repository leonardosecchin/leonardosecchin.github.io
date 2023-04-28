---
layout: archive
title: "Julia para Otimização - Exemplo 14"
permalink: /juliaopt_ex14/
author_profile: true
---

[<< voltar para "Julia para Otimização"](/juliaopt/)

## Objetivo: calcular tempos de execução.

No Julia é fácil calcular o tempo de execução de um trecho de código. Quem é familharizado com Matlab deve conhecer os comandos `tic`/`toc`, que "marcam" o tempo inicial, final e depois retornam a diferença. Apesar de ser possível fazer algo semelhante no Julia com o comando `time()`, **essa estratégia é considerada obsoleta pois não computa o tempo com precisão, e portanto DEVE SER EVITADA**. Uma maneira mais adequada de computar tempo de execução é usando as diretivas `@time` ou `@elapsed`.

Por exemplo, para imprimir na tela o tempo de execução da chamada de `algoritmo()`, basta fazer
~~~
julia> @time algoritmo()
~~~

A diretiva `@elapsed` permite gravar o tempo de CPU em uma variável e a saída do algoritmo em outra(s) variável(is). Por isso é indicada para tabelar resultados. O trecho a seguir grava o tempo de CPU em `tempo` e a saída do algoritmo em `resultado`:
~~~
julia> tempo = @elapsed resultado = algoritmo()
~~~
Este trecho tem o mesmo efeito de `time()`, mas com tempo de CPU preciso.


**Exercício**

No [Exemplo 9](/juliaopt_ex9/), ajuste o arquivo `testesSIF.jl` para tabelar os tempos de execução das chamadas de `gradiente_interp` usando `@elapsed`, mantendo a saída do algoritmo. Grave os resultados em um **DataFrame**, como explicado no [Exemplo 12](/juliaopt_ex12/), adicionando uma coluna para o tempo de CPU.
