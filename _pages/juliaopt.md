---
layout: archive
title: "Julia para Otimização"
permalink: /juliaopt/
author_profile: true
---

Nesta página você encontrará exercícios simples para iniciar a escrita e resolução de problemas de otimização em Julia. Não é um tutorial completo sobre, e poderá ser expandido ao longo do curso. Evidentemente, há muito material na internet que você pode acessar.

# Pré-requisitos

- Antes de fazer os exercícios, leia atentamente o [tutorial de instalação](julia) do Julia.
- **IMPORTANTE: as linhas iniciando com `julia>` são comandos executados dentro do ambiente Julia. Lembre-se que Julia diferencia maiúsculas e minúsculas.**
- Para excluir objetos da memória na mesma sessão de Julia, basta setá-los como `Nothing`. Por exemplo, se `P` foi definido e quer limpá-lo,
~~~
julia> P = Nothing
~~~

Os seguintes pacotes serão usados e deverão ser instalados em seu Julia:
- Escrita dos modelos de otimização: `JuMP`. Documentação completa [aqui](https://jump.dev/JuMP.jl/stable/).
- Modelos de otimização com derivadas automáticas: `NLPModels`, `NLPModelsJuMP`.


# Exercício 1

**Objetivo:** escrever um modelo simples de otimização irrestrita.

Vamos escrever o problema de duas variáveis

$$
\min_x x_1^2 + x_2^2
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


# Exercício 2

**Objetivo:** escrever um modelo de otimização a partir de variáveis do ambiente.

Vamos escrever o modelo

$$
\begin{align*}
\min_x & \, \sum_{i=1}^m (x_i-5)^2 + \sum_{i=1}^{m-1} (x_{i+1} - x_i)^3\\
\text{s.a.} \ & 0\leq x_i\leq 4, \ i=1,\ldots,m
\end{align*}
$$

onde $m\geq 2$ é uma variável definida no ambiente do Julia. Vamos fixar ainda o ponto inicial $x^0=(1,\ldots,1)$.

Definindo um valor para `m` (pode definir outro valor):
~~~
julia> m = 100
~~~

Carregando pacotes necessários:
~~~
julia> using JuMP, NLPModels, NLPModelsJuMP
~~~

Iniciando o modelo:
~~~
julia> P = Model()
~~~

Criando as variáveis $x_1,\ldots,x_m$, todas com valores iniciais 1:
~~~
julia> @variable(P, x[1:m], )
~~~

Definindo a função objetivo e o sentido de otimização "minimizar":
~~~
julia> @NLobjective(P, Min, )
~~~
*Obs: caso a FO for linear, use o comando `@objective`*

Exibindo o modelo construído (opcional):
~~~
julia> println(P)
~~~

Transformando o modelo `P` para o formato *NLPModels*:
~~~
julia> nlp = MathOptNLPModel(P)
~~~




# Exercício 3

**Objetivo:** executar códigos salvos em arquivos.


# Exercício 4

**Objetivo:** implementar um método simples de gradiente.


# Exercício 5

**Objetivo:** escrever um modelo de otimização rrestrita.


# Exercício 6

**Objetivo:** resolver modelos de otimização restrita e irrestrita por métodos disponíveis.


# Exercício 7

**Objetivo:** acessar bibliotecas de problemas-teste usadas na literatura.

