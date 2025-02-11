---
layout: archive
title: "Julia para Otimização - Exemplo 3"
permalink: /juliaopt_ex3/
author_profile: true
---

[<< voltar para "Julia para Otimização"](/juliaopt/)

## Objetivo: carregar e executar códigos salvos em arquivos.

Os códigos em Julia, assim como Matlab/Octave, podem ser escritos em arquivos. A extensão padrão é `.jl`.

Para este exemplo, salve o arquivo `juliaoptex3.jl` ([link](/files/julia/juliaoptex3.jl)) no diretório que desejar.

Execute o Julia do diretório que escolheu.

Importe o arquivo para o Julia:
~~~
julia> include("juliaoptex3.jl");
~~~
*Obs.: caso não esteja no diretório do arquivo, você pode incluí-lo passando seu caminho. Por exemplo, `include("dir/juliaoptex3.jl");`. Você pode também navegar entre diretórios através de comandos do ambiente de shell (veja "Dicas" [aqui](/julia/)).*

No arquivo `juliaoptex3.jl` há duas funções definidas e a variável `a` atribuída. Você pode executar e ver o resultado:
~~~
julia> a
julia> msg(123)
julia> soma(5,8)
~~~

**Abra o arquivo `juliaoptex3.jl` e veja como ele foi feito.**

Pode-se definir várias funções, variáveis e objetos em um ou mais arquivos. Neste caso, você pode incluir cada arquivo que criar com o comando `include`, como exemplificado acima.
