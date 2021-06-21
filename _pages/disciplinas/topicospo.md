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


## Tópicos selecionados

### Métodos de pontos interiores para programação linear

1. [Preliminares e o método primal afim escala (Dikin)](/files/topicospo/PTO_INT_1-primal_afim_escala.pdf)
   - Leitura introdutória: capítulo 1 do livro de Wright (páginas 1 a 6)
1. [Método dual afim escala](/files/topicospo/PTO_INT_2-dual_afim_escala.pdf)
1. [Método primal dual afim escala](/files/topicospo/PTO_INT_3-primal_dual_afim_escala.pdf)
   - [Exemplo da diferença entre usar ou não AMD antes de Cholesky (código Julia)](/files/topicospo/PTO_INT-amd_ex.zip)
1. Tragetória central e o método seguidor de caminhos
1. Método preditor-corretor de Mehrota
1. Implementação computacional

Referências:
- Vanderbei, R. J. Linear programming. Foundations and extensions. 3 ed, Springer, 2008.
- Wright, S. J. Primal-Dual Interior-Point Methods. SIAM, 1997.
- Nocedal, J.; Wright, S. J. Numerical optimization. Springer, 2006 (capítulo 14).


### A linguagem de programação Julia

1. Apresentação
1. Julia para otimização

Referências:
- <https://leonardosecchin.github.io/julia/>


### Comparação de desempenho entre algoritmos

1. Perfis de desempenho de Dolan e Moré
1. O pacote Julia `BenchmarkProfiles`
1. Exemplos

Referências:
- [Dolan, Elizabeth D.; Moré, Jorge J. Benchmarking optimization software with performance profiles. Math. Program., Ser. A 91: 201-213 (2002).](https://doi.org/10.1007/s101070100263)
- [Ribeiro, A. A; Karas, E. W. Otimização contínua. Cengage, 2014](http://www.cengage.com.br/ls/otimizacao-continua-aspectos-teoricos-e-computacionais/) (seção 6.3)
- <https://github.com/JuliaSmoothOptimizers/BenchmarkProfiles.jl>


### Relaxação lagrangiana para programação linear inteira mista

1. Função lagrangiano e propriedades
1. Relaxação lagrangiana de um problema linear
1. Subgradiente/subdiferencial, método do subgradiente
1. Resolução do problema lagrangiano via método do subgradiente

Referências:
- [Wolsey, L. A. Integer Programming. Wiley, 1998.](https://www.wiley.com/en-us/Integer+Programming-p-9780471283669)
- [Florentino, H. O. Relaxação lagrangeana em programação inteira. Dissertação de Mestrado (ICMC/USP), São Carlos, 1990.](https://teses.usp.br/teses/disponiveis/55/55134/tde-20022019-110621/pt-br.php)


### Algoritmos de otimização em aprendizado de máquina

1. Método do gradiente
1. Redes Neurais
1. Uma breve introdução ao treinamento de redes neurais: método do gradiente estocástico e variantes
1. Exemplos e aplicações

Referências:
- <http://neuralnetworksanddeeplearning.com/>
- <https://paperswithcode.com/methods/category/optimization>


### Geração de colunas

1. Decomposição de Dantzig-Wolfe
1. Método de geração de colunas
1. *Branch-and-Cut-and-Price* -- estudo de caso

Referências:
- [Wolsey, L. A. Integer Programming. Wiley, 1998.](https://www.wiley.com/en-us/Integer+Programming-p-9780471283669)
- <http://www.optimization-online.org/DB_FILE/2016/01/5289.pdf>


<!--### Otimização não suave (a verificar)

1. Subgradiente e subdiferencial
1. *Bundle method*-->