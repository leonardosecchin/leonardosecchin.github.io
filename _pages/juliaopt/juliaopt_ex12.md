---
layout: archive
title: "Julia para Otimização - Exemplo 12"
permalink: /juliaopt_ex12/
author_profile: true
---

[<< voltar para "Julia para Otimização"](/juliaopt/)

## Objetivo: tabelar resultados usando DataFrames.

Vimos no [Exemplo 9](/juliaopt_ex9/) como escrever uma tabela de resultados em arquivo TXT. Essa forma rústica assemelha-se à estratégia comumente adotada em programas C ou Fortran. Porém, o Julia oferece um recurso mais inteligente para lidar com dados tabelados: o objeto **DataFrame**. Este recurso está presente no pacote `DataFrames.jl`, e é muito parecido com o `pandas` do Python. Consulte a [página do pacote](github.com/JuliaData/DataFrames.jl).

Basicamente, um *dataframe* é uma tabela com recursos de adição e exclusão de linhas e colunas, ordenamento e filtragem de linhas. Além disso, é possível exportar um *dataframe* para arquivos CSV ou mesmo salvar em arquivos binários. Veja o [Exemplo 11](/juliaopt_ex11/) para detalhes.

Criando o *dataframe* vazio chamado `resultados`, com as colunas **Problema**, **iter** e **f**:
~~~
julia> using DataFrames
julia> resultados = DataFrame(Problema=[],iter=[],f=[])
~~~

O comando `push!` (não esqueça da exclamação) adiciona linhas:
~~~
julia> push!(resultados, ("prob1", 13, 1.0e-5) )
julia> texto = "prob2"
julia> it = 213
julia> f = 9.5e+6
julia> push!(resultados, (texto, it, f) )
julia> push!(resultados, ("outra linha", it*2, f/2) )
~~~
Note que os dados têm tipos diferentes (texto, inteiro, float). Um *dataframe* aceita qualquer tipo de dado texto ou numérico.

Ao exibir o *dataframe* `resultados`, você verá algo como
~~~
julia> resultados
3×3 DataFrame
│ Row │ Problema    │ iter │ f      │
│     │ Any         │ Any  │ Any    │
├─────┼─────────────┼──────┼────────┤
│ 1   │ prob1       │ 13   │ 1.0e-5 │
│ 2   │ prob2       │ 213  │ 9.5e6  │
│ 3   │ outra linha │ 426  │ 4.75e6 │
~~~

Os comandos `head(resultados,N)` (ou `first`) e `tail(resultados,N)` (ou `last`) exibem os **N** primeiros e últimos registros, respectivamente.

Você pode deletar linhas. O código a seguir deleta a segunda linha de `resultados`:
~~~
julia> delete!(resultados, 2)
~~~

O trecho a seguir organiza `resultados` pela 3 coluna em ordem crescente, **gravando o resultado no próprio dataframe**:
~~~
julia> sort!(resultados, 3)
~~~

Você pode ainda exibir um *dataframe* resultante de uma busca. O trecho a seguir exibe o *dataframe* cujas linhas são aquelas de `resultados` com coluna `iter` menor que 400:
~~~
julia> filter(row -> row[:iter] < 400, resultados)
~~~
O mesmo efeito é obtido com `resultados[(resultados["iter"] .< 400),:]` ou `resultados[(resultados.iter .< 400),:]`.

**Obs:** a exclamação significa que o resultado do comando é gravado no próprio *dataframe*. Os comandos `push!` e `delete!` necessitam da exclamação pois gravam no *dataframe*. Já nos comandos `sort` e `filter`, a exclamação é opcional. Se não estiver presente, o resultado é mostrado em tela, mas o *dataframe* original não é modificado. Isso é útil quando você quer copiar um *dataframe* mantendo o original.

Finalmente, você pode gravar o *dataframe* em arquivo CSV:
~~~
julia> using CSV
julia> CSV.write("resultados.csv", resultados)
~~~

**Exercício**

No [Exemplo 9](/juliaopt_ex9/), refaça o arquivo `testesSIF.jl` eliminando todas as saídas tabeladas em TXT, gravando-as em um **DataFrame**. Grave o resultado em arquivos CSV e binário.
