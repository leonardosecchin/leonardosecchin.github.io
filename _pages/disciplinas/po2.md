---
layout: archive
title: "Pesquisa Operacional 2"
permalink: /po2/
author_profile: true
---

## Horários das aulas

- Segundas-feiras de 12:00 as 14:00 (Sala 18 Eixo 3, LABMAT)
- Terças-feiras de 16:00 as 18:00 (Sala 18 Eixo 3, LABMAT)


## [Ementa e programa](https://matematicaaplicada.saomateus.ufes.br/sites/matematicaaplicada.saomateus.ufes.br/files/field/anexo/Pesquisa%20Operacional%20II%20-%20DMA12297.pdf)


## Objetivos da disciplina

- Estudar modelos de problemas variados usando as técnicas de programação linear inteira e programação dinâmica
- Promover o uso de pacotes computacionais de resolução de problemas de programação linear Inteira
- Estudar teoria, algoritmos e aplicações de Otimização em Redes

## Textos de referência

- Wolsey, L. A. Integer Programming. 2ed, Wiley, 2021  
  [[link](https://onlinelibrary.wiley.com/doi/book/10.1002/9781119606475)]
- Goldbarg, M. C.; Luna, H. P. L. Otimização combinatória e programação linear: modelos e algoritmos. Elsevier, 2ed, 2005  
  [[link](https://web.ist.utl.pt/luis.tarrataca/classes/linear_programming/OtimizacaoCombinatoriaeProgramacaoLinear.pdf)]
- Hillier, F. S.; Lieberman, G. J. Introdução à Pesquisa Operacional. McGraw-Hill, 8ed, 2006

## Textos complementares

- Maculan, N.; Fampa, M. H. C. Otimização linear. Editora UnB, 2006  
  [[link versão alternativa](http://profs.ic.uff.br/~yuri/pl/Maculan.pdf)]
- Luenberguer; Ye. Linear and Nonlinear Programming. Springer, 2008  
  [[link 1](https://link.springer.com/book/10.1007/978-0-387-74503-9)] [[link 2](https://grapr.wordpress.com/wp-content/uploads/2011/09/luenberger-linear-and-nonlinear-programming-3e-springer-2008.pdf)]
- Bazaraa, M. S.; Jarvis, J. J.; Sherali, H. D. Linear Programming and Network Flows. Wiley, 4ed, 2010  
  [[link 1](https://onlinelibrary.wiley.com/doi/book/10.1002/9780471703778)] [[link 2 (1ed de 1977)](https://civil.colorado.edu/~balajir/CVEN5393/lectures/Bazaraa-n-Jarvis.pdf)]


## Canais de acesso

- E-mail do professor: leonardo.secchin@ufes.br
- Sala do professor: prédio do Departamento de Matemática Aplicada, sala 08


## Formas de avaliação

- provas escritas, listas de exercícios, trabalhos computacionais ou apresentações orais.


## Avaliações

<!--- **Trabalho**
  - Veja a [descrição dos trabalhos](https://drive.google.com/file/d/1dU8AoopY72hxBZwnUw0L8GtP0EvA1KNw/view?usp=sharing)
  - Valor: 10,0 pontos
  - **Data limite: 10/12/23**
  - Trabalhos por estudante:
    - Trabalho A: João Pedro. [Baixar ZIP](https://drive.google.com/file/d/1d1JNmtltMY1HiTOCGrD1hJ7Rb5-cz3wF/view?usp=sharing)
    - Trabalho B: Kely. [Baixar ZIP](https://drive.google.com/file/d/1_dA2vaVaTaQGKPFU4ZjBo9Z3ptIZ75yc/view?usp=sharing)
    - Trabalho C: Douglas. [Baixar ZIP](https://drive.google.com/file/d/1X_s-8cko_92egBOd5zlYMQ6mC1Flskpj/view?usp=sharing)-->

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


## Listas de exercícios

- [LISTA 1 - Pré-processamento e *Branch-and-Bound*](https://drive.google.com/file/d/1jJz-EG8fl1Ng3EqLzrbk7t-ufm5hrtj3/view?usp=sharing)


<!-- ## Trabalhos computacionais -->


## Conteúdo

<details>
<summary markdown="span">
**A linguagem de programação Julia**
</summary>

Julia é uma linguagem de programação de alto nível surgida em 2012, que implementa várias ferramentas para uso geral em matemática aplicada. Em particular, Julia possui várias ferramentas para otimização. É muito parecida com o Matlab, portanto os códigos são fáceis de entender. Os trabalhos computacionais desta disciplina serão feitos em Julia.

**Para uma introdução ao Julia e seu uso em otimização, acesse [este link](/julia/).**

</details>

<details>
<summary markdown="span">
**Softwares / Interfaces para Julia**
</summary>

- [**CPLEX**](https://www.ibm.com/br-pt/analytics/cplex-optimizer)  
   O CPLEX é um pacote mantido pela IBM e muito utilizado na academia e indústria. Nele há vários métodos para programação linear inteira mista. É um software proprietário, mas estudantes das universidades podem obter licença de uso mediante preencimento de um cadastro.
   - [Instruções para download](/files/po2/cplex.txt) (atualizado em agosto de 2026)

- [**GLPK**](https://www.gnu.org/software/glpk/)  
   GLPK é um pacote que implementa vários métodos para programação linear inteira mista. Ao contrário do CPLEX, é *software* livre, ou seja, você pode instalar e usar sem a necessidade de obter licenças. É uma opção de fácil instalação caso você tenha problemas com o CPLEX.

- **Uso dos pacotes no Julia**  
   Tanto o CPLEX quando o GLPK podem ser utilizados dentro do Julia. Para tanto, basta instalar os pacotes [`CPLEX.jl`](https://github.com/jump-dev/CPLEX.jl) e [`GLPK.jl`](https://github.com/jump-dev/GLPK.jl) no seu Julia.
   - Obs: `CPLEX.jl` **não** instala o CPLEX automaticamente, você precisa instalá-lo na sua máquina antes; siga as [instruções para download](/files/po2/cplex.txt). Já `GLPK.jl` baixa e instala o GLPK automaticamente.
   - Teste executando o [código exemplo](/files/po2/ufl.jl) para o problema de localização de facilidades não capacitado.

</details>

<details>
<summary markdown="span">
**Introdução à programação linear inteira mista**
</summary>

1. O modelo de programação linear inteira mista
1. Exemplos de aplicações  
  *Referência: Goldbarg, M. C.; Luna, H. P. L. Otimização combinatória e programação linear: modelos e algoritmos. Elsevier, 2ed, 2005*
1. Exemplos de problemas e respectivos pacotes/códigos para uso no Julia, veja [este link](https://github.com/leonardosecchin/tutorial_Julia/blob/main/problemas-teste.md)

</details>

<details>
<summary markdown="span">
**Métodos em programação linear inteira mista**
</summary>

1. Relaxação linear e relaxação Lagrangeana  
  *Referência: Wolsey, L. A. Integer Programming. 2ed, Wiley, 2021*

1. Método de enumeração e poda (*Branch-and-bound*)
   1. Pré-processamento  
   *Referências:*  
   *1) Hillier, F. S.; Lieberman, G. J. Introdução à Pesquisa Operacional. McGraw-Hill, 8ed, 2006*  
   *2) Wolsey, L. A. Integer Programming. 2ed, Wiley, 2021*
      - Pré-processamento de PL's: fixação de variáveis, aperto de limitantes das variáveis e identificação de restrições redundantes
      - Identificação de PL's inviáveis ou ilimitados
      - Estratégias adicionais de pré-processamento para problemas com variáveis inteiras e binárias

   1. Inserção de restrições/cortes no quadro simplex ótimo e o método dual simplex (conteúdo de PO I, revisão)  
   *Referência: Bazaraa, M. S.; Jarvis, J. J.; Sherali, H. D. Linear Programming and Network Flows. Wiley, 4ed, 2010*

   1. Método de enumeração e poda (*Branch-and-bound*) baseado em relaxação linear  
   *Referências:*  
   *1) Goldbarg, M. C.; Luna, H. P. L. Otimização combinatória e programação linear: modelos e algoritmos. Elsevier, 2ed, 2005*  
   *2) Wolsey, L. A. Integer Programming. 2ed, Wiley, 2021*
   
   1. [Exemplo completo de aplicação do Branch-and-Bound](https://drive.google.com/file/d/1oqz-sL-goTw1A6zdxiYN5oG6GZX6keLp/view?usp=sharing)

   1. Exemplo de problema inviável em que *branch-and-bound* fracassa  
   *Referência: [Jeroslow. Trivial integer programs unsolvable by branch-and-bound. Mathematical Programming 6, 105-109 (1974)](https://doi.org/10.1007/BF01580225)*
      - [Código Julia](/files/po2/unsolvable.jl)
   
   1. **EXERCÍCIOS:** Veja Lista 1

1. Método de enumeração e poda com adição de cortes (*Branch-and-cut*)  
   1. Cortes fracionários de Gomory via quadro simplex  
   *Referência: Wolsey, L. A. Integer Programming. 2ed, Wiley, 2021*

   1. *Branch-and-Cut* baseado em relaxão linear e dual simplex  
   *Referências:*  
   *1) Goldbarg, M. C.; Luna, H. P. L. Otimização combinatória e programação linear: modelos e algoritmos. Elsevier, 2ed, 2005*  
   *2) Wolsey, L. A. Integer Programming. 2ed, Wiley, 2021*

1. Método de planos de corte  
   *Referência: Wolsey, L. A. Integer Programming. 2ed, Wiley, 2021*
   1. Desigualdades válidas
   1. Esquema geral do método

1. Comentários sobre o método de geração de colunas  
   *Referências:*  
   *1) Wolsey, L. A. Integer Programming. 2ed, Wiley, 2021*  
   *2) Maculan, N.; Fampa, M. H. C. Otimização linear. Editora UnB, 2006*  
   *3) Tópico 6 [deste link](/topicospo/)*
   1. [Geração de colunas aplicado ao problema de corte de estoque (*cutting stock*)](/files/topicospo/GER_COL_4-cutting-stock.pdf)
      - [**Código Julia com instâncias do problema**](/files/topicospo/GER_COL_cutting_stock.zip)
   1. Decomposição de Dantzig-Wolfe  

1. Comentários sobre os métodos *Branch-and-price* e *Branch-cut-and-price*  
   *Referência: Wolsey, L. A. Integer Programming. 2ed, Wiley, 2021*

<!-- 1. Comentários sobre o uso de heurísticas/metaheurísticas no contexto de métodos enumerativos  
   *Referências:*  
   *1) Wolsey, L. A. Integer Programming. 2ed, Wiley, 2021*  
   *2) Goldbarg, M. C.; Luna, H. P. L. Otimização combinatória e programação linear: modelos e algoritmos. Elsevier, 2ed, 2005* -->

</details>

<details>
<summary markdown="span">
**Otimização em redes**
</summary>

*Referência: Bazaraa, M. S.; Jarvis, J. J.; Sherali, H. D. Linear Programming and Network Flows. Wiley, 4ed, 2010*

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
   1. Algoritmo de Dijkstra para custos não negativos
<!-- 1. Árvore geradora mínima -->
<!-- 1. Fluxo em redes -->

</details>

<details>
<summary markdown="span">
**Programação dinâmica**
</summary>

*Referência: Hillier, F. S.; Lieberman, G. J. Introdução à Pesquisa Operacional. McGraw-Hill, 8ed, 2006*

1. Princípios da programação dinâmica
1. [Exemplo simples: sequência de Fibonacci](https://www.ime.usp.br/~pf/analise_de_algoritmos/aulas/dynamic-programming.html)
1. [Problema da mochila 0-1](https://www.ime.usp.br/~pf/analise_de_algoritmos/aulas/mochila-bool.html#sec:prog-din)
1. Exemplo protótipo, seção 10.1 do livro de Hillier e Lieberman
1. Exemplos da seção 10.3 do livro de Hillier e Lieberman
1. Outros exemplos
   1. [Subset sum](https://www.ime.usp.br/~pf/analise_de_algoritmos/aulas/mochila-subsetsum.html#sec:dynamic-programming)
   1. O algoritmo de Dijkstra (tópico anterior) usa conceitos de programação dinâmica

</details>

