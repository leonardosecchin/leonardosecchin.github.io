---
layout: archive
title: "Tópicos em Pesquisa Operacional"
permalink: /topicospo/
author_profile: true
---

<!--## Horários das aulas síncronas
{:.no_toc}

- Terças-feiras: 8:30 - 9:30
- Quartas-feiras: 8:30 - 9:30-->


## Ementa
{:.no_toc}

Ementa variável.


## TÓPICO 1: Métodos de pontos interiores para programação linear

<details>
<summary markdown="span">
**Conteúdo**
</summary>

1. [Preliminares e o método primal afim escala (Dikin)](/files/topicospo/PTO_INT_1-primal_afim_escala.pdf)
   - Leitura introdutória: capítulo 1 do livro de Wright (páginas 1 a 6)
1. [Método dual afim escala](/files/topicospo/PTO_INT_2-dual_afim_escala.pdf)
1. [Método primal dual afim escala](/files/topicospo/PTO_INT_3-primal_dual_afim_escala.pdf)
   - Sobre a heurística *Approximate Minimum Degree* (AMD)
     - [Artigo que propôs a heurística](http://dx.doi.org/10.1137/S0895479894278952)
     - Muita pesquisa foi feita sobre métodos para reordenamento. Julia e Matlab usam a eficiente rotina [CHOLMOD](https://www.researchgate.net/publication/220492578_Algorithm_887_CHOLMOD_Supernodal_Sparse_Cholesky_Factorization_and_UpdateDowndate).
   - [Exemplo da diferença entre usar ou não AMD antes de Cholesky (código Julia)](/files/topicospo/PTO_INT-amd_ex.zip)
1. [Tragetória central e o método seguidor de caminhos](/files/topicospo/PTO_INT_4-seguidor_caminhos.pdf)
1. [Método preditor-corretor de Mehrotra](/files/topicospo/PTO_INT_5-preditor_corretor.pdf)
   - Veja a [descrição do método preditor-corretor do CPLEX](https://www.ibm.com/docs/en/icos/20.1.0?topic=optimizer-introducing-barrier) (CPLEX Barrier)

</details>

**[EXERCÍCIOS DO TÓPICO](https://drive.google.com/file/d/1yCbcSB4R-kmOqpZBTEzHVcqMyU6lspVO/view?usp=sharing)**

- [Código base para o exercício 6 (primal-dual afim escala em Julia)](/files/topicospo/pontos_interiores.jl)
- [Estrutura de esparsidade dos problemas-teste selecionados](/files/topicospo/PTO_INT-prob_testes_A.zip)
- [Resultados numéricos esperados nos problemas-teste selecionados](/files/topicospo/PTO_INT-resultados.txt)
- "Código extra": [interface Julia para o método preditor-corretor do CPLEX](/files/topicospo/cplex_barrier.jl)
- [`Tulip.jl`](https://github.com/ds4dm/Tulip.jl), uma boa implementação do método preditor-corretor com múltiplas correções em Julia

<details>
<summary markdown="span">
**Referências:**
</summary>

- Vanderbei, R. J. Linear programming. Foundations and extensions. 3 ed, Springer, 2008.
- *(capítulo 14)* Nocedal, J.; Wright, S. J. Numerical optimization. Springer, 2006.
- *(capítulo 9)* Maculan, N.; Fampa, M. H. C. Otimização linear. Editora UnB, 2006.
- *(uma referência completa para métodos primais-duais)* Wright, S. J. Primal-Dual Interior-Point Methods. SIAM, 1997.

</details>


## TÓPICO 2: A linguagem de programação Julia

**Conteúdo:**

1. Apresentação
1. Julia para otimização

**[TUTORIAL E EXERCÍCIOS DO TÓPICO](https://github.com/leonardosecchin/tutorial_Julia)**


## TÓPICO 3: Comparação de desempenho entre algoritmos

<details>
<summary markdown="span">
**Conteúdo:**
</summary>

1. Introdução
1. Perfis de desempenho de Dolan e Moré
1. O pacote Julia `BenchmarkProfiles`
1. Análise de perfis através de exemplos
1. Dicas para contagem do tempo de execução

[**SLIDES**](/files/topicospo/performance_profiles.pdf)

</details>

**[EXERCÍCIOS DO TÓPICO](https://drive.google.com/file/d/1VyF2i9UsLfe_OXj2JdBOaRiyYVvvEHH-/view?usp=sharing)**

<details>
<summary markdown="span">
**Referências:**
</summary>

- *(artigo que propôs os perfis)* Dolan, Elizabeth D.; Moré, Jorge J. Benchmarking optimization software with performance profiles. Math. Program., Ser. A 91: 201-213 (2002). [artigo revista](https://doi.org/10.1007/s101070100263); [PDF acesso aberto](https://arxiv.org/abs/cs/0102001)
- *(curta explicação -- seção 6.3)* [Ribeiro, A. A; Karas, E. W. Otimização contínua. Cengage, 2014](http://www.cengage.com.br/ls/otimizacao-continua-aspectos-teoricos-e-computacionais/)
- *(pacote para geração de perfis)* [Pacote Julia BenchmarkProfiles](https://github.com/JuliaSmoothOptimizers/BenchmarkProfiles.jl)

</details>

## TÓPICO 4: Relaxação lagrangiana para programação linear inteira

<details>
<summary markdown="span">
**Conteúdo:**
</summary>

1. [Função lagrangiano e a relaxação lagrangiana de um problema linear](/files/topicospo/RELAX_LAG_1-relaxacao.pdf)
   - Explicação do exemplo [GAP (Generalized Assignment Problem)](https://en.wikipedia.org/wiki/Generalized_assignment_problem)
1. [Propriedades da função lagrangiano; subgradiente/subdiferencial](/files/topicospo/RELAX_LAG_2-subgrad.pdf)
1. [Método do subgradiente para funções convexas e sua convergência](/files/topicospo/RELAX_LAG_3-metodo_subgrad.pdf)
1. [Resolução do problema lagrangiano via método do subgradiente](/files/topicospo/RELAX_LAG_4-relaxacao_subgrad.pdf)

</details>

**[EXERCÍCIOS DO TÓPICO](https://drive.google.com/file/d/1EwxcJ7lcMM0r4ksb6fa-ViYExBHwb6ba/view?usp=sharing)**

- [Código base para uso do CPLEX ou GLPK no Julia (problema de localização de facilidades não capacitado)](/files/topicospo/ufl.jl)

<details>
<summary markdown="span">
**Referências:**
</summary>

- *(artigo guia)* Fisher, M. L. The Lagrangian Relaxation Method for Solving Integer Programming Problems. Management Science 27(1), 1-18 (1981) [artigo revista (2004)](https://doi.org/10.1287/mnsc.1040.0263); [PDF aberto (1981)](http://www.dep.ufmg.br/old/professores/miranda/OtiComb/lagrange.pdf)
- *(método do subgradiente e sua convergência -- seções 3.1 e 3.2)* Bertsekas, D. P. Convex Optimization Algorithms. Athena Scientific, 2015.
- *(um panorama geral -- capítulo 10)* [Wolsey, L. A. Integer Programming. 2ed, Wiley, 2021.](https://onlinelibrary.wiley.com/doi/10.1002/9781119606475.ch10)
- *(aplicação em branch-and-bound)* [Florentino, H. O. Relaxação lagrangeana em programação inteira. Dissertação de Mestrado (ICMC/USP), São Carlos, 1990.](https://teses.usp.br/teses/disponiveis/55/55134/tde-20022019-110621/pt-br.php)
- *(capítulo 11)* Maculan, N.; Fampa, M. H. C. Otimização linear. Editora UnB, 2006.

</details>


## TÓPICO 5: Algoritmos de otimização em aprendizado de máquina

<details>
<summary markdown="span">
**Conteúdo:**
</summary>

1. [Introdução](/files/topicospo/ML_1-intro.pdf)
1. [Método do gradiente incremental](/files/topicospo/ML_2-incremental.pdf)
1. [Um pouco de probabilidade](/files/topicospo/ML_3-prob.pdf)
1. [Método do gradiente estocástico (SG) e variantes](/files/topicospo/ML_4-sg.pdf)
1. [Convergência do método do gradiente estocástico para funções convexas](/files/topicospo/ML_5-convergencia_sg.pdf)
1. [Treinamento de redes neurais multicamadas tipo feedfoward, backpropagation](/files/topicospo/ML_6-treinamento.pdf)
1. Experimentos numéricos
   - [Diferença entre gradiente incremental e estocástico](/files/topicospo/ionosphere.zip)
   - Pacote com *datasets* prontos para Julia: [MLDatasets.jl](https://github.com/JuliaML/MLDatasets.jl)
   - [Exemplo de uso do **Flux** no *dataset* MNIST (código)](/files/topicospo/ex_flux.jl)
   - Sobre o *dataset* MNIST: [wikipedia](https://en.wikipedia.org/wiki/MNIST_database); [página do autor](http://yann.lecun.com/exdb/mnist/); [estatísticas dos dados](https://knowyourdata-tfds.withgoogle.com/#tab=STATS&dataset=mnist)
   - Exemplos prontos de uso do **Flux**: [model-zoo](https://github.com/FluxML/model-zoo)

</details>

<details>
<summary markdown="span">
**Conjunto de dados (*datasets*) disponíveis para uso:**
</summary>

- [UC Irvine Machine Learning Repository](https://archive.ics.uci.edu/ml/index.php)
- [*Datasets* no TensorFlow](https://www.tensorflow.org/datasets/catalog/overview#all_datasets)
- [Informações variadas sobre vários *datasets*](https://knowyourdata-tfds.withgoogle.com/)

</details>

<details>
<summary markdown="span">
**Alguns pacotes Julia para aprendizado de máquina:**
</summary>

- [Flux.jl](https://fluxml.ai/) (implementado em Julia puro)
- [Merlin.jl](https://github.com/hshindo/Merlin.jl) (implementado em Julia puro)
- [ScikitLearn.jl](https://github.com/cstjean/ScikitLearn.jl) (interface para [scikit-learn](https://scikit-learn.org/stable/), implementado em Python)
- [TensorFlow.jl](https://github.com/malmaud/TensorFlow.jl) (interface para ambiente [TensorFlow](https://www.tensorflow.org/))

</details>

**[EXERCÍCIOS DO TÓPICO](https://drive.google.com/file/d/1HxhG4-H8jXr-VpQzZl2LigfqgvXko5IR/view?usp=sharing)**

<details>
<summary markdown="span">
**Referências:**
</summary>

- *(introdução aprendizado de máquina)* Bottou, L; Curtis, F. E.; Nocedal, J. Optimization Methods for Large-Scale Machine Learning. SIAM Rev., 60(2), 223-311 (2018). [artigo revista](https://doi.org/10.1137/16M1080173); [PDF acesso livre](https://arxiv.org/abs/1606.04838)
- *(introdução gradiente incremental -- seção 2.1.5)* Bertsekas, D. P. Convex Optimization Algorithms. Athena Scientific, 2015.
- *(texto sobre probabilidade)* [Curso "Teoria da Probabilidade" de A. Morgado e R. Teixeira (FGV)](https://sites.google.com/site/probfgv/) (link para [notas de aula](https://sites.google.com/site/probfgv/Livro_probabilidade.pdf?attredirects=0))
- *((sub)gradiente incremental/estocástico e convergência -- seções 8.3, 8.4)* Beck, A. First-Order Methods in Optimization. MOS-SIAM Series on Optimization, SIAM, 2017.
- *(curso básico)* [Livro on-line "Neural Networks and Deep Learning"](http://neuralnetworksanddeeplearning.com/)
- *(resumo de vários métodos)* [paperswithcode.com](https://paperswithcode.com/methods/category/optimization)

</details>


## TÓPICO 6: Geração de colunas

<details>
<summary markdown="span">
**Conteúdo:**
</summary>

1. [Elementos de Programação Linear (revisão): representação de poliedros e método Simplex](/files/topicospo/GER_COL_1-PL.pdf)
   - Revisão completa e exemplos no livro de Maculan e Fampa e nas notas de aula de PL disponibilizadas via AVA
1. [Método de geração de colunas para problemas lineares (PLs) contínuos](/files/topicospo/GER_COL_2-geracao_colunas.pdf)
1. [Decomposição de Dantzig-Wolfe, PLs com variáveis inteiras, comentários sobre *branch-and-price*](/files/topicospo/GER_COL_3-dantzig-wolfe.pdf)
1. [Exemplo: geração de colunas aplicado ao problema *cutting stock*](/files/topicospo/GER_COL_4-cutting-stock.pdf)
   - Referência: Seções 6.1 e 6.2 de Bertsimas, Tsitsiklis - Introduction to Linear Optimization (1997)
   - [Código Julia + instâncias](/files/topicospo/GER_COL_cutting_stock.zip)
   - [URL para instâncias utilizadas](http://or.dei.unibo.it/library/bpplib)

</details>

**[EXERCÍCIOS DO TÓPICO](https://drive.google.com/file/d/1Wmg11XNM_uW6viAKZfZd2kW2H0tFytQU/view?usp=sharing)**

<details>
<summary markdown="span">
**Leituras interessantes:**
</summary>

- Geralmente o método de geração de colunas vem associado ao método Simplex, ou seja, o problema auxiliar, que fornece a nova coluna a entrar no problema mestre, é resolvido via Simplex. Mas isso não é obrigatório! É possível usar métodos de pontos interiores (tópico 1) no lugar do Simplex com sucesso. O mesmo vale para geração de colunas dentro de um esquema enumerativo ao resolver problemas com variáveis inteiras. Veja por exemplo [este artigo](https://proceedings.sbmac.org.br/sbmac/article/view/617/0) e suas referências.

- Em alguns casos interessantes é possível usar relaxação lagrangiana (tópico 4) nos problemas do método de geração de colunas. Veja por exemplo o capítulo 9 [deste livro](https://link.springer.com/chapter/10.1007/0-387-25486-2_9).

</details>

<details>
<summary markdown="span">
**Referências:**
</summary>

- *(capítulo 7)* Maculan, N.; Fampa, M. H. C. Otimização linear. Editora UnB, 2006.
- *(um panorama geral -- Capítulo 11)* [Wolsey, L. A. Integer Programming. 2ed, Wiley, 2021.](https://onlinelibrary.wiley.com/doi/10.1002/9781119606475.ch11)
- *(cutiing stock -- seções 6.1 e 6.2)* Bertsimas, Tsitsiklis - Introduction to Linear Optimization (1997).
- Munari, P.; Morabito, R. A branch-price-and-cut algorithm for the vehicle routing problem with time windows and multiple deliverymen. TOP 26, 437-464 (2018). [artigo revista](https://doi.org/10.1007/s11750-018-0481-8); [PDF acesso livre](http://www.optimization-online.org/DB_FILE/2016/01/5289.pdf)

</details>
