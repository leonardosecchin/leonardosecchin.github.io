---
layout: archive
title: "Julia para Otimização - Exemplo 1"
permalink: /juliaopt_ex1/
author_profile: true
---

[<< voltar para "Julia para Otimização"](/juliaopt/)

## Objetivo: escrever um modelo simples de otimização irrestrita.

Vamos escrever o problema de duas variáveis

$$
\begin{equation*}
\min_x x_1^2 + x_2^2
\end{equation*}
$$

Carregando pacotes necessários:
~~~
julia> using JuMP, NLPModels, NLPModelsJuMP
~~~

Iniciando o modelo de nome `P`:
~~~
julia> P = Model()
~~~

Criando as variáveis $x_1$ e $x_2$ no modelo `P`:
~~~
julia> @variable(P, x[1:2])
~~~

Definindo a função objetivo em `P` e o sentido de otimização "minimizar":
~~~
julia> @NLobjective(P, Min, x[1]^2 + x[2]^2)
~~~
*Obs: caso a FO for linear, use o comando `@objective`*

Exibindo o modelo `P` construído:
~~~
julia> println(P)
~~~

Transformando o modelo `P` para o formato *NLPModels*:
~~~
julia> nlp = MathOptNLPModel(P)
~~~

O modelo `nlp` está pronto para ser resolvido pelos métodos! A estrutura `nlp` fornece as derivadas de 1a e 2a ordens aos métodos sem a necessidade de calculá-las.
