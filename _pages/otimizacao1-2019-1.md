---
layout: archive
title: "Otimização 1 (2019/1)"
permalink: /otimizacao1-2019-1/
author_profile: true
---

## Exercícios selecionados

*   Minimização irrestrita / convexidade – Lista de exercícios 1
*   Minimização restrita
    *   [Livro de Ana Friedlander](https://www.ime.unicamp.br/~friedlan/livro.pdf): **cap 4** – 4.2, 4.3, 4.6, 4.7, 4.8, 4.9, 4.11; **cap 5** – 5.1, 5.2, 5.3; **cap 6** – 6.1, 6.2, 6.3, 6.4, 6.6, 6.7, 6.8, 6.9, 6.11, 6.12, 6.13; **cap 7** – 7.1, 7.2, 7.3, 7.5, 7.6, 7.8; **cap 8** – 8.3, 8.4, 8.6; **cap 9** – 9.1, 9.3, 9.5, 9.6, 9.8; **cap 10** – 10.1, 10.2, 10.3; **cap 13** – 13.1, 13.6, 13.13, 13.14
*   **Resolução de sistemas lineares quadrados usando Gradientes Conjugados**
    *   O Octave contém uma implementação de Gradientes Conjugados (comando cgs)
    *   Defina a matriz diagonal A = [ 1 0 0; 0 1 0; 0 0 2 ] e o vetor b = [1; 1; 1]. Resolva o sistema $Ax=b$ executando cgs(A,b) no Octave. Observe o número de iterações, que não ultrapassa o número de autovalores distintos de $A$ ($=2$). Defina outros sistemas simétricos e teste à vontade
    *   _[Rodando GC para matrizes grandes]_ **Baixe o arquivo [cg.zip](https://drive.google.com/open?id=11zkrXqMWAu-SXtGMZn-KT2-HClsMTwkU)**
    *   Descompacte e execute no Octave o comando “cg”
    *   Siga as instruções. O zip contém arquivos de matrizes esparsas para testes (arquivo com extensão “mat”). Leia o arquivo “INFO.txt” para maiores detalhes das matrizes. Leia também o código de “cg.m” para detalhes do que é feito
    *   Observe o número de iterações, a ordem das matrizes e o tempo computacional (lembre-se que o Octave é lento, há coisas muito melhores)

## Aulas 2019/1

1.   18/04 – [Aula laboratório] Uso de pacotes computacionais em otimização
     -  [Ambiente AMPL (demonstração gratuita) para download](https://ampl.com/try-ampl/download-a-free-demo/). Neste link você pode:
        -  Baixar a AMPL IDE para seu sistema (Windows/Linux)
        -  Ver os solvers disponíveis para uso e suas especificações (algoritmos implementados e problemas que se aplicam)
     -  [Documentação completa do AMPL](https://ampl.com/resources/the-ampl-book/)
     -  [Exemplos – modelos lineares com CPLEX](https://www.cos.ufrj.br/~danielalubke/downloads.html)
     -  **TAREFA 1:** Escreva em AMPL e resolva o Exemplo 1 da aula 2 (14/03) usando algum solver para otimização não linear
     -  **TAREFA 2:** Escreva em AMPL o Exemplo 2 da aula 2. Faça um arquivo de dados (.dat) para guardar os pontos. Resolva o problema com os pontos do Exercício 2 (2a parte) da Lista de Exercícios 1
     -  **TAREFA 3:** Invente dois sistemas lineares $Ax=b$, um que admita solução e outro que não possui solução. Encontre a solução que minimiza o resíduo do sistema (norma $\|Ax – b\|$). Veja o Exemplo 3 da aula 2
     -  **TAREFA 4:** Minimize usando AMPL a função do Exercício 5 (2a parte) da Lista de Exercícios 1. Verifique se o ponto estacionário do item (a) foi encontrado, ou se outro ponto foi atingido
     -  **TAREFA 5 (lousa):** Escrever em AMPL o problema $\min \, -x^2 \ \text{s.a.} \ -10 \leq x \leq 10$. Resolver utilizando MINOS e GUROBI com ponto inicial $x=0$. Fazer o mesmo com ponto inicial $x=1$. Analise a solução dos algoritmos em ambos os casos.
        -  [Arquivo do modelo](https://drive.google.com/open?id=1J5B-Th6XFmEmjdt6f_6OPSHslIGihLe4)
1.   27/06 – **aula laboratório** O pacote Ipopt (pontos interiores)
     -  [Baixe o Ipopt para AMPL (prefira 64 bits quando possível)](https://ampl.com/products/solvers/open-source/)
     -  Discussão da [referência bibliográfica](http://www.optimization-online.org/DB_HTML/2004/03/836.html) em sala
     -  **TAREFA:** faça as tarefas da aula do dia 18/04 usando o Ipopt
     -  [Veja alguns casos de uso do Ipopt em situações reais](https://projects.coin-or.org/Ipopt/wiki/SuccessStories)

## Alguns pacotes computacionais para Otimização Contínua usados pelas comunidades acadêmica e industrial:

1.  [WORHP](https://worhp.de/) (Programação Quadrática Sequencial)
    -  [Link para principal referência bibliográfica](https://link.springer.com/chapter/10.1007%2F978-1-4614-4469-5_4)
2.  [Ipopt](https://github.com/coin-or/Ipopt) (penalização interna / barreira logarítmica / pontos interiores)
    -  [Documentação completa](https://coin-or.github.io/Ipopt/)
    -  [Link para principal referência bibliográfica](https://link.springer.com/article/10.1007/s10107-004-0559-y) (versão alternativa [com acesso livre](http://www.optimization-online.org/DB_HTML/2004/03/836.html))
