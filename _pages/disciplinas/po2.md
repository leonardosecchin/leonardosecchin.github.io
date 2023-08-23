---
layout: archive
title: "Pesquisa Operacional 2"
permalink: /po2/
author_profile: true
---

## Horários das aulas

- Terças-feiras de 16:00 as 18:00 (Sala 4 Eixo 3)
- Sextas-feiras de 12:00 as 14:00 (Sala 8 Eixo 1)


## [Ementa e programa](https://matematicaaplicada.saomateus.ufes.br/sites/matematicaaplicada.saomateus.ufes.br/files/field/anexo/Pesquisa%20Operacional%20II%20-%20DMA12297.pdf)


## Objetivos da disciplina

- Estudar modelos de problemas variados usando as técnicas de programação linear inteira e programação dinâmica
- Promover o uso de pacotes computacionais de resolução de problemas de programação linear Inteira
- Estudar teoria, algoritmos e aplicações de Otimização em Redes

## Textos de referência

- Hillier, F. S.; Lieberman, G. J. Introdução à Pesquisa Operacional. McGraw-Hill, 8ed., 2006
- [Wolsey, L. A. Integer Programming. 2ed, Wiley, 2021](https://onlinelibrary.wiley.com/doi/10.1002/9781119606475.ch10)
- Maculan, N.; Fampa, M. H. C. Otimização linear. Editora UnB, 2006

## Textos complementares

- Luenberguer; Ye. Linear and Nonlinear Programming. Springer, 2008.
- Bazaraa, M. S.; Jarvis, J. J.; Sherali, H. D. Linear Programming and Network Flows. Wiley, 4ed, 2010


## Canais de acesso

- E-mail do professor: leonardo.secchin@ufes.br
- Sala do professor: prédio do Departamento de Matemática Aplicada, sala 08


## Formas de avaliação

- provas escritas, listas de exercícios, trabalhos computacionais ou apresentações orais.


## Avaliações

- **Avaliação 1**
<!--   - FORMA DE AVALIAÇÃO -->
  - Conteúdo: ----
<!--   - Tarefas: exercícios 5 e 7 da [lista 0](https://drive.google.com/file/d/1YtAVS4xXvq8VKMoIWa4R7JKuAgDkcI9n/view?usp=sharing); exercícios 1, 3, 4, 5, 6, 7 da [lista 1](https://drive.google.com/file/d/1n3CQhi8mUSPmYnWer-G7JlnTa0BzNpPH/view?usp=sharing) -->
  - Valor: 10,0 pontos
  - **Data: ----**
<!--   - Entregar resolução escrita à mão. Exercícios computacionais requerem uma discussão escrita à mão e o envio do código para o email secchinleo@gmail.com -->
<!--   - O trabalho é individual. Cópias receberão nota zero. -->

- **Avaliação 2**
<!--   - FORMA DE AVALIAÇÃO -->
  - Conteúdo: ----
<!--   - Tarefas: exercícios 1, 2, 3, 4, 5, 6 da [lista 2](https://drive.google.com/file/d/1HME5J2MFmIajwebkuqyxER13kQxiFpuc/view?usp=sharing); exercícios 1, 2, 4 da [lista 3](https://drive.google.com/file/d/1jiYaleSiQfe5E_uQoDUArnIqG31HmNhS/view?usp=sharing) -->
  - Valor: 10,0 pontos
  - **Data: ----**
<!--   - Entregar resolução escrita à mão ou escaneadas para o email secchinleo@gmail.com. Exercícios computacionais requerem uma discussão escrita à mão e o envio do código para o email secchinleo@gmail.com -->
<!--   - O trabalho é individual. Cópias receberão nota zero. -->

- **Avaliação 3**
<!--   - FORMA DE AVALIAÇÃO -->
  - Conteúdo: ----
  - Valor: 10,0 pontos
  - **Data: ----**

- **PROVA FINAL**
  - **Prova escrita**
  - Conteúdo: toda a matéria
  - Valor: 10,0 pontos
  - **Data: ----**


## Critérios para aprovação

- Média parcial >= 7,0 —–> aprovado(a) (desde que não reprovado(a) por falta)
- Média parcial < 7,0 —–> Avaliação final (desde que não reprovado(a) por falta). Neste caso, média final >= 5,0 —–> aprovado(a).


<!-- ## Listas de exercícios -->


<!-- ## Trabalhos computacionais -->


## Conteúdo

### A linguagem de programação Julia

Julia é uma linguagem de programação de alto nível surgida em 2012, que implementa várias ferramentas para uso geral em matemática aplicada. Em particular, Julia possui várias ferramentas para otimização. É muito parecida com o Matlab, portanto os códigos são fáceis de entender. Os trabalhos computacionais desta disciplina serão feitos em Julia. A seguir você encontra instruções de instalação, bem como exemplos simples que ajudarão você a dar os primeiros passos nas ferramentas de otimização disponíveis no Julia.

- [Tutorial para instalação e uso da linguagem de programação Julia](/julia/)
- [Julia para Otimização - primeiros passos](/juliaopt/)

**Para auxiliá-lo na instalação do Julia pré-compilado + pré-requisitos + pacotes utilizados nas disciplinas de otimização, baixe [ESTE SCRIPT](/files/julia/instalar_julia) e siga as instruções contidas nele (testado no Ubuntu 22.04)**


### Softwares

- [**CPLEX**](https://www.ibm.com/br-pt/analytics/cplex-optimizer)  
   O CPLEX é um pacote mantido pela IBM e muito utilizado na academia e indústria. Nele há vários métodos para programação linear inteira mista. É um software proprietário, mas estudantes das universidades podem obter licença de uso mediante preencimento de um cadastro. **Recomendo familiarizar-se com o pacote desde o início da disciplina.**
   - [Instruções para download](/files/po2/cplex.txt)

- [**GLPK**](https://www.gnu.org/software/glpk/)  
   GLPK é um pacote que implementa vários métodos para programação linear inteira mista. Ao contrário do CPLEX, é *software* livre, ou seja, você pode instalar e usar sem a necessidade de obter licenças. É uma opção de fácil instalação caso você tenha problemas com o CPLEX.

- **Uso dos pacotes no Julia**  
   Tanto o CPLEX quando o GLPK podem ser utilizados dentro do Julia. Para tanto, basta instalar os pacotes [`CPLEX.jl`](https://github.com/jump-dev/CPLEX.jl) e [`GLPK.jl`](https://github.com/jump-dev/GLPK.jl) no seu Julia.
   - Obs: `CPLEX.jl` **não** instala o CPLEX automaticamente, você precisa obter a licença e instalar na sua máquina. Já `GLPK.jl` baixa e instala o GLPK automaticamente.
   - Teste executando o [código exemplo](/files/po2/ufl.jl) para o problema de localização de facilidades não capacitado


### Programação inteira e inteira mista

- Modelagem de problemas  
  *Referências:*  
  *1) Hillier, F. S.; Lieberman, G. J. Introdução à Pesquisa Operacional. McGraw-Hill, 8ed., 2006*  
  *2) Wolsey, L. A. Integer Programming. 2ed, Wiley, 2021*

- Relaxação Linear e relaxação Lagrangeana  
  *Referência:*  
  *1) Wolsey, L. A. Integer Programming. 2ed, Wiley, 2021 (capítulo 10)*


### Exemplos de problemas e respectivos pacotes/códigos para uso no Julia

- Problemas de localização de facilidades (*Facility Location Problems* - UFL)
  - [Pacote para ler instâncias no Julia](https://github.com/rafaelmartinelli/FacilityLocationProblems.jl)
- Problema de alocação generalizado (*Generalized Assignmnent Problem* - GAP)
  - [Pacote para ler instâncias no Julia](https://github.com/rafaelmartinelli/AssignmentProblems.jl)
- Problema de empacotamento (*Bin Packing Problem* - BBP)
  - [Pacote para ler instâncias no Julia](https://github.com/rafaelmartinelli/BPPLib.jl)
- *Capacitated Lot Sizing Problem* - CLSP
  - [Pacote para ler instâncias no Julia](https://github.com/rafaelmartinelli/LotSizingProblems.jl)
- *Multi-Depot Vechile Scheduling Problem* - MDVSP
  - [Pacote para ler instâncias no Julia](https://github.com/rafaelmartinelli/MDVSP.jl)
- Problema de roteamento de veículos capacitado (*Capacitated Vehicle Routing Problem* - CVRP)
  - [Pacote para ler instâncias no Julia](https://github.com/chkwon/CVRPLIB.jl)
- *Inventory Routing Problem* - IRP
  - [Pacote para ler instâncias no Julia](https://github.com/rafaelmartinelli/InventoryRoutingProblems.jl)
- Problema da mochila (*Knapsack problem*)
- Problema do caixeiro viajante (*Traveling Salesman Problem* - TSP)
  - [Pacote para ler instâncias no Julia](https://github.com/matago/TSPLIB.jl)

[Página com bibliotecas para vários problemas em pesquisa operacional](http://people.brunel.ac.uk/~mastjjb/jeb/info.html) (não fornece interface para Julia).


### Métodos em programação inteira mista

1. Branch and bound
1. Branch and cut
1. Branch and price
1. Geração de colunas
   - Tópico 6 [deste link](/topicospo/)
1. Comentários sobre heurísticas/metaheurísticas
   - Conteúdo disciplina ["Metaheurísticas"](/metaheuristicas/)


### Otimização em redes


### Programação dinâmica


<!-- ## Links -->

