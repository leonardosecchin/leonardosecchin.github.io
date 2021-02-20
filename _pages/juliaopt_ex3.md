---
layout: archive
title: "Julia para Otimização"
permalink: /juliaopt_ex3/
author_profile: true
---

# Exercício 3

**Objetivo:** carregar e executar códigos salvos em arquivos.

Os códigos em Julia, assim como Matlab/Octave, podem ser escritos em arquivos. A extensão padrão é `.jl`.

Para este exercício, salve o arquivo `juliaoptex3.jl` ([link](/files/julia/juliaoptex3.jl)) no diretório que desejar.

Execute o Julia do diretório que escolheu. Se preferir, você pode navegar entre diretórios através de comandos do terminal Linux (veja "Dicas" [aqui](/julia/)), teclando `;` (ponto e vírgula) para abrir um "ambiente de *shell*".

Importe o arquivo para o Julia:
~~~
julia> include("juliaoptex3.jl");
~~~
*Obs.: caso não esteja no diretório do arquivo, você pode incluí-lo passando seu caminho. Por exemplo, `include("dir/juliaoptex3.jl");`.*

No arquivo `juliaoptex3.jl` há duas funções definidas e a variável `a` setada. Você pode executar:
~~~
julia> a
julia> msg(123)
julia> soma(5,8)
~~~

Você pode definir várias funções, variáveis e objetos em um ou mais arquivos. Você deverá incluir cada arquivo que criar. **Abra o arquivo `juliaoptex3.jl` e veja como ele foi feito.**
