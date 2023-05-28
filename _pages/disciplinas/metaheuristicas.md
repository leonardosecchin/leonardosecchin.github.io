---
layout: archive
title: "Metaheurísticas"
permalink: /metaheuristicas/
author_profile: true
---

## Horários das aulas

- Quintas-feiras de 13:00 as 15:00 (LABMAT / excepcionalmente Sala 08 Eixo 3)
- Sextas-feiras de 13:00 as 15:00 (LABMAT / excepcionalmente Sala 11 Eixo 1)


## Ementa

Consulte Projeto Pedagógico do [Curso](https://matematicaindustrial.saomateus.ufes.br).


## Objetivos da disciplina

- Estudar as principais (meta)heurísticas usadas para resolver problemas de otimização contínua e combinatória
- Aplicar as técnicas em problemas conhecidos da literatura e encontrados na indústria
- Na medida do possível, estudar e reproduzir testes computacionais de artigos científicos sobre o tema, publicados em periódicos


## Conteúdo

Principais metaheurísticas usadas na literatura recente (algoritmos genéticos, simulated annealing, busca tabu, colônia de formigas, outras metaheurísticas bio-inspiradas, GRASP, dentre outras).


## Referências principais

- [Gendreau, Michel, Potvin, Jean-Yves (Eds.) – Handbook of Metaheuristics. Springer, 2019](https://www.springer.com/us/book/9781441916631)
- [Glover, Kochenberger – Handbook of Metaheuristics. Kluwer, 2003.](https://www.springer.com/us/book/9780306480560)
- [Dréo, Pétrowski, Siarry e Taillard – Metaheuristics for Hard Optimization. Springer, 2006](https://doi.org/10.1007/3-540-30966-7)
- [Lopes, Rodrigues, Steiner (Eds.) – Meta-heurísticas em Pesquisa Operacional. Omnipax, 2013](http://omnipax.com.br/site/?page_id=220) ([PDF disponível](http://omnipax.com.br/livros/2013/MHPO/mhpo-livro.pdf))

Obs: outras referências são descritas a cada tópico estudado


## Formas de avaliação

Serão aplicadas no mínimo duas avaliações, dentre testes dissertativos, apresentações de seminários e/ou desenvolvimento de projetos.


## Critérios de avaliação

- > 25% faltas —–> reprovado(a) por falta
- Média parcial >= 7,0 —–> aprovado(a) (desde que não reprovado(a) por falta)
- Média parcial < 7,0 —–> Avaliação final (desde que não reprovado(a) por falta). Neste caso, média final >= 5,0 —–> aprovado(a)


<!--## Cálculo da média parcial

Igual ao **máximo** entre 10,0 e a média ponderada das atividades e apresentações:

(  (atividade 1)*1,0  +  (atividade 2)*2,0  +  (atividade 3)*3,0  +   média apres)*5,0  ) / 11

Assim, a nota final é no máximo 10, mesmo que a média das apresentações seja > 10.-->


# MATERIAIS PARA AS AULAS

## Linguagem de programação

A linguagem de referência é o Julia. Você pode encontrar instruções de instalação e uso [neste link](/julia/).

**Para auxiliá-lo na instalação do Julia pré-compilado + pré-requisitos + pacotes utilizados, baixe [ESTE SCRIPT](/files/metaheu/instalar_julia) e siga as instruções contidas nele (testado no Ubuntu 22.04)**

## Pacotes e códigos em Julia

- Pacote **TSPLIB.jl:** instâncias da biblioteca TSPLIB (problema do caixeiro viajante) prontas em Julia [site](https://github.com/matago/TSPLIB.jl). Veja tópico "O problema do caixeiro viajante" para detalhes.
- [**tspplot.jl:** código para plotar instâncias da TSPLIB](/files/metaheu/tspplot.jl)
- [**tsp.jl:** funções para manipulação de instâncias da TSPLIB e heurística do vizinho mais próximo](/files/metaheu/tsp.jl)
- [**funcoes-teste.jl:** funções para teste (para Differential Evolution e Particle Swarm Optimization)](/files/metaheu/funcoes-teste.jl)

## Apresentação

- [**SLIDES**](https://drive.google.com/file/d/1FPcIovf5He-djx_NMJut9Ki1bBvw40vX/view?usp=sharing)


## O problema do caixeiro viajante (Travelling Salesman Problem - TSP)

O problema do problema do caixeiro viajante (em inglês, *Travelling Salesman Problem* - TSP) serve como "saco de pancadas" para testarmos as implementações. O TSP é simples de entender, portanto não requer conhecimento profundo para começar a testar as metaheurísticas. Além disso, é um problema clássico e de difícil resolução.
- [Uma apresentação do TSP](https://en.wikipedia.org/wiki/Travelling_salesman_problem)
- [Slides de M.A.M. Carvalho (UFOP)](http://www.decom.ufop.br/marco/site_media/uploads/pcc104/antigo_21_aula_21.pdf)
- Instâncias para testes - Biblioteca TSPLIB 
    - As instâncias que utilizaremos são de **"TSP simétrico"**, isto é, o custo $c_{ij}$ para ir da cidade $i$ à cidade $j$ é o mesmo que da volta $j$ para $i$. Isso fornece uma matriz de custos simétrica, daí o nome.
    - Na TSPLIB você encontrará outros tipos de instâncias, como as que servem para problemas de roteamento de veículos com capacidade nos arcos. Não as usaremos neste curso!
    - **IMPORTANTE:** para termos foco, vamos considerar apenas instâncias cujo custo entre cidades é a distância Euclideana entre elas. Para saber se uma instância `tsp` proveniente do pacote `TSPLIB.jl` é deste tipo, verifique se `tsp.weight_type` é "EUC_2D"
    - [Lista de todas as instâncias da TSPLIB cujo custo é a distância euclideana](/files/metaheu/instancias_EUC_2D.txt)
    - Por curiosidade, as referências oficiais da TSPLIB são [este artigo](https://doi.org/10.1287/ijoc.3.4.376) e [arquivos originais](http://comopt.ifi.uni-heidelberg.de/software/TSPLIB95/)
- Visualização [on line](https://tspvis.com/) do funcionamento de algoritmos para o TSP.


## Sobre geradores de números randômicos

A geração de números randômicos em computador é um tópico pesquisado até hoje. Os principais algoritmos utilizados geram números "pseudo-randômicos", chamados assim por não serem verdadeiramente randômicos (os números se repetem em ciclos). Este não é um tópico central nessa disciplina, mas vale o comentário. No contexto das metaheurísticas, onde temos que gerar muitos números, é interessante utilizarmos bons geradores.

Cada linguagem adota um gerador como padrão. Por exemplo, o [Python 3 adota o *Mersenne Twister*](https://docs.python.org/3/library/random.html), um gerador proposto por M. Matsumoto e N. Makoto em 1998. Esse algoritmo é bastante utilizado e gera números com qualidade melhor comparados ao gerador padrão do C. No Julia, *Mersenne Twister* é implementado no pacote **Random.jl**.

O Julia (versão 1.8), por sua vez, [utiliza como padrão um excelente gerador, mais moderno, conhecido como **Xoshiro256++**](https://docs.julialang.org/en/v1/stdlib/Random/). Esse gerador foi proposto por D. Blackman e S. Vigna em 2018, é rápido e apresenta excelentes resultados em testes de qualidade. Assim, todas as chamadas de funções que retornam valores aleatórios (`rand`, `randperm` etc) usam este gerador por padrão (a menos que o usuário diga para usar outro gerador, claro). Os códigos apresentados nessa disciplina utilizam **Xoshiro256++**.

Para saber mais sobre geradores de número pseudo-aleatórios, consulte [este link](https://en.wikipedia.org/wiki/Pseudorandom_number_generator). Uma lista de diferentes geradores pode ser vista [neste link](https://pt.wikipedia.org/wiki/Gerador_de_n%C3%BAmeros_pseudoaleat%C3%B3rios).


## METAHEURÍSTICA 1: Busca Tabu (Tabu Search - TS)

- [**SLIDES**](https://drive.google.com/file/d/1AVM2-O65q1EVD7bq4LBRoJR1nRl-LQ9T/view?usp=sharing)
- **Tarefa computacional:** veja último *slide* do *link* acima
- Referência: capítulo 2 de Glover, Kochenberger – Handbook of Metaheuristics. Kluwer, 2003


## METAHEURÍSTICA 2: Simulated Annealing (SA)

- [**SLIDES**](https://drive.google.com/file/d/19VJ5y_Y6v8Dh7RovndMlxlzzTL40BiiL/view?usp=sharing)
- **Tarefa computacional:** veja último *slide* do *link* acima
- [**Seleção por roleta - SLIDES**](https://drive.google.com/file/d/1w32UcmfOWRv-5gh2hWXdAlsD4gbe_VqI/view?usp=sharing)
- Referência: capítulo 10 de Glover, Kochenberger – Handbook of Metaheuristics. Kluwer, 2003


## METAHEURÍSTICA 3: Colônia de formigas (Ant Colony Optimization - ACO)

- [**SLIDES**](https://drive.google.com/file/d/1_x7mVHBIfWV4l9cXr9Ju_Lo6CvBlDMtm/view?usp=sharing)
- **Tarefa computacional:** veja último *slide* do *link* acima
- [**Seleção por roleta - SLIDES**](https://drive.google.com/file/d/1w32UcmfOWRv-5gh2hWXdAlsD4gbe_VqI/view?usp=sharing)
- Referências:
    1. Dorigo, Gambardella. Ant colony system: a cooperative learning approach to the traveling salesman problem. IEEE Transactions on Evolutionary Computation, 1:53-66, 1997 [Link1](https://ieeexplore.ieee.org/document/585892) (acesso pela universidade) [Link2](https://people.idsia.ch/~luca/acs-ec97.pdf)
    1. Dorigo, Caro. Ant colony optimization: a new meta-heuristic. Proceedings of the 1999 Congress on Evolutionary Computation, 2002 [Link1](https://ieeexplore.ieee.org/document/782657/) (acesso pela universidade) [Link2](https://www.researchgate.net/publication/3810360_Ant_colony_optimization_A_new_meta-heuristic)
    1. Capítulo 9 de Glover, Kochenberger – Handbook of Metaheuristics. Kluwer, 2003


## DICAS PARA CALIBRAÇÃO DE PARÂMETROS

- [Código versão 1](https://drive.google.com/file/d/1Rz72-jm_O6qv8NBjWLx8HdZBHSydAKkX/view?usp=sharing)


## METAHEURÍSTICA 4: Evolução Diferencial (Differential Evolution - DE)

- [**SLIDES**](https://drive.google.com/file/d/1obXBLxFlhYt9IaBlRaMRuedDPlBrHh8U/view?usp=sharing)
- **Tarefa computacional:** veja último *slide* do *link* acima
- [**funcoes-teste.jl:** código Julia de funções para teste](/files/metaheu/funcoes-teste.jl) (descrição nas referências 1 e 2)
- Referências:
    1. Storn, Price. Differential Evolution - A Simple and Efficient Heuristic for global Optimization over Continuous Spaces. Journal of Global Optimization, 11:341-359, 1997 [Link](https://link.springer.com/article/10.1023/A:1008202821328) (acesso pela universidade)
    1. Feoktistov, Vitaliy. Differential Evolution - In Search of Solutions, Springer, 2006 [Link](https://www.springer.com/us/book/9780387368955) (acesso pela universidade)
    1. Brandão, Saramago. Métodos estocásticos de otimização: algoritmos genéticos e evolução diferencial, SBMAC, 2011 [Link](https://www.sbmac.org.br/wp-content/uploads/2022/08/livro_55.pdf)


## METAHEURÍSTICA 5: Nuvem de partículas (Particle Swarm Optimization - PSO)

- [**SLIDES**](https://drive.google.com/file/d/1kUMLRjPbqEZFLJosMY5o-5iEyDpWaxTm/view?usp=sharing)
- **Tarefa computacional:** veja último *slide* do *link* acima
- [**funcoes-teste.jl:** código Julia de funções para teste](/files/metaheu/funcoes-teste.jl)
- Referências:
    1. Kennedy, Eberhart, Shi. Swarm Intelligence. Morgan Kaufmann, 2001 [Link](https://www.sciencedirect.com/book/9781558605954/swarm-intelligence)
    1. Shi, Eberhart. A modified particle swarm optimizer. 1998 IEEE International Conference on Evolutionary Computation Proceedings, 1998 [Link](https://doi.org/10.1109/ICEC.1998.699146)


## METAHEURÍSTICA 6: Algoritmo Genético (Genetic Algorithm - GA)

- [**SLIDES**](https://drive.google.com/file/d/1_yA_vAVXy_jHswyiXab9mf7RVBYtVfpe/view?usp=sharing)
- **Tarefa computacional:** veja último *slide* do *link* acima
- [**Seleção por roleta - SLIDES**](https://drive.google.com/file/d/1w32UcmfOWRv-5gh2hWXdAlsD4gbe_VqI/view?usp=sharing)
- Referências:
    1. Capítulo 5 de Gendreau, Michel, Potvin, Jean-Yves (Eds.) – Handbook of Metaheuristics. Springer, 2019
    1. Hussain, Muhammad, Sajid, Hussain, Shoukry, Gani. Genetic Algorithm for Traveling Salesman Problem with Modified Cycle Crossover Operator. Computational Intelligence and Neuroscience, 2017 [Link](https://www.hindawi.com/journals/cin/2017/7430125/)
    1. Slides de Estéfane G. M. de Lacerda (UFRN), 2008/2009
    1. Capítulo 2 de Lopes, Rodrigues, Steiner (Eds.) – Meta-heurísticas em Pesquisa Operacional. Omnipax, 2013


## METAHEURÍSTICA 7: GRASP (Greedy Randomized Adaptive Search Procedure)

- **SLIDES**
- **Tarefa computacional:** veja último *slide* do *link* acima
- Referência: capítulo 8 de Glover, Kochenberger – Handbook of Metaheuristics. Kluwer, 2003
- Outros conteúdos:
    - [Slides do prof. Lucas Batista (UFMG)](http://www.cpdee.ufmg.br/~lusoba/disciplinas/eee933/slides/lusoba/13_GRASP.pdf)
    - [Outros slides](https://drive.google.com/file/d/1pUrwz80FL-kh61fIKWNDtDP5MbuYzfW1/view?usp=sharing)

<!--- **[Código Matlab/Octave de um GRASP para o TSP](https://drive.google.com/file/d/1ZdYhhQHka7aDrDlxtwvtuMIp6gVv-pHv/view?usp=sharing)**  
    _Fonte: [https://github.com/warloff/GRASP-for-Traveling-Salesman](https://github.com/warloff/GRASP-for-Traveling-Salesman)_-->


## Pacotes de terceiros

- Pacote **Metaheuristics.jl:** implementação em Julia de várias metaheurísticas. [Site](https://github.com/jmejia8/Metaheuristics.jl).


## OUTRAS METAHEURÍSTICAS

### Gravitational Search Algorithm

- [Rashedi, Nezamabadi-pour, Saryazdi. GSA: A Gravitational Search Algorithm. Information Sciences, 179(13):2232-2248, 2009](https://doi.org/10.1016/j.ins.2009.03.004)
- Para minimização de funções a variáveis contínuas
- Presente no pacote **Metaheuristics.jl**

### Evolutionary Centers Algorithm

- [Mejía-de-Dios, Mezura-Montes. A New Evolutionary Optimization Method Based on Center of Mass. In: Deep, K., Jain, M., Salhi, S. (eds) Decision Science in Action. Asset Analytics. Springer, Singapore, 2019](https://doi.org/10.1007/978-981-13-0860-4_6)
- Para minimização de funções a variáveis contínuas
- Presente no pacote **Metaheuristics.jl**


## Leitura(s) recomendada(s)

- [Análise de Sörensen sobre a profusão de artigos nos últimos anos e seu rigor científico](https://onlinelibrary.wiley.com/doi/full/10.1111/itor.12001)  
    Uma versão com acesso aberto está disponível [neste link](https://www.researchgate.net/publication/237009138_Metaheuristics_--_the_metaphor_exposed).

## Materiais de terceiros

- [Vídeo-aulas do prof. Bruno Prata (Eng. Produção/UFC)](https://www.youtube.com/watch?v=KxodOzWXKr4&list=PLu8hAanCQCJrVubIw9c5RAQXyWAn95qEe)
- [Slides do prof. Lucas Batista (Eng. Elétrica/UFMG)](http://www.cpdee.ufmg.br/~lusoba/disciplinas/eee933/slides/lusoba/)


# ATIVIDADES

## Atividade avaliativa 1

**ATIVIDADE para a semana entre 27/03 e 31/03**, a ser discutida entre todos na aula do dia 06/04

Pesquise metaheurísticas na internet/artigos. Para cada metaheurística encontrada, faça uma descrição contendo:
- A inspiração (fenômeno físico, natural, animal etc)
- Em qual(is) problema(s) foi aplicada, evidenciando se o problema é de otimização contínua (variáveis todas contínuas) ou combinatória
- Uma descrição sucinta do funcionamento do algoritmo
- Não esqueça de indicar a referência da qual retirou as informações!
- **Relatórios apresentados:** [Giuliano](https://drive.google.com/file/d/1Y4KT2OzTxWfClYa5gHhVSZWnwO2ItyXe/view?usp=sharing); [João José](https://drive.google.com/file/d/1_h7GOHeosYQ4zvecBJdDVNToBq0zzpzt/view?usp=sharing); [Wemble](https://drive.google.com/file/d/15jaRjuznLlMtoj2ZapYIBOgRqFsBofR3/view?usp=sharing); [Pedro Lucas](https://drive.google.com/file/d/1do5xYzwOLqI2ptsvzv9O8j7wTGMjtRvu/view?usp=sharing)


## Atividade 1

1. Instale o Julia (caso não instalado)
1. Instale o pacote `TSPLIB.jl`
1. Carregue a instância `berlin52` e teste a função de `tspplot` obtida [neste link](/files/metaheu/tspplot.jl)
1. Implemente a função de custo (distância euclideana do percurso)
1. Implemente a busca **gulosa** pelo vizinho mais próximo (Nearest Neighbor search -- NN). Veja detalhes [neste link](https://pt.wikipedia.org/wiki/Algoritmo_do_vizinho_mais_pr%C3%B3ximo)
1. Plote soluções obtidas por NN e compare com o valor ótimo (gravado em `tsp.optimal`)
1. Implementar a heurística 2-OPT. Veja detalhes [neste link](https://en.wikipedia.org/wiki/2-opt). Use NN para inicializar. Comparar solução com anteriores.


## Atividade avaliativa 2

Serão avaliadas as implementações de **todas as metaheurísticas** apresentadas durante a disciplina. Cada aluno será "entrevistado" indivualmente, onde mostrará ao professor o que fez, executará testes e responderá à eventuais perguntas do professor. Não é necessário fazer *slides* para uma apresentação, a conversa será feita em frente ao computador. No entanto, **o(a) estudante deverá organizar o roteiro de sua fala, testes que apresentará, dificuldades enfrentadas etc.**

- Nota máxima: **10,0 pontos**
- Período das avaliações: **a definir**

**Critérios considerados na avaliação:**

- Profundidade, clareza e organização da apresentação;
- Domínio do assunto;
- Coerência dos testes numéricos.


## Atividade avaliativa 3

Apresentação de um artigo selecionado. Cada estaudante escolherá um artigo e fará uma apresentação explicando:

- o problema estudado, sua aplicação;
- a metodologia de resolução (metaheurística usada/adaptada pelo(s) autore(s));
- detalhes da representação dos dados;
- detalhes do funcionamento do algoritmo;
- discussão dos testes numéricos apresentados.

*O(A) estudante pode escolher um artigo da lista sugerida abaixo ou um artigo de sua preferência. No último caso, o artigo dependerá do aval do professor.*

**Critérios de pontuação da apresentação:**

- Qualidade da apresentação (slides, material digital ou impresso…)
- Organização das ideias e sequência lógica do assunto
- Domínio do assunto
- Postura, naturalidade, dinamismo e interação diante da plateia
- Uso de linguagem apropriada; uso correto da língua portuguesa
- Clareza e dicção
- Adequação ao tempo pré-determinado

**Critérios de avaliação:**

- Cada apresentação receberá nota de 0 a 10, seguindo os pontos elencados acima;
- O trabalho pode ser **individual** ou em **dupla**;
- As apresentações deverão ser em dia e horário das aulas;
- **O tempo máximo de cada apresentação corresponde às aulas do dia, ou seja, 2h 00min;**
- Período das apresentações: **a definir**

**Artigos selecionados:**

[**A Hybrid Grouping Genetic Algorithm for the Multiple-Type Access Node Location Problem**](https://link.springer.com/chapter/10.1007/978-3-642-04394-9_46)  
O. Alonso-Garrido, S. Salcedo-Sanz, L.E. Agustín-Blas, E.G. Ortiz-García, A.M. Pérez-Bellido, J.A. Portilla-Figueras.

* * *

[**A simple and robust Simulated Annealing algorithm for scheduling workover rigs on onshore oil fields**](https://www.sciencedirect.com/science/article/pii/S0360835210003220)  
G.M. Ribeiro, G.R. Mauri, L.A.N. Lorena

* * *

[**A simple and effective genetic algorithm for the two-stage capacitated facility location problem**](https://www.sciencedirect.com/science/article/pii/S0360835214001764)  
D.R.M. Fernandes, C. Rocha, D. Aloise, G.M. Ribeiro, E.M. Santos, A. Silva

<!--_Instâncias para testes: [https://www.gerad.ca/~aloise/publications.html](https://www.gerad.ca/~aloise/publications.html)_-->

* * *

[**A greedy randomized adaptive search procedure for the point-feature cartographic label placement**](https://www.sciencedirect.com/science/article/pii/S0098300407001033)  
G.L. Cravo, G.M. Ribeiro, L.A.N. Lorena

_Instâncias para testes: [http://www.lac.inpe.br/~lorena/instancias.html](http://www.lac.inpe.br/~lorena/instancias.html)  (seção “Map labeling”)_

* * *

[**Simulated annealing and tabu search approaches for the Corridor Allocation Problem**](https://www.sciencedirect.com/science/article/abs/pii/S0377221713005808)  
H. Ahonen, A.G.de Alvarenga, A.R.S. Amaral.

<!--_Instâncias para testes: (tabelas C.4, C.5 e C.6 do artigo) [CAP-Amaral 2012](#)  
Instâncias tratadas para Octave: [CAP-Amaral_m](#)_-->

* * *

[**A Biased Random-Key Genetic Algorithm for the Traffic Counting Location Problem**](https://ieeexplore.ieee.org/abstract/document/8923993)  
G. Clímaco, P.H. Gonzalez, G.M. Ribeiro, G.R. Mauri, L. Simonetti

* * *

[**Four-bar Mechanism Synthesis for n Desired Path Points Using Simulated Annealing**](https://link.springer.com/chapter/10.1007/978-3-540-72960-0_2)  
H. Martínez-Alfaro

* * *

[**Dynamic Load Balancing Using an Ant Colony Approach in Micro-cellular Mobile Communications Systems**](https://link.springer.com/chapter/10.1007/978-3-540-72960-0_7)  
S.-S. Kim, A.E. Smith, S.-J. Hong

* * *

[**Tabu Search Heuristic for Point-Feature Cartographic Label Placement**](https://link.springer.com/article/10.1023%2FA%3A1013720231747)  
M. Yamamoto, G. Camara, L.A.N. Lorena

* * *

[**A GRASP algorithm for solving large-scale single row facility layout problems**](https://www.sciencedirect.com/science/article/abs/pii/S0305054819300486)  
G.L. Cravo, A.R.S. Amaral

* * *

[**Single row facility layout problem using a permutation-based genetic algorithm**](https://www.sciencedirect.com/science/article/abs/pii/S0377221711002712)  
D. Datta, A.R.S. Amaral, J.R. Figueira

* * *

[**Coevolutionary Genetic Algorithm to Solve Economic Dispatch**](https://link.springer.com/chapter/10.1007/978-3-540-72960-0_15)  
M.M.A. Samed, M.A.S.S. Ravagnani

* * *

[**GSA: A Gravitational Search Algorithm**](https://doi.org/10.1016/j.ins.2009.03.004)  
Rashedi, Nezamabadi-pour, Saryazdi

* * *

[**A New Evolutionary Optimization Method Based on Center of Mass**](https://doi.org/10.1007/978-981-13-0860-4_6)  
Mejía-de-Dios, Mezura-Montes

* * *

<!--**_Outros artigos:_**

[Artigo 1](https://link.springer.com/chapter/10.1007/978-3-540-72960-0_15)

* * *

[Artigo 2](https://ieeexplore.ieee.org/document/992068/)

* * *

[Artigo 4](https://www.sciencedirect.com/science/article/pii/S0305054811001298)-->



<!--## Atividade 2

1. Baixe o arquivo [`CreateNNSolution.m`](https://drive.google.com/file/d/1a-VuWkyhnspiovRiGUXO8KBXVjiyRGhg/view?usp=sharing) no mesmo diretório da busca tabu. Ele contém uma função para cálculo de uma solução do TSP através da heurística de vizinho mais próximo (NN - *Nearest Neighbor*)
1. Use NN para criar a solução inicial para a busca tabu. Você pode trocar a permutação inicial randomizada em `ts.m` pela linha
~~~
sol.Position=CreateNNSolution(model);
~~~
1. Rode a "busca tabu" para `berlin52.tsp` e compare a execução com permutação inicial aleatória
1. Implemente o seguinte critério de parada adicional: **"Pare se durante 10 iterações consecutivas a função objetivo não melhora"**
1. Execute seu código para algumas instâncias da TSPLIB e decida se é efetivo na resolução (use as instâncias editadas [deste arquivo](https://drive.google.com/file/d/1kchXGAtTER8-l6vAy1Q78QTe8m_ZJxJd/view?usp=sharing)). Compare os custos obtidos com os melhores reportados na literatura ([veja-os aqui](http://elib.zib.de/pub/mp-testdata/tsp/tsplib/stsp-sol.html)).
1. Obs: talvez você precise aumentar o número máximo de iterações para instâncias maiores...-->

<!--- Baixe o arquivo ZIP com o código do Simulated Annealing (aula 14/08 acima);
- Na aula vimos o método padrão aplicado ao TSP. Execute a versão com populações (diretório “02 TSP using SA (Population-Based)”);
- Se familiarize com o código. Ele é muito parecido com o visto em aula. Mude parâmetros e entenda os efeitos;
- Compare o comportamento das duas versões. Rode para o problema brinquedo e para o problema “berlin52.tsp” (copie o arquivo da pasta do método padrão e ajuste a criação do modelo);
- **TAREFA – Faça um pequeno relatório que:**
    - Pontue as diferenças entre as duas estratégias. Explique o que a estratégia por populações tenta fazer que a estratégia padrão tem dificuldade;
    - Compare os gráficos gerados pelos algoritmos para o valor da função objetivo e tire conclusões acerca da qualidade das soluções e da velocidade de decrescimento da função objetivo;
    - Faça seus testes também com o problema “berlin52.tsp”-->

<!--## Atividade 3-->

<!--- **Objetivo: programar um Algoritmo Genético (AG) para resolver o TSP; familiarizar-se com ajuste de parâmetros, testes numéricos, etc.**
- Escolha 2 mutações e 2 crossover’s para comparar (veja slides da aula de 23/08)
- Faça um AG preferencialmente em Octave. As funções e estrutura para o TSP estão prontas nos códigos de aulas anteriores. USE-OS!
- Faça testes para ajustar parâmetros e comparar diferentes mutações e crossover’s.
- <span style="color: #ff0000">Utilize em seus testes problemas da TSPLIB, arquivo</span> [TSPLIB_modif](https://drive.google.com/file/d/1kchXGAtTER8-l6vAy1Q78QTe8m_ZJxJd/view?usp=sharing). Esses problemas foram adaptados para o código do Octave já apresentado.
- Os valores ótimos de cada problema podem ser encontrados [aqui](https://www.iwr.uni-heidelberg.de/groups/comopt/software/TSPLIB95/STSP.html).
- **<span style="color: #ff0000">Fazer um relatório e entregar os códigos. O trabalho é individual.</span>**-->


<!--## Atividade 3

Esta atividade consiste na apresentação, pelo aluno, de um artigo selecionado. Cada aluno escolherá um artigo e fará uma apresentação explicando:

- o problema estudado, sua aplicação;
- a metodologia de resolução (metaheurística usada/adaptada pelo(s) autore(s));
- detalhes da representação dos dados;
- detalhes do funcionamento do algoritmo;
- discussão dos testes numéricos apresentados.-->
<!--- reprodução, pelo menos parcial, dos testes numéricos. O aluno deverá programar o método e realizar os testes, comparando com os testes relatados no artigo (pode-se utilizar os códigos das aulas ou outros que estiverem disponíveis na internet, em qualquer linguagem de programação).-->

<!--_**Critérios de pontuação da apresentação:**_

- Qualidade da apresentação (slides, material digital ou impresso…)
- Organização das ideias e sequência lógica do assunto
- Domínio do assunto
- Postura, naturalidade, dinamismo e interação diante da plateia
- Uso de linguagem apropriada; uso correto da língua portuguesa
- Clareza e dicção
- Adequação ao tempo pré-determinado
- Coerência dos testes numéricos

**_Critérios de avaliação:_**

- Cada apresentação receberá nota de 0 a 10, seguindo os pontos elencados acima;
- O trabalho pode ser individual ou em dupla;  
    No entanto, o trabalho pode ser apresentado antes. O grupo deve informar ao professor a data da apresentação.
- As apresentações deverão ser em dia e horário das aulas;
- **O tempo de cada apresentação corresponde às aulas do dia, ou seja, 1h 40min;**
- <span style="color: #ff0000">**—— O grupo pode apresentar mais de um artigo ——**</span>  
    <span style="color: #0000ff">**Neste caso, cada apresentação adicional valerá 5,0 pontos a mais que a anterior. Por exemplo, a primeira (obrigatória) vale 10,0 pontos, a segunda 15,0, a terceira 20,0 …**</span>  
    <span style="color: #ff0000">O grupo deverá informar ao professor das apresentações adicionais.  
    TODAS as apresentações deverão respeitar a data limite 29 de novembro.</span>

_Obs.: se o grupo quiser disponibilizar algum material de apoio à sua apresentação nesta página, basta informar ao professor!_

_**Média final das apresentações:**_

- A média final M.ap das apresentações será a média aritmética das notas de cada apresentação:  
    <span style="color: #0000ff">**M.ap = (ap.1 + ap.2 + ap.3 + …) / n**</span>
- Observe que é possível   M.ap > 10   caso o grupo realize mais de uma apresentação.
-->

