---
layout: archive
title: "Julia para Otimização"
permalink: /juliaopt_ex8/
author_profile: true
---

# Exercício 8

**Objetivo:** acessar bibliotecas de problemas-teste usadas na literatura.

Bibliotecas de problemas para testes estão disponíveis, e são comumente utilizadas na pesquisa. A seguir, listo duas das principais fontes de problemas: arquivos `.SIF` (CUTEst) e `.nl`.

## CUTEst - Constrained and Unconstrained Testing Environment with safe threads

Esta é a principal bilbioteca para testes com problemas gerais. Ela reúne mais de 1300 problemas, entre lineares e não lineares, restritos e irrestritos. Cada problema é composto por um arquivo `.SIF`. A coleção completa dos problemas pode ser obtida pelo repositório https://bitbucket.org/optrove/sif. No GNU/linux, basta executar o seguinte comando de dentro da pasta que deseja guardar os problemas:

~~~
git clone https://bitbucket.org/optrove/sif ./mastsif
~~~

Isso criará a pasta `mastsif` contendo os arquivos `.SIF`.

*ALERTA: a biblioteca completa tem mais de 2Gb!*

**Outras (sub-)bibliotecas menores (cerca de 230Mb):**

- Problemas convexos de Maros & Meszaros:
  ~~~
  git clone https://bitbucket.org/optrove/maros-meszaros ./marosmeszaros
  ~~~
- Problemas lineares (PL's) da Netlib: descompacte o arquivo [deste link](ftp://ftp.numerical.rl.ac.uk/pub/cutest/netlib.tar.gz).

### *INTERFACE* JULIA PARA ARQUIVOS .SIF

No Julia, é possível ler arquivos `.SIF` com o pacote `CUTEst`. A [página oficial](https://github.com/JuliaSmoothOptimizers/CUTEst.jl) do pacote traz instruções de uso. As características de cada problema podem ser encontradas [neste link](http://www.cuter.rl.ac.uk/Problems/mastsif.shtml).

Como exemplo, vamos ler o problema irrestrito `SPARSQUR`. A estrutura `NLPmodels` (a mesma dos exemplos anteriores) é criada diretamente do arquivo `.SIF`:

~~~
julia> using CUTEst
julia> nlp = CUTEstModel("[diretorio dos arquivos SIF]/SPARSQUR");
~~~

Podemos assim resolver o modelo com nossa implementação do gradiente (veja [Exercício 4](/juliaopt_ex4/)):

~~~
julia> include("[diretorio]/gradiente.jl");
julia> gradiente(nlp);
~~~

Para ler outro problema da CUTEst, é necessário finalizar a instância ativa:

~~~
julia> finalize(nlp);
julia> nlp = CUTEstModel("[diretorio dos arquivos SIF]/[outro problema]");
~~~

Isso é útil quando queremos resolver vários problemas em série.

## Problemas no formato aberto .nl

É comum que modelos de otimização sejam disponibilizados em um formato livre com extensão `.nl`. No Julia, há dois pacotes para manipulação desse tipo de arquivo:
- **`AmplNLReader`:** Lê arquivos `.nl` ([link](https://github.com/JuliaSmoothOptimizers/AmplNLReader.jl))
- **`AmplNLWriter`:** Escreve arquivos `.nl` a partir de estruturas `JuMP` ([link](https://github.com/jump-dev/AmplNLWriter.jl))

Exemplos:

--- EM BREVE ---

## A linguagem de modelagem AMPL

Uma linguagem de modelagem muito utilizada é o [AMPL](https://ampl.com/). Na verdade, AMPL é um ambiente de otimização, traz consigo alguns resolvedores. No entanto, o AMPL **não é *software* livre**. É necessária uma licença do *software* para usufruir de todas as funcionalidades. Uma versão demonstração limitada está disponível no [site do desenvolvedor](https://ampl.com/).

É possível exportar os modelos AMPL para o formato livre `.nl`. Veja a [documentação](https://ampl.com/resources/the-ampl-book/chapter-downloads/) oficial.

## Outras fontes de problemas / formatos

### Problemas irrestritos

O pacote `OptimizationProblems` contém alguns problemas irrestritos, muitos deles presentes na CUTEst. Os problemas vêm na estrutura `JuMP`, e você precisará convertê-los para `NLPmodels` a fim de usufruir de derivadas automáticas (veja [Exercício 1](/juliaopt_ex1)). Acesse a [página oficial](https://github.com/JuliaSmoothOptimizers/OptimizationProblems.jl) do pacote para instruções de uso.

### Matrizes esparsas da *Suite Sparse Matrix Collection*

Se pretende minimizar funções quadráticas, você pode ler matrizes da [Suite Sparse Matrix Collection](https://sparse.tamu.edu/). Trata-se de uma enorme reunião de matrizes, inclusive de grande porte provenientes de aplicações reais, disponíveis em vários formatos. É possível filtrar por tipo de matriz (simétricas, definidas positivas, condicionamento etc). Com o pacote [`SuiteSparseMatrixCollection`](https://github.com/JuliaSmoothOptimizers/SuiteSparseMatrixCollection.jl) é possível carregar matrizes da coletânea direto no Julia.
   - Na coletânea, as matrizes vêm em 3 formatos para escolha. Um deles é o formato Matrix Market (MM). No Julia, você precisará do pacote [`MatrixMarket`](https://github.com/JuliaSparse/MatrixMarket.jl) para ler matrizes neste formato.
   - O pacote `SuiteSparseMatrixCollection` baixa as matrizes automaticamente para o diretório de trabalho do próprio Julia. Por exemplo, o trecho a seguir baixa as matrizes do grupo [**HB**](https://sparse.tamu.edu/HB) que são simétricas, definidas positivas e com dimensão $\leq 1000$:
   ~~~
   julia> using SuiteSparseMatrixCollection
   julia> matrizes = ssmc[(ssmc.columns.rows .<= 1000) .& (ssmc.columns.group .== "HB") .& (ssmc.columns.numericalSym .== "symmetric") .& (ssmc.columns.posDef.== "yes")]
   julia> fetch_ssmc(matrizes, format="MM")
   ~~~
   (veja a documentação do pacote para atualizações, caso os comandos acima não funcionem). Para acessar a primeira matriz da coleção `matrizes`, capturamos o diretório em que o arquivo da matriz se encontra e a carregamos na variável `A`:
   ~~~
   julia> using MatrixMarket
   julia> path = matrix_path(matrizes.columns[1], format="MM")
   julia> A = MatrixMarket.mmread(path * "/" * matrizes.columns[1].name * ".mtx")
   ~~~

### Formatos típicos em PL e programação quadrática

Em programação linear/quadrática, os formatos livres de arquivo `MPS` e `QPS` são usados (por exemplo, o CPLEX lê esses formatos). Uma interface para leitura desses tipos de arquivos no Julia vem no pacote [`QPSReader`](https://github.com/JuliaSmoothOptimizers/QPSReader.jl).