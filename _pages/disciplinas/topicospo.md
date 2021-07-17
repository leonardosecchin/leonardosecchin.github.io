---
layout: archive
title: "Tópicos em Pesquisa Operacional"
permalink: /topicospo/
author_profile: true
---

## Horários das aulas síncronas

- Terças-feiras: 8:30 - 9:30
- Quartas-feiras: 8:30 - 9:30


## Ementa

Ementa variável.


## [Disciplina no Ambiente Virtual de Aprendizagem - AVA-UFES](https://ava.ufes.br/course/view.php?id=16373)

- Notas das atividades e **aulas gravadas** serão disponibilizadas somente no AVA-UFES, com acesso restrito aos alunos.


## TÓPICO 1: Métodos de pontos interiores para programação linear

**Conteúdo:**

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

**[EXERCÍCIOS DO TÓPICO](https://drive.google.com/file/d/1yCbcSB4R-kmOqpZBTEzHVcqMyU6lspVO/view?usp=sharing)**
- [Código base para o exercício 6 (primal-dual afim escala em Julia)](/files/topicospo/pontos_interiores.jl)
- [Estrutura de esparsidade dos problemas-teste selecionados](/files/topicospo/PTO_INT-prob_testes_A.zip)
- [Resultados numéricos esperados nos problemas-teste selecionados](/files/topicospo/PTO_INT-resultados.txt)
- "Código extra": [interface Julia para o método preditor-corretor do CPLEX](/files/topicospo/cplex_barrier.jl)

**Referências:**
- Vanderbei, R. J. Linear programming. Foundations and extensions. 3 ed, Springer, 2008.
- Wright, S. J. Primal-Dual Interior-Point Methods. SIAM, 1997.
- Nocedal, J.; Wright, S. J. Numerical optimization. Springer, 2006 (capítulo 14).


## TÓPICO 2: A linguagem de programação Julia

**Conteúdo:**

1. Apresentação
1. Julia para otimização

**EXERCÍCIOS DO TÓPICO:**
1. Instalar o Julia em sua máquina, do acordo com [este link](https://leonardosecchin.github.io/julia)
1. Estudar os exemplos 1, 2, 3, 4, 5, 6, 8, 12 e 14 [deste link](https://leonardosecchin.github.io/juliaopt/)

**Referências:**
- [Pequeno tutorial sobre Julia](https://leonardosecchin.github.io/julia/) e links internos


## TÓPICO 3: Comparação de desempenho entre algoritmos

**Conteúdo:**

1. Introdução
1. Perfis de desempenho de Dolan e Moré
1. O pacote Julia `BenchmarkProfiles`
1. Análise de perfis através de exemplos
1. Dicas para contagem do tempo de execução

[**SLIDES**](/files/topicospo/performance_profiles.pdf)

**[EXERCÍCIOS DO TÓPICO](https://drive.google.com/file/d/1VyF2i9UsLfe_OXj2JdBOaRiyYVvvEHH-/view?usp=sharing)**

**Referências:**
- *(artigo que propôs os perfis)* Dolan, Elizabeth D.; Moré, Jorge J. Benchmarking optimization software with performance profiles. Math. Program., Ser. A 91: 201-213 (2002). [artigo revista](https://doi.org/10.1007/s101070100263); [PDF acesso aberto](https://arxiv.org/abs/cs/0102001)
- *(curta explicação -- seção 6.3)* [Ribeiro, A. A; Karas, E. W. Otimização contínua. Cengage, 2014](http://www.cengage.com.br/ls/otimizacao-continua-aspectos-teoricos-e-computacionais/)
- *(pacote para geração de perfis)* [Pacote Julia BenchmarkProfiles](https://github.com/JuliaSmoothOptimizers/BenchmarkProfiles.jl)


## TÓPICO 4: Relaxação lagrangiana para programação linear inteira

**Conteúdo:**

1. [Função lagrangiano e a relaxação lagrangiana de um problema linear](/files/topicospo/RELAX_LAG_1-relaxacao.pdf)
   - Explicação do exemplo [GAP (Generalized Assignment Problem)](https://en.wikipedia.org/wiki/Generalized_assignment_problem)
1. Subgradiente/subdiferencial
1. Método do subgradiente para funções convexas
1. Convergência dos métodos com passo fixo e com passo decrescente
1. Resolução do problema lagrangiano via método do subgradiente

**EXERCÍCIOS DO TÓPICO (em breve)**
- [Código base para uso do CPLEX ou GLPK no Julia (problema de localização de facilidades não capacitado)](/files/topicospo/ufl.jl)
<!--- Implementação em Julia de uma relaxação lagrangiana para o problema *K-median* e resolução pelo método do subgradiente-->

**Referências:**
- *(artigo guia)* Fisher, M. L. The Lagrangian Relaxation Method for Solving Integer Programming Problems. Management Science 27(1), 1-18 (1981) [artigo revista (2004)](https://doi.org/10.1287/mnsc.1040.0263); [PDF aberto (1981)](http://www.dep.ufmg.br/old/professores/miranda/OtiComb/lagrange.pdf)
- *(método do subgradiente e sua convergência -- seções 3.1 e 3.2)* Bertsekas, D. P. Convex Optimization Algorithms. Athena Scientific, 2015.
- *(um panorama geral -- capítulo 10)* [Wolsey, L. A. Integer Programming. 2ed, Wiley, 2021.](https://onlinelibrary.wiley.com/doi/10.1002/9781119606475.ch10)

**Outra:**
- *(aplicação em branch-and-bound)* [Florentino, H. O. Relaxação lagrangeana em programação inteira. Dissertação de Mestrado (ICMC/USP), São Carlos, 1990.](https://teses.usp.br/teses/disponiveis/55/55134/tde-20022019-110621/pt-br.php)


## TÓPICO 5: Algoritmos de otimização em aprendizado de máquina

**Conteúdo:**

1. Método do gradiente clássico (revisão)
1. Método do gradiente incremental
1. Método do gradiente estocástico e variantes
1. Modelos via redes neurais
1. Treinamento de redes neurais
1. Convergência em probabilidade do método estocástico com passo constante para funções fortemente convexas
1. Exemplos e aplicações

**Referências:**
- *(curso básico)* [Livro on-line "Neural Networks and Deep Learning"](http://neuralnetworksanddeeplearning.com/)
- *(resumo de vários métodos)* [paperswithcode.com](https://paperswithcode.com/methods/category/optimization)
- *(referência com demonstrações de teoremas)* Bottou, L; Curtis, F. E.; Nocedal, J. Optimization Methods for Large-Scale Machine Learning. SIAM Rev., 60(2), 223-311 (2018). [artigo revista](https://doi.org/10.1137/16M1080173); [PDF acesso livre](https://arxiv.org/abs/1606.04838)


## TÓPICO 6: Geração de colunas

**Conteúdo:**

1. Decomposição de Dantzig-Wolfe
1. Método de geração de colunas
1. *Branch-and-Cut-and-Price* -- estudo de caso

**EXERCÍCIOS DO TÓPICO:**
- Implementação de um método simples de geração de colunas usando Julia + CPLEX/GLPK

**Referências:**
- *(um panorama geral -- Capítulo 11)* [Wolsey, L. A. Integer Programming. 2ed, Wiley, 2021.](https://onlinelibrary.wiley.com/doi/10.1002/9781119606475.ch11)
- *(estudo de caso)* Munari, P.; Morabito, R. A branch-price-and-cut algorithm for the vehicle routing problem with time windows and multiple deliverymen. TOP 26, 437-464 (2018). [artigo revista](https://doi.org/10.1007/s11750-018-0481-8); [PDF acesso livre](http://www.optimization-online.org/DB_FILE/2016/01/5289.pdf)


<!--## TÓPICO 7: Otimização não suave (a verificar)

**Conteúdo:**

1. Subgradiente e subdiferencial
1. *Bundle method*-->
