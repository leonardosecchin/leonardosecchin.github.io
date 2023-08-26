---
layout: archive
title: "Julia para Otimização - Exemplo 8"
permalink: /juliaopt_ex8/
author_profile: true
---

[<< voltar para "Julia para Otimização"](/juliaopt/)

## Objetivo: acessar bibliotecas de problemas-teste usadas na literatura.

Bibliotecas de problemas para testes estão disponíveis, e são comumente utilizadas na pesquisa. A seguir, listo duas das principais fontes de problemas: arquivos `.SIF` (CUTEst) e `.nl`.

## CUTEst - Constrained and Unconstrained Testing Environment with safe threads

Esta é a principal bilbioteca para testes com problemas gerais. Ela reúne mais de 1300 problemas, entre lineares e não lineares, restritos e irrestritos. Cada problema é composto por um arquivo `.SIF`.

### *INTERFACE* JULIA PARA CUTEst

No Julia, é possível ler arquivos `.SIF` com o pacote `CUTEst`. **Ao instalar este pacote, todos os problemas da CUTEst são automaticamente baixados, logo não é necessário baixá-los manualmente.** A [página oficial](https://github.com/JuliaSmoothOptimizers/CUTEst.jl) do pacote traz instruções de uso. As características de cada problema podem ser encontradas [neste link](http://www.cuter.rl.ac.uk/Problems/mastsif.shtml).

Como exemplo, vamos ler o problema irrestrito `SPARSQUR`. A estrutura `NLPmodels` (a mesma dos exemplos anteriores) é criada diretamente do arquivo `.SIF`:

~~~
julia> using CUTEst
julia> nlp = CUTEstModel("SPARSQUR");
~~~

Podemos assim resolver o modelo com nossa implementação do gradiente (veja [Exemplo 4](/juliaopt_ex4/)):

~~~
julia> include("[diretorio]/gradiente.jl");
julia> gradiente(nlp);
~~~

Para ler outro problema da CUTEst, é necessário finalizar a instância ativa:

~~~
julia> finalize(nlp);
julia> nlp = CUTEstModel("[outro problema]");
~~~

Isso é útil quando queremos resolver vários problemas em série.

### Selecionando problemas da CUTEst

O pacote `CUTEst` fornece uma maneira simples de selecionar problemas. Os comandos a seguir retornam o vetor `probs` contendo os nomes dos problemas. Você pode usá-lo para automatizar a resolução de problemas selecionados de acordo com sua necessidade, executando algo como `nlp = CUTEstModel(probs[k])` (`k` de 1 até `length(probs)`).

Selecionando **todos** os problemas da CUTEst:
~~~
julia> probs = CUTEst.select()
~~~

Selecionando problemas com no máximo 100 variáveis:
~~~
julia> probs = CUTEst.select(max_var=100)
~~~

Selecionando problemas com número de variáveis entre 10 e 100, e que não possuam restrições além de limitantes nas variáveis:
~~~
julia> probs = CUTEst.select(min_var=10, max_var=100, max_con=0)
~~~

Selecionando todos os problemas irrestritos:
~~~
julia> probs = CUTEst.select(max_con=0, only_free_var=true)
~~~

Há muitas outras possibilidades. A seguir, uma lista de *tags* que você pode utilizar:
- **max_var=[número]**: número máximo de variáveis
- **min_var=[número]**: número mínimo de variáveis
- **max_con=[número]**: número máximo de restrições ordinárias ($h(x)=0$ e $g(x)\leq 0$)
- **min_con=[número]**: número mínimo de restrições ordinárias ($h(x)=0$ e $g(x)\leq 0$)
- **only_free_var=true**: somente problemas com todas as variáveis livres
- **only_bnd_var=true**: somente problemas com variáveis limitadas
- **only_equ_con=true**: somente problemas com restrições ordinárias de igualdade
- **only_ineq_con=true**: somente problemas com restrições ordinárias de desigualdade
- **only_linear_con=true**: somente problemas com restrições ordinárias lineares
- **only_nonlinear_con=true**: somente problemas com restrições ordinárias não lineares
- **objtype=T**: tipo da função objetivo, onde **T** pode assumir
  - **"none"**: sem função objetivo (problema de viabilidade)
  - **"constant"**: função objetivo constante
  - **"linear"**: função objetivo linear
  - **"quadratic"**: função objetivo quadrática
  - **"sum_of_squares"**: função objetivo igual à uma soma de quadrados
  - **"other"**: outro tipo não especificado acima
  - Obs: o comando `CUTEst.objtypes` lista os tipos de função objetivo acima.
- **contype=C**: categoria das restrições, onde **C** pode assumir
  - **"unc"**: sem restrições (problema irrestrito)
  - **"fixed_vars"**: restrições somente fixando variáveis
  - **"bounds"**: somente limitantes em variáveis
  - **"network"**: restrições representam a matriz de adjacência de uma rede
  - **"linear"**: apenas restrições lineares
  - **"quadratic"**: apenas restrições quadráticas (inclue as lineares)
  - **"general"**: restrições mais gerais que as categorias acima
  - Obs: o comando `CUTEst.contypes` lista os tipos de restrições acima.


## A linguagem de modelagem AMPL e arquivos .nl

Uma linguagem de modelagem muito utilizada é o [AMPL](https://ampl.com/). Na verdade, o AMPL tal como disponibilizado é uma espécie de "ambiente de otimização" pois traz consigo alguns resolvedores. No entanto, o AMPL **não é *software* livre**. É necessária uma licença para usufruir de todas as suas funcionalidades. Uma versão limitada de demonstração está disponível no [site do desenvolvedor](https://ampl.com/).

É possível exportar os modelos AMPL para o formato `.nl`. Veja a [documentação](https://ampl.com/resources/the-ampl-book/chapter-downloads/) oficial. Apesar do AMPL não ser livre, o formato codificado `.nl` sim é livre. De fato, outros *softwares* geraram arquivos `.nl`, como é o caso do Julia. É possível ainda que problemas sejam disponibilizados diretamente em formato `.nl`.


### Manipulando arquivos .nl no Julia

No Julia, há dois pacotes para manipulação desse tipo de arquivo:
- **`AmplNLReader`:** Lê arquivos `.nl` ([link](https://github.com/JuliaSmoothOptimizers/AmplNLReader.jl))
- **`AmplNLWriter`:** Escreve arquivos `.nl` a partir de estruturas de modelagem próprias ([link](https://github.com/jump-dev/AmplNLWriter.jl))

A seguir, um exemplo de leitura de um arquivo `.nl`. Isso é útil quando uma biblioteca de problemas é disponibilizada nesse formato, ou em arquivos do AMPL.

Suponha que no diretório em que Julia foi executado exista o arquivo `modelo.nl`. Criar o modelo `nlp`, já na estrutura `NLPModels`, é muito simples:

~~~
julia> using AmplNLReader
julia> nlp = AmplModel("modelo.nl")
~~~

Por sua vez, o pacote `AmplNLWriter` escreve arquivos `.nl`, mas a partir de estruturas próprias de modelagem (isto é, você terá que criar o modelo já na estrutura do `AmplNLWriter`). É possível "conectar" `AmplNLWriter` diretamente à resolvedores sem passar por arquivos `.nl`, como se estivéssemos no ambiente do AMPL. Veja a documentação do pacote para detalhes.


## Outras fontes de problemas

### Problemas irrestritos

O pacote `OptimizationProblems` contém alguns problemas irrestritos, muitos deles presentes na CUTEst. Os problemas vêm na estrutura `JuMP`, e você precisará convertê-los para `NLPmodels` a fim de usufruir de derivadas automáticas (veja [Exemplo 1](/juliaopt_ex1)). Acesse a [página oficial](https://github.com/JuliaSmoothOptimizers/OptimizationProblems.jl) do pacote para instruções de uso.

### Matrizes esparsas da *Suite Sparse Matrix Collection*

Se pretende minimizar funções quadráticas, você pode ler matrizes da [Suite Sparse Matrix Collection](https://sparse.tamu.edu/). Trata-se de uma enorme reunião de matrizes, inclusive de grande porte provenientes de aplicações reais, disponíveis em vários formatos. É possível filtrar por tipo de matriz (simétricas, definidas positivas, condicionamento etc). Com o pacote [`SuiteSparseMatrixCollection`](https://github.com/JuliaSmoothOptimizers/SuiteSparseMatrixCollection.jl) é possível carregar matrizes da coletânea direto no Julia.
   - Na coletânea, as matrizes vêm em 3 formatos para escolha. Um deles é o formato Matrix Market (MM). No Julia, você precisará do pacote [`MatrixMarket`](https://github.com/JuliaSparse/MatrixMarket.jl) para ler matrizes neste formato.
   - O pacote `SuiteSparseMatrixCollection` baixa as matrizes automaticamente para o diretório de trabalho do próprio Julia. Por exemplo, o trecho a seguir seleciona e baixa as matrizes do grupo [**HB**](https://sparse.tamu.edu/HB) que são reais, simétricas, definidas positivas e com dimensão $\leq 1000$:
   ~~~
   julia> using SuiteSparseMatrixCollection, MatrixMarket
   julia> ssmc = ssmc_db()
   julia> matrizes = ssmc[(ssmc.nrows .<= 1000) .& (ssmc.group .== "HB") .& (ssmc.numerical_symmetry .== 1) .& (ssmc.real .== true) .& (ssmc.positive_definite .== true), :]
   julia> paths = fetch_ssmc(matrizes, format="MM")
   ~~~
   O vetor `paths` conterá os diretórios das matrizes. Podemos ler a primeira matriz fazendo:
   ~~~
   julia> A = MatrixMarket.mmread(paths[1] * "/" * matrizes.name[1] * ".mtx")
   ~~~
   ou
   ~~~
   julia> A = MatrixMarket.mmread(joinpath(paths[1], "$(matrizes.name[1]).mtx"))
   ~~~

Se tiver problemas com o pacote `SuiteSparseMatrixCollection`, uma alternativa é o pacote [`MatrixDepot`](https://github.com/JuliaMatrices/MatrixDepot.jl). Este último pacote também baixa matrizes automaticamente.


### Mais fontes

Consulte [este link](/juliaopt_problems/) para mais fontes.