---
layout: archive
title: "Julia para Otimização"
permalink: /juliaopt/
author_profile: true
---

Nesta página você encontrará exercícios simples para iniciar a escrita e resolução de problemas de otimização em Julia. Não é um tutorial completo sobre, e poderá ser expandido ao longo do curso. Evidentemente, há muito material na internet que você pode acessar.


# Pré-requisitos

- Antes de fazer os exercícios, leia atentamente o [tutorial de instalação](/julia/) do Julia. **Sugiro usar as dicas descritas na seção "Dicas" deste link.**

Pacotes utilizados nos exercícios:
- Escrita dos modelos de otimização: `JuMP`. Documentação completa [aqui](https://jump.dev/JuMP.jl/stable/).
- Modelos de otimização com derivadas automáticas: `NLPModels`, `NLPModelsJuMP`. Como avaliar funções e suas derivadas, veja [este link](https://github.com/JuliaSmoothOptimizers/NLPModels.jl).
- Armazenamento de matrizes esparsas: `SparseArrays`.


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



# Exercício 3

**Objetivo:** carregar e executar códigos salvos em arquivos.

Os códigos em Julia, assim como Matlab/Octave, podem ser escritos em arquivos. A extensão padrão é `.jl`.

Para este exercício, salve o arquivo `juliaoptex3.jl` ([link](/files/juliaoptex3.jl)) no diretório que desejar.

Execute o Julia do diretório que escolheu. Se preferir, você pode navegar entre diretórios através de comandos do terminal Linux (veja "Dicas" [aqui](/julia/)), teclando `;` (ponto e vírgula) para abrir um "ambiente de *shell*".

Importe o arquivo para o Julia:
~~~
julia> include("juliaoptex3.jl");
~~~
*Obs.: caso não esteja no diretório do arquivo, você pode incluí-lo passando seu caminho. Por exemplo, `include("dir/juliaoptex3.jl");`.*

No arquivo `juliaoptex3.jl` há duas funções definidas e a variável `a` setada. Você pode executar:
~~~
julia> a
~~~
~~~
julia> msg(123)
~~~
~~~
julia> soma(5,8)
~~~

Você pode definir várias funções, variáveis e objetos em um ou mais arquivos. Você deverá incluir cada arquivo que criar. **Abra o arquivo `juliaoptex3.jl` e veja como ele foi feito.**



# Exercício 4

**Objetivo:** implementar um método simples de gradiente.


# Exercício 5

**Objetivo:** escrever um modelo de otimização com restrições.


# Exercício 6

**Objetivo:** resolver modelos de otimização restrita e irrestrita por métodos disponíveis.


# Exercício 7

**Objetivo:** acessar bibliotecas de problemas-teste usadas na literatura.

