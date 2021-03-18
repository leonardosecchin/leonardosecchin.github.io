---
layout: archive
title: "Julia para Otimização - Exemplo 2"
permalink: /juliaopt_ex2/
author_profile: true
---

## Objetivo: escrever um modelo de otimização a partir de variáveis do ambiente.

Vamos escrever o modelo

$$
\begin{align*}
\min_x & \, \sum_{i=1}^m (x_i-5)^2 + \sum_{i=1}^{m-1} (x_{i+1} - x_i)^3\\
\text{s.a.} \ & 1\leq x_i\leq 4, \quad i=1,\ldots,m
\end{align*}
$$

onde $m\geq 2$ é uma variável definida no ambiente do Julia. <!--Vamos fixar ainda o ponto inicial $x^0=(1,\ldots,1)$.-->

Definindo um valor para `m` (pode ser qualquer):
~~~
julia> m = 10
~~~

Carregando pacotes necessários:
~~~
julia> using JuMP, NLPModels, NLPModelsJuMP
~~~

Iniciando o modelo:
~~~
julia> P = Model()
~~~

Criando as variáveis $x_1,\ldots,x_m$:
~~~
julia> @variable(P, 1 <= x[1:m] <= 4)
~~~

Definindo a função objetivo:
~~~
julia> @NLobjective(P, Min, sum((x[i]-1)^2 for i in 1:m) + sum((x[i+1]-x[i])^3 for i in 1:m-1) )
~~~

Exibindo o modelo construído (opcional):
~~~
julia> println(P)
~~~

Transformando para o formato *NLPModels*:
~~~
julia> nlp = MathOptNLPModel(P)
~~~

## Outros comandos (antes de usar *MathOptNLPModel*)

- você pode mudar os limitantes de uma variável após ela ser inserida em `P`. Por exemplo, `set_lower_bound(x[5], 2)` faz $x_{5}\geq 2$, enquanto que `set_upper_bound(x[5], 3)` faz $x_5\leq 3$.

- você pode dizer a um método o valor inicial de uma variável. Por exemplo, para setar o valor inicial de $x_1$ como $3.5$, execute `set_start_value(x[1], 3.5)`. Após, verifique isso lendo o valor de $x_1$: `start_value(x[1])`.

- Você pode setar valores iniciais na criação das variáveis. Por exemplo, `@variable(P, 1 <= x[1:m] <= 4, start=1)` criará as $m$ variáveis, todas com valor inicial $1$.
