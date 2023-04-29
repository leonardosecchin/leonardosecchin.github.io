---
layout: archive
title: "Julia para Otimização - Exemplo 4"
permalink: /juliaopt_ex4/
author_profile: true
---

[<< voltar para "Julia para Otimização"](/juliaopt/)

## Objetivo: Resolver problemas com um método de gradiente.

Salve o arquivo [gradiente.jl](/files/julia/gradiente.jl). Ele contém uma implementação do método do gradiente para minimização irrestrita, conforme visto na disciplina ["Otimização 1"](/otimizacao1). Você pode ver uma descrição completa do método [neste link](https://leonardosecchin.github.io/files/otim1/4.3.Convergencia_metodos_descida.pdf). Caso você não saiba do que se trata, atente apenas à forma de aplicar o algoritmo.

Para uma descrição do uso do algorimo, execute, da pasta em que salvou `gradiente.jl`:
~~~
julia> include("gradiente.jl")
julia> ?gradiente
~~~

Após estudar e ler as instruções de execução, faça:
- Resolva o problema do [Exemplo 1](/juliaopt_ex1) partindo do ponto inicial $x_0=(1,1)$;
- Resolva o problema do [Exemplo 2](/juliaopt_ex2) ignorando os limitantes das variáveis.
