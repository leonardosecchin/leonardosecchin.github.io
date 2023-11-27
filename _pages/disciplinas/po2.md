---
layout: archive
title: "Pesquisa Operacional 2"
permalink: /po2/
author_profile: true
---

## Horários das aulas

- Terças-feiras de 16:00 as 18:00 (Sala 4 Eixo 3)
- Sextas-feiras de 12:00 as 14:00 (Sala 3 Eixo 1)


## [Ementa e programa](https://matematicaaplicada.saomateus.ufes.br/sites/matematicaaplicada.saomateus.ufes.br/files/field/anexo/Pesquisa%20Operacional%20II%20-%20DMA12297.pdf)


## Objetivos da disciplina

- Estudar modelos de problemas variados usando as técnicas de programação linear inteira e programação dinâmica
- Promover o uso de pacotes computacionais de resolução de problemas de programação linear Inteira
- Estudar teoria, algoritmos e aplicações de Otimização em Redes

## Textos de referência

- Hillier, F. S.; Lieberman, G. J. Introdução à Pesquisa Operacional. McGraw-Hill, 8ed, 2006
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

- **Trabalho**
  - Veja a [descrição dos trabalhos](https://drive.google.com/file/d/1dU8AoopY72hxBZwnUw0L8GtP0EvA1KNw/view?usp=sharing)
  - Valor: 10,0 pontos
  - **Data limite: 10/12/23**
  - Trabalhos por estudante:
    - Trabalho A: João Pedro. [Baixar ZIP](https://drive.google.com/file/d/1d1JNmtltMY1HiTOCGrD1hJ7Rb5-cz3wF/view?usp=sharing)
    - Trabalho B: Kely. [Baixar ZIP](https://drive.google.com/file/d/1_dA2vaVaTaQGKPFU4ZjBo9Z3ptIZ75yc/view?usp=sharing)
    - Trabalho C: Douglas. [Baixar ZIP](https://drive.google.com/file/d/1X_s-8cko_92egBOd5zlYMQ6mC1Flskpj/view?usp=sharing)

<!--- **Avaliação 2**
  - FORMA DE AVALIAÇÃO
  - Conteúdo: ----
  - Tarefas: 
  - Valor: 10,0 pontos
  - **Data: ----**-->

<!--- **PROVA FINAL**
  - **Prova escrita**
  - Conteúdo: toda a matéria
  - Valor: 10,0 pontos
  - **Data: ----**-->


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


### Softwares / Interfaces para Julia

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

1. Modelagem de problemas  
  *Referências:*  
  *1) Hillier, F. S.; Lieberman, G. J. Introdução à Pesquisa Operacional. McGraw-Hill, 8ed, 2006*  
  *2) Wolsey, L. A. Integer Programming. 2ed, Wiley, 2021*

1. Relaxação Linear e relaxação Lagrangeana  
  *Referência:*  
  *1) Wolsey, L. A. Integer Programming. 2ed, Wiley, 2021 (capítulo 10)*


### Exemplos de problemas e respectivos pacotes/códigos para uso no Julia

- Vários exemplos [neste link](/juliaopt_problems/)


### Métodos em programação inteira mista

1. Método de enumeração e poda (*Branch-and-bound*)
   1. Pré-processamento
      - Pré-processamento de PL's: fixação de variáveis, aperto de limitantes das variáveis e identificação de restrições redundantes
      - Identificação de PL's inviáveis ou ilimitados
      - Estratégias adicionais de pré-processamento para problemas com variáveis inteiras e binárias: aperto de restrições  
   >*Referências:*  
   >*1) Hillier, F. S.; Lieberman, G. J. Introdução à Pesquisa Operacional. McGraw-Hill, 8ed, 2006*  
   >*2) Wolsey, L. A. Integer Programming. 2ed, Wiley, 2021*

   1. Inserção de restrições no quadro simplex e o método dual simplex (revisão)  
   *Referências:*  
   *1) Hillier, F. S.; Lieberman, G. J. Introdução à Pesquisa Operacional. McGraw-Hill, 8ed, 2006*  
   *2) Bazaraa, M. S.; Jarvis, J. J.; Sherali, H. D. Linear Programming and Network Flows. Wiley, 4ed, 2010*

   1. *Branch-and-bound* baseado em relaxação linear  
   *Referência:*  
   *1) Wolsey, L. A. Integer Programming. 2ed, Wiley, 2021*

   1. *Branch-and-bound* - exemplos com variáveis inteiras e binárias  
   *Referência:*  
   *1) Wolsey, L. A. Integer Programming. 2ed, Wiley, 2021*

   1. Exemplo de problema inviável em que *branch-and-bound* fracassa
      - [**Código Julia**](/files/po2/unsolvable.jl)  
   *Referência:*  
   [*Jeroslow. Trivial integer programs unsolvable by branch-and-bound. Mathematical Programming 6, 105-109 (1974)*](https://doi.org/10.1007/BF01580225)

1. Método de planos de corte
   1. Desigualdades válidas
   1. Esquema geral do método  
   *Referência:*  
   *1) Wolsey, L. A. Integer Programming. 2ed, Wiley, 2021*

1. Método *Branch-and-cut*
   1. Cortes de Chvatal-Gomory
   1. Cortes fracionários de Gomory via quadro simplex  
   *Referência:*  
   *1) Wolsey, L. A. Integer Programming. 2ed, Wiley, 2021*

1. Método de geração de colunas
   1. [Geração de colunas aplicado ao problema de corte de estoque (*cutting stock*)](/files/topicospo/GER_COL_4-cutting-stock.pdf)
      - [**Código Julia com instâncias do problema**](/files/topicospo/GER_COL_cutting_stock.zip)
   1. Decomposição de Dantzig-Wolfe  
   *Referências:*  
   *1) Wolsey, L. A. Integer Programming. 2ed, Wiley, 2021*  
   *2) Maculan, N.; Fampa, M. H. C. Otimização linear. Editora UnB, 2006*  
   *3) Tópico 6 [deste link](/topicospo/)*

1. Comentários sobre os métodos *Branch-and-price* e *Branch-cut-and-price*  
   *Referência:*  
   *1) Wolsey, L. A. Integer Programming. 2ed, Wiley, 2021*

1. Comentários sobre o uso de heurísticas/metaheurísticas no contexto de métodos enumerativos  
   *Referência:*  
   *1) Wolsey, L. A. Integer Programming. 2ed, Wiley, 2021*


### Otimização em redes

*Referência:*  
*1) Bazaraa, M. S.; Jarvis, J. J.; Sherali, H. D. Linear Programming and Network Flows. Wiley, 4ed, 2010*

1. Conceitos básicos (grafos, árvore etc)
1. Exemplos: caminho mínimo, fluxo máximo, fluxo de custo mínimo, problemas do transporte e atribuição
1. Problema do transporte: resolução via simplex
   1. Matriz totalmente unimodular
   1. Obtendo uma base inicial viável
   1. Quadro simplex
   1. Caso particular: problema de atribuição
      - Relaxação linear, matriz totalmente unimodular e integralidade das soluções
1. Problema de fluxo de custo mínimo
   1. Método simplex de rede
1. Problema do menor caminho
<!-- 1. Árvore geradora mínima -->
<!-- 1. Fluxo em redes -->


<!-- ### Programação dinâmica -->
