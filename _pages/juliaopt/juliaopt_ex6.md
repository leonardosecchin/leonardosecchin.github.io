---
layout: archive
title: "Julia para Otimização - Exemplo 6"
permalink: /juliaopt_ex6/
author_profile: true
---

[<< voltar para "Julia para Otimização"](/juliaopt/)

## Objetivo: escrever um modelo de otimização com restrições.

Considere o problema com restrições

$$
\begin{align*}
\min_x \, & (x_1-2)^2 + (x_2-1)^2\\
\text{s.a. } & x_1 + x_2 - 2\leq 0\\
&x_1^2-x_2\leq 0
\end{align*}
$$

*Este problema pode ser encontrado no livro de Karas e Ribeiro, ou no slide 2 [deste link](/files/otim1/5.Otimizacao_com_restricoes-KKT.pdf).*

Siga as instruções do [Exemplo 1](/juliaopt_ex1/) para criar o modelo, variáveis e função objetivo.

**Antes de criar a estrutura `MathOptNLPModel`**, você deve adicionar as restrições ao modelo `P`.

Adicionando a restrição linear:
~~~
julia> @constraint(P, x[1] + x[2] - 2 <= 0)
~~~

Adicionando a restrição não linear:
~~~
julia> @NLconstraint(P, x[1]^2 - x[2] <= 0)
~~~

Exibindo o modelo construído e transformando-o para **NLPModels**:
~~~
julia> println(P)
julia> nlp = MathOptNLPModel(P)
~~~

A estrutura `nlp.meta` contém propriedades do problema. Por exemplo, `nlp.meta.nvar` e `nlp.meta.ifree` contém o número de variáveis e o vetor de índices das variáveis livres, respectivamente. Consulte a [página do pacote NLPModels](https://github.com/JuliaSmoothOptimizers/NLPModels.jl) para uma descrição de todas as opções.