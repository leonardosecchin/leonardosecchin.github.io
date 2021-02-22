---
layout: archive
title: "Metaheurísticas"
permalink: /metaheuristicas/
author_profile: true
---

## Horários das aulas síncronas

- Quintas-feiras de 7:30 as 8:30
- Terças-feiras de 11:00 as 12:00

## Ementa

Ementa variável.

## Conteúdo

Principais metaheurísticas usadas na literatura recente (algoritmos genéticos, simulated annealing, busca tabu, colônia de formigas, outras metaheurísticas bio-inspiradas, GRASP, dentre outras).

## Textos de referência

*   [Gendreau, Michel, Potvin, Jean-Yves (Eds.) Handbook of Metaheuristics. Springer, 2019](https://www.springer.com/us/book/9781441916631)
*   [Glover, Kochenberger – Handbook of Metaheuristics. Kluwer, 2003.](https://www.springer.com/us/book/9780306480560)
*   Dréo, Pétrowski, Siarry e Taillard – Metaheuristics for Hard Optimization. Springer, 2005
*   [Meta-heurísticas em Pesquisa Operacional](http://omnipax.com.br/site/?page_id=220) ([PDF disponível](http://omnipax.com.br/livros/2013/MHPO/mhpo-livro.pdf))

## ATENÇÃO: Turma 2020/2E

No segundo semestre letivo especial de 2020, as informações, material de estudo, tarefas, avaliações e aulas gravadas estarão disponíveis pelo Ambiente Virtual de Aprendizagem (AVA-UFES), [NESTE LINK](https://ava.ufes.br/course/view.php?id=16083). O(a) aluno(a) deverá fazer login com sua senha do portal do aluno para ter acesso ao curso.

Se você é aluno(a) da disciplina e não consegue ter acesso ao AVA-UFES, solicite acesso enviando email para [leonardo.secchin@ufes.br](mailto:leonardo.secchin@ufes.br) contendo seu **nome completo** e **endereço de email @edu.ufes.br**.

## Formas de avaliação

Serão aplicadas no mínimo duas avaliações, dentre testes dissertativos, apresentações de seminários e/ou desenvolvimento de projetos. A média parcial para aprovação é sete, e final, cinco.

## Critérios de avaliação

- Média parcial >= 7,0 —–> aprovado(a) (desde que não reprovado(a) por falta)
- Média parcial < 7,0 —–> Avaliação final (desde que não reprovado(a) por falta). Neste caso, média final >= 5,0 —–> aprovado(a).

## Cálculo da média parcial

Em breve.

<!--Igual ao **máximo** entre 10,0 e a média ponderada das atividades e apresentações:

(  (atividade 1)*1,0  +  (atividade 2)*2,0  +  (atividade 3)*3,0  +   média apres)*5,0  ) / 11

Assim, a nota final é no máximo 10, mesmo que a média das apresentações seja > 10.-->


# MATERIAIS PARA AS AULAS

## Linguagens de programação

*   Os códigos e as aulas serão baseados em códigos **Octave**.
    - Em distrituições GNU/Linux como Ubuntu e Mint, Octave está disponível via repositório. Você deverá instalar o pacote principal ``octave``. Comandos específicos estão disponíveis em outros pacotes com nomes ``octave-X``, tais como ``octave-optim`` (algoritmos para otimização irrestrita), ``octave-nlopt`` (algoritmos para otimização restrita), ``octave-ga`` (um algoritmo genético pronto), e muitos outros. Instale os pacotes que for usar (aqueles necessários no curso serão indicados).
    - No Windows, você pode baixar o Octave [neste link](https://www.gnu.org/software/octave/index).
    - [**Documentação do Octave**](https://www.gnu.org/software/octave/doc/latest).

*   Outras linguagens podem ser usadas, como o Python. Uma outra opção é o Julia. Você pode encontrar instruções de instalação e uso [neste link](/julia/). Se for usar outras linguagens, tente não ser muito exótico(a) ;)


## Apresentação

*   Apresentação (slides no AVA)
*   **Atividade 1 para entrega** (veja o AVA)


## O problema do caixeiro viajante

Todos os códigos apresentados neste curso são feitos para resolver o problema do caixeiro viajante (em inglês, *Travelling Salesman Problem* - TSP). Desta forma, podemos focar nos métodos. o TSP é um problema clássico e de difícil resolução. Ele servirá como "saco de pancadas" para os métodos.
*   [Uma apresentação do TSP](https://en.wikipedia.org/wiki/Travelling_salesman_problem)
*   [Slides de M.A.M. Carvalho (UFOP)](http://www.decom.ufop.br/marco/site_media/uploads/pcc104/antigo_21_aula_21.pdf)
*   [Instâncias para testes - Biblioteca TSPLIB](http://elib.zib.de/pub/mp-testdata/tsp/tsplib/tsplib.html) ([outro link](http://comopt.ifi.uni-heidelberg.de/software/TSPLIB95/))
    * As instâncias que utilizaremos estão na seção **"Symmetric traveling salesman problem"** do link acima. O termo "simétrico" quer dizer que o custo $c_{ij}$ para ir da cidade $i$ à cidade $j$ é o mesmo que da volta $j$ para $i$. Isto é, $c_{ij}=c_{ji}$ para todos $i\neq j$. Isso fornece uma matriz de custos simétrica, daí o nome.
    * Na TSPLIB você encontrará outros tipos de instâncias, como as que servem para problemas de roteamento de veículos com capacidade nos arcos. Não as usaremos neste curso, fica como dica se você precisar de boas instâncias em seus estudos futuros!
    * [Referência oficial](https://doi.org/10.1287/ijoc.3.4.376) da TSPLIB.
* **IMPORTANTE:** Somente instâncias definidas pela localização das cidades no plano são suportadas pelos códigos Octave/Matlab do curso (TSP Euclideano). Um exemplo é a instância `berlin52.tsp`. Neste caso, as linhas que não contém localização de cidades nos arquivos `.tsp` devem ser excluídas para funcionar.
    * Para facilitar, [este link](https://drive.google.com/file/d/1kchXGAtTER8-l6vAy1Q78QTe8m_ZJxJd/view?usp=sharing) contém algumas instâncias já editadas para os códigos Octave/Matlab.
    * Se você usa o Julia, existe um pacote em fase de testes para leitura de arquivos `.tsp` [neste link](https://github.com/matago/TSPLIB.jl).
* Visualização [on line](https://tspvis.com/) do funcionamento de algoritmos para o TSP.


## Busca Tabu

*   **[Código Matlab/Octave](https://drive.google.com/file/d/1umgrhf6QrPpQtbnYkpACRtFQCwJWKoK_/view?usp=sharing) (código comentado)**  
    _Fonte: [http://yarpiz.com/243/ypea116-tabu-search](http://yarpiz.com/243/ypea116-tabu-search)_
*   Referência: cap 2 do livro de Glover
*   [Slides de Andrea Roli](https://www.researchgate.net/profile/Andrea_Roli/publication/228746637_An_introduction_to_Metaheuristics/links/54b65e620cf2bd04be3202c0/An-introduction-to-Metaheuristics.pdf)
*   Curiosidade: busque no Google “tabu search papers” e veja a quantidade de pesquisa usando a técnica!

## Simulated Annealing

*   **[Código Matlab/Octave](https://drive.google.com/file/d/1HADurl67sMhoggwrzxWhSWyfGPKVPjhT/view?usp=sharing) (código comentado)**  
    _Fonte: [http://yarpiz.com/223/ypea105-simulated-annealing](http://yarpiz.com/223/ypea105-simulated-annealing)_  
    _Obs: o pacote `octave-statistics` é necessário para este código_
*   Referência: cap 10 do livro de Glover
*   [Slides de Andrea Roli](https://www.researchgate.net/profile/Andrea_Roli/publication/228746637_An_introduction_to_Metaheuristics/links/54b65e620cf2bd04be3202c0/An-introduction-to-Metaheuristics.pdf)
<!--*   **Atividade 2 (ver abaixo)**-->


## Ant Colony (Colônia de formigas)

*   **[Código Matlab/Octave](https://drive.google.com/file/d/1cQ5wtYWb1_JscJSKOG6YiHG5wYY-Vapg/view?usp=sharing) (código comentado)**  
    _Fonte: [http://yarpiz.com/53/ypea103-ant-colony-optimization](http://yarpiz.com/53/ypea103-ant-colony-optimization)_
*   Referências:
    *   cap 9 do livro de Glover
    *   Dorigo; Caro. Ant colony optimization: a new meta-heuristic. [Link1](https://ieeexplore.ieee.org/document/782657/) (acesso pela universidade) [Link2](https://www.researchgate.net/publication/3810360_Ant_colony_optimization_A_new_meta-heuristic)
*   [Slides de Andrea Roli](https://www.researchgate.net/profile/Andrea_Roli/publication/228746637_An_introduction_to_Metaheuristics/links/54b65e620cf2bd04be3202c0/An-introduction-to-Metaheuristics.pdf)


## Evolução Diferencial

*   **[Código Matlab/Octave](https://drive.google.com/file/d/12NKXXIfaK94O4ei6N2qjcqvjftKJu4Hm/view?usp=sharing) (código comentado)**
    _Fonte: [http://yarpiz.com/231/ypea107-differential-evolution](http://yarpiz.com/231/ypea107-differential-evolution)_
*   [Artigo que definiu o método, pela primeira vez](https://link.springer.com/article/10.1023/A:1008202821328) (baixe pela universidade)
*   [Slides de Andrea Roli](https://www.researchgate.net/profile/Andrea_Roli/publication/228746637_An_introduction_to_Metaheuristics/links/54b65e620cf2bd04be3202c0/An-introduction-to-Metaheuristics.pdf) (introdução geral sobre metaheurísticas)
*   [**Slides de Kelly Fleetwood**](http://www.maths.uq.edu.au/MASCOS/Multi-Agent04/Fleetwood.pdf)** (exclusivamente sobre evolução diferencial)**
*   Evolução diferencial é uma técnica da classe dos Algoritmos Evolucionários. Essa classe é amplamente estudada. Veja alguns livros dedicados exclusivamente ao assunto:
    *   [Artigo 1](https://www.springer.com/us/book/9780387221960)
    *   [Artigo 2](https://www.springer.com/la/book/9781849961288)
    *   **Um livro somente sobre Evolução Diferencial: **[**Feoktistov, Vitaliy. Differential Evolution – In Search of Solutions, Springer, 2006.**](https://www.springer.com/us/book/9780387368955)
    *   Uma referência em português: [Brandão, Saramago. Métodos estocásticos de otimização: algoritmos genéticos e evolução diferencial, SBMAC, 2011.](http://www.sbmac.org.br/arquivos/notas/livro_55.pdf)
*   **Funções-teste (retirado da terceira referência acima): **[**metah.funcoes-teste**](http://blog.ufes.br/leonardosecchin/files/2018/08/metah.funcoes-teste.pdf)


## Algoritmos Genéticos

*   [Slides de Estéfane Lacerda (UFRN)](https://www.dca.ufrn.br/~estefane/metaheuristicas/index.html) – somente slides 1, 2, 3 e 6
*   Slides editados (para aula): [1\. ag_binario](https://drive.google.com/file/d/1SCOCEyOHZmUgHga-J8IYPdX2UrlxZ2jz/view?usp=sharing) ; [2\. ag_tsp](https://drive.google.com/file/d/1jftC9l-HwpB0PYON3YwYrN2lP87aUBsg/view?usp=sharing)
*   [Artigo com explicação de operadores para o TSP](https://www.hindawi.com/journals/cin/2017/7430125/)
*   Apresentação detalhada de alguns crossovers para o TSP: [PMX](http://www.rubicite.com/Tutorials/GeneticAlgorithms/CrossoverOperators/PMXCrossoverOperator.aspx/), [Cycle](http://www.rubicite.com/Tutorials/GeneticAlgorithms/CrossoverOperators/CycleCrossoverOperator.aspx)
<!--*   **Atividade 3 (ver abaixo)**-->


## Particle Swarm (Nuvem de partículas)

*   **[Código Matlab/Octave](https://drive.google.com/file/d/1q9W2SjF0vXIX4dfD55jBool1RvXPSSxI/view?usp=sharing) (código comentado).**  
    _Fonte: [http://yarpiz.com/50/ypea102-particle-swarm-optimization](http://yarpiz.com/50/ypea102-particle-swarm-optimization)_
*   [Slides editados de Estéfane Lacerda, UFRN](https://drive.google.com/file/d/1ENpP6vWD6Qj-HteDyRq47HT3OgS2EvKq/view?usp=sharing) (apresentados em aula); slides originais [aqui](http://www.dca.ufrn.br/~estefane/metaheuristicas/pso.pdf)
*   [Vídeo-aulas do projeto Yarpiz (em inglês)](http://yarpiz.com/440/ytea101-particle-swarm-optimization-pso-in-matlab-video-tutorial). Veja a parte 1/3 para explicação do algoritmo.
*   [Slides resumidos com “equações de movimento”](https://drive.google.com/file/d/1TDujiXzrHaolRYQilgXdzhBSsCKBfX58/view?usp=sharing) (editadas a partir de slides do projeto Yarpiz — [originais aqui](http://yarpiz.com/wp-content/uploads/2016/05/yarpiz-ytea101-notes.pdf))


## GRASP

*   **[Código Matlab/Octave de um GRASP para o TSP](https://drive.google.com/file/d/1ZdYhhQHka7aDrDlxtwvtuMIp6gVv-pHv/view?usp=sharing)**  
    _Fonte: [https://github.com/warloff/GRASP-for-Traveling-Salesman](https://github.com/warloff/GRASP-for-Traveling-Salesman)_
*   [Slides](https://drive.google.com/file/d/1pUrwz80FL-kh61fIKWNDtDP5MbuYzfW1/view?usp=sharing)
*   [Problemas TSP adaptados ao código de GRASP](https://drive.google.com/file/d/1kZdt_S4vJScXHIa4PRQ7-LQgBZzF3jo9/view?usp=sharing)
*   Referências:
    *   cap 8 do livro de Glover


## Leitura(s) recomendada(s)

*   [Análise de Sörensen sobre a profusão de artigos nos últimos anos e seu rigor científico](https://onlinelibrary.wiley.com/doi/full/10.1111/itor.12001)  
    Uma versão com acesso aberto está disponível [neste link](https://www.researchgate.net/publication/237009138_Metaheuristics_--_the_metaphor_exposed).


# ATIVIDADES

## Atividade 1 – Metaheurísticas, apresentação

*   Faça um resumo, **com suas palavras**, da introdução do livro de Dréo, Pétrowski, Siarry e Taillard, [disponível aqui](https://drive.google.com/file/d/1fqU2s6RCj4ixt1MkGzb0yLPjjcQr2JCm/view?usp=sharing). Diga o que entendeu, destaque os pontos que achou relevante, críticas, etc.
*   O trabalho poderá ser feito de próprio punho ou digitado, entregue pela plataforma AVA.
*   Um resumo de no mínimo 1 página é desejável. Não é para traduzir o texto!

## Atividade 2

1. Baixe o arquivo [`CreateNNSolution.m`](https://drive.google.com/file/d/1a-VuWkyhnspiovRiGUXO8KBXVjiyRGhg/view?usp=sharing) no mesmo diretório da busca tabu. Ele contém uma função para cálculo de uma solução do TSP através da heurística de vizinho mais próximo (NN - *Nearest Neighbor*)
1. Use NN para criar a solução inicial para a busca tabu. Você pode trocar a permutação inicial randomizada em `ts.m` pela linha
~~~
sol.Position=CreateNNSolution(model);
~~~
1. Rode a "busca tabu" para `berlin52.tsp` e compare a execução com permutação inicial aleatória
1. Implemente o seguinte critério de parada adicional: **"Pare se durante 10 iterações consecutivas a função objetivo não melhora"**
1. Execute seu código para algumas instâncias da TSPLIB e decida se é efetivo na resolução (use as instâncias editadas [deste arquivo](https://drive.google.com/file/d/1kchXGAtTER8-l6vAy1Q78QTe8m_ZJxJd/view?usp=sharing)). Compare os custos obtidos com os melhores reportados na literatura ([veja-os aqui](http://elib.zib.de/pub/mp-testdata/tsp/tsplib/stsp-sol.html)).
1. Obs: talvez você precise aumentar o número máximo de iterações para instâncias maiores...

<!--*   Baixe o arquivo ZIP com o código do Simulated Annealing (aula 14/08 acima);
*   Na aula vimos o método padrão aplicado ao TSP. Execute a versão com populações (diretório “02 TSP using SA (Population-Based)”);
*   Se familiarize com o código. Ele é muito parecido com o visto em aula. Mude parâmetros e entenda os efeitos;
*   Compare o comportamento das duas versões. Rode para o problema brinquedo e para o problema “berlin52.tsp” (copie o arquivo da pasta do método padrão e ajuste a criação do modelo);
*   **TAREFA – Faça um pequeno relatório que:**
    *   Pontue as diferenças entre as duas estratégias. Explique o que a estratégia por populações tenta fazer que a estratégia padrão tem dificuldade;
    *   Compare os gráficos gerados pelos algoritmos para o valor da função objetivo e tire conclusões acerca da qualidade das soluções e da velocidade de decrescimento da função objetivo;
    *   Faça seus testes também com o problema “berlin52.tsp”-->

## Trabalho computacional 1

O trabalho pode ser feito individualmente ou em dupla.

Nota máxima: **10,0 pontos**

Data limite para entrega: **15 de março**

Critério de avaliação: análise do relatório PDF enviado.

**Leia atentamente o PDF no link abaixo antes de qualquer teste numérico!**

[*** TRABALHO 1 ***](https://drive.google.com/file/d/1xd__iqTUhQD0_nLobUsuO0Kk0Wu-8lxn/view)

**Arquivos auxiliares:**

- [Código heurística NN - Nearest Neighbor](https://drive.google.com/file/d/1a-VuWkyhnspiovRiGUXO8KBXVjiyRGhg/view)
- [Código da heurística 2-OPT](https://drive.google.com/file/d/1IdEeljHysvkf3BzkUmqW2j59GGkiOPM3/view)
- [Instâncias TSP Euclidiano](https://drive.google.com/file/d/1kchXGAtTER8-l6vAy1Q78QTe8m_ZJxJd/view)



## Atividade 3

<!--*   **Objetivo: programar um Algoritmo Genético (AG) para resolver o TSP; familiarizar-se com ajuste de parâmetros, testes numéricos, etc.**
*   Escolha 2 mutações e 2 crossover’s para comparar (veja slides da aula de 23/08)
*   Faça um AG preferencialmente em Octave. As funções e estrutura para o TSP estão prontas nos códigos de aulas anteriores. USE-OS!
*   Faça testes para ajustar parâmetros e comparar diferentes mutações e crossover’s.
*   <span style="color: #ff0000">Utilize em seus testes problemas da TSPLIB, arquivo</span> [TSPLIB_modif](https://drive.google.com/file/d/1kchXGAtTER8-l6vAy1Q78QTe8m_ZJxJd/view?usp=sharing). Esses problemas foram adaptados para o código do Octave já apresentado.
*   Os valores ótimos de cada problema podem ser encontrados [aqui](https://www.iwr.uni-heidelberg.de/groups/comopt/software/TSPLIB95/STSP.html).
*   **<span style="color: #ff0000">Fazer um relatório e entregar os códigos. O trabalho é individual.</span>**-->

## Atividade 4

<!--Esta atividade consiste na apresentação, pelo aluno, de um artigo selecionado. Cada aluno escolherá um artigo e fará uma apresentação contendo:

*   o problema e a metodologia de resolução (metaheurística usada/adaptada pelo(s) autore(s));
*   reprodução, pelo menos parcial, dos testes numéricos. O aluno deverá programar o método e realizar os testes, comparando com os testes relatados no artigo (pode-se utilizar os códigos das aulas ou outros que estiverem disponíveis na internet, em qualquer linguagem de programação).

_**Critérios de pontuação da apresentação:**_

*   Qualidade da apresentação (slides, material digital ou impresso…)
*   Organização das ideias e sequência lógica do assunto
*   Domínio do assunto
*   Postura, naturalidade, dinamismo e interação diante da plateia
*   Uso de linguagem apropriada; uso correto da língua portuguesa
*   Clareza e dicção
*   Adequação ao tempo pré-determinado
*   Coerência dos testes numéricos

**_Critérios de avaliação:_**

*   Cada apresentação receberá nota de 0 a 10, seguindo os pontos elencados acima;
*   O trabalho pode ser individual ou em dupla;  
    No entanto, o trabalho pode ser apresentado antes. O grupo deve informar ao professor a data da apresentação.
*   As apresentações deverão ser em dia e horário das aulas;
*   **O tempo de cada apresentação corresponde às aulas do dia, ou seja, 1h 40min;**
*   <span style="color: #ff0000">**—— O grupo pode apresentar mais de um artigo ——**</span>  
    <span style="color: #0000ff">**Neste caso, cada apresentação adicional valerá 5,0 pontos a mais que a anterior. Por exemplo, a primeira (obrigatória) vale 10,0 pontos, a segunda 15,0, a terceira 20,0 …**</span>  
    <span style="color: #ff0000">O grupo deverá informar ao professor das apresentações adicionais.  
    TODAS as apresentações deverão respeitar a data limite 29 de novembro.</span>

_Obs.: se o grupo quiser disponibilizar algum material de apoio à sua apresentação nesta página, basta informar ao professor!_

_**Média final das apresentações:**_

*   A média final M.ap das apresentações será a média aritmética das notas de cada apresentação:  
    <span style="color: #0000ff">**M.ap = (ap.1 + ap.2 + ap.3 + …) / n**</span>
*   Observe que é possível   M.ap > 10   caso o grupo realize mais de uma apresentação.

**_Artigos selecionados:_**

[**A Hybrid Grouping Genetic Algorithm for the Multiple-Type Access Node Location Problem**](https://link.springer.com/chapter/10.1007/978-3-642-04394-9_46)  
O. Alonso-Garrido, S. Salcedo-Sanz, L. E. Agustín-Blas, E. G. Ortiz-García, A. M. Pérez-Bellido, J. A. Portilla-Figueras.

* * *

**[Four-bar Mechanism Synthesis for n Desired Path Points Using Simulated Annealing](https://link.springer.com/chapter/10.1007/978-3-540-72960-0_2)**  
Horacio Martínez-Alfaro

* * *

[**A simple and robust Simulated Annealing algorithm for scheduling workover rigs on onshore oil fields**](https://www.sciencedirect.com/science/article/pii/S0360835210003220)  
Glaydston Mattos Ribeiro, Geraldo Regis Mauri, Luiz Antonio Nogueira Lorena

* * *

[**A simple and effective genetic algorithm for the two-stage capacitated facility location problem**](https://www.sciencedirect.com/science/article/pii/S0360835214001764)  
Diogo R.M. Fernandes, Caroline Rocha, Daniel Aloise, Glaydston M. Ribeiro, Enilson M. Santos, Allyson Silva

_Instâncias para testes:_ [_https://www.gerad.ca/~aloise/publications.html_](https://www.gerad.ca/~aloise/publications.html)

* * *

[**A greedy randomized adaptive search procedure for the point-feature cartographic label placement**](https://www.sciencedirect.com/science/article/pii/S0098300407001033)  
Gildásio Lecchi Cravo, Glaydston Mattos Ribeiro, Luiz Antonio Nogueira Lorena

_Instâncias para testes: [http://www.lac.inpe.br/~lorena/instancias.html](http://www.lac.inpe.br/~lorena/instancias.html)  (seção “Map labeling”)_

* * *

[**Simulated annealing and tabu search approaches for the Corridor Allocation Problem**](https://www.sciencedirect.com/science/article/abs/pii/S0377221713005808)  
H.Ahonen, A.G.de Alvarenga, A.R.S.Amaral.

_Instâncias para testes: (tabelas C.4, C.5 e C.6 do artigo) [CAP-Amaral 2012](#)  
Instâncias tratadas para Octave: [CAP-Amaral_m](#)_

* * *

**_Outros artigos:_**

[Artigo 1](https://link.springer.com/chapter/10.1007/978-3-540-72960-0_15)

* * *

[Artigo 2](https://ieeexplore.ieee.org/document/992068/)

* * *

[Artigo 3](https://link.springer.com/content/pdf/10.1023/A:1013720231747)

* * *

[Artigo 4](https://www.sciencedirect.com/science/article/pii/S0305054811001298)-->
