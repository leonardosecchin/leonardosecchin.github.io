---
layout: archive
title: "Julia para Otimização - Exemplo 11"
permalink: /juliaopt_ex11/
author_profile: true
---

[<< voltar para "Julia para Otimização"](/juliaopt/)

## Objetivo: salvar objetos em arquivos.

Às vezes é útil gravarmos objetos definidos no ambiente Julia em arquivo a fim de carregá-los em execuções futuras do Julia.

O Julia oferece uma forma de guardar quaisquer tipos de dados (vetores, matrizes, dicionários etc) em arquivos binários genéricos. Isso é feito com o pacote `JLD2`. O trecho a seguir define um vetor `v`, uma matriz `A` e um dicionário `preco`, e grava no arquivo `dados.jld2`:
~~~
julia> using JLD2
julia> v = [1;2;3]
julia> A = [1 2 3; 4 5 6; 7 8 9]
julia> preco = Dict()
julia> preco["banana"] = 5.99
julia> preco["laranja"] = 3.98
julia> preco["uva"] = 4.98
julia> @save "dados.jdl2" v A preco
~~~

É importante inserir a extensão `jdl2` no comando `@save`. Assim, o Julia reconhece o tipo de arquivo a ser gravado.

O trecho a seguir carrega o arquivo `dados.jld2`, definindo as variáveis `v`, `A` e `preco`:
~~~
julia> using JLD2
julia> @load "dados.jdl2"
~~~

Você agora pode ler as variáveis `v`, `A` e `preco` gravadas no arquivo no ambiente Julia.


### Formatos específicos

O método anterior é bom porque grava essencialmente qualquer tipo de dado exatamente da mesma forma em que foram definidos. Isto é, não há perda de informações devido à conversões de tipos. Nesse sentido, ele é preferível. Porém, o tipo de arquivo gerado é binário, e não pode ser lido facilmente fora do Julia.

É comum precisarmos exportar dados tabelados em formatos acessíveis por editores como OpenCalc ou Excel. É claro que podemos sempre optar pelo formato de texto puro TXT. Porém, existem pacotes que podem minimizar o trabalho manual de converter arquivos TXT. São eles:

- **CSV.jl**: grava/lê tabelas em formato CSV. Acesse a [página do pacote](https://csv.juliadata.org/)
- **XLSX.jl**: grava/lê tabelas em formato Excel. Acesse a [página do pacote](https://github.com/felipenoris/XLSX.jl)
- **OdsIO.jl**: grava/lê tabelas em formato ODS (LibreOffice, OpenOffice). Acesse a [página do pacote](https://github.com/sylvaticus/OdsIO.jl)
