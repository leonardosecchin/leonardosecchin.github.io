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
    *   Defina a matriz diagonal A = [ 1 0 0; 0 1 0; 0 0 2 ] e o vetor b = [1; 1; 1]. Resolva o sistema Ax=b executando cgs(A,b) no Octave. Observe o número de iterações, que não ultrapassa o número de autovalores distintos de A (=2). Defina outros sistemas simétricos e teste à vontade
    *   _[Rodando GC para matrizes grandes]_ **Baixe o arquivo [cg.zip](https://drive.google.com/open?id=11zkrXqMWAu-SXtGMZn-KT2-HClsMTwkU)**
    *   Descompacte e execute no Octave o comando “cg”
    *   Siga as instruções. O zip contém arquivos de matrizes esparsas para testes (arquivo com extensão “mat”). Leia o arquivo “INFO.txt” para maiores detalhes das matrizes. Leia também o código de “cg.m” para detalhes do que é feito
    *   Observe o número de iterações, a ordem das matrizes e o tempo computacional (lembre-se que o Octave é lento, há coisas muito melhores)

## Aulas 2019/1

1.  [12/03 – Preliminares](https://drive.google.com/open?id=1PBl3CGWB82QZk8rWp7co3oRsp3uKpsIq)
2.  [14/03 – Exemplos](https://drive.google.com/open?id=1i3vJhnFr9OJ3xNZfEJWDWgOgmsOapl5A)
3.  [19/03 – Exemplos e condições de otimalidade para otimização sem restrições](https://drive.google.com/file/d/15-VfX7wP-L8kUbgjh3ZjMgQOgfnGpM8T/view?usp=drivesdk)
4.  [21/03 – Condições de otimalidade](https://drive.google.com/file/d/1aM2ShygSGEiBxHp3YmFnAf1zH2NRZUNY/view?usp=drivesdk)
5.  [26/03 – Convexidade](https://drive.google.com/open?id=1laCW-SL4L0j3uIEs_51eqU-TtWhqJfwT)
6.  [28/03 – Esquema geral para algoritmos de descida](https://drive.google.com/open?id=1HxlAv-79kiGZVnfzwjWLBNlNRXOhu_Rh)
7.  [02/04 – Cálculo do tamanho do passo (busca linear); condição de Armijo](https://drive.google.com/open?id=17rwVUpAiaVVguPI6lrv78YElBNzEDok-)
8.  [04/04 – Cálculo de direções de descida – Métodos do Gradiente, Newton e Quase-Newton; condições do ângulo e beta](https://drive.google.com/open?id=1Hy2HaPoSToopJivOBOyZ5DANLUcJYwew)
9.  [09/04 – Método de Newton puro e globalizado](https://drive.google.com/file/d/1SSsAYQH-YR2VMOKHcVltHz3HJ0QwXlLi/view?usp=drivesdk) —- **[Prova convergência esquema descida](https://drive.google.com/open?id=1f7Kf-knx6WqhYQd5RjdW4cjTuYVaQpGf)**
10.  [11/04 – Ordem de convergência](https://drive.google.com/file/d/1gufZ8FLC6dmWQyrlbfzHxYj9M7nJcxRm/view?usp=drivesdk) —- [**Prova convergência método de Newton**](https://drive.google.com/open?id=1FaBxKMdK4TJOaMGDiOz2P3Cz4l4N3LYV)
    1.  Leitura interessante: [Artigo sobre o desenvolvimento da ideia Newtoniana ao longo dos anos (download acessando pela Universidade)](https://doi.org/10.1007/978-3-319-94015-1_9)
11.  [16/04 – Método dos Gradientes Conjugados para minimização de quadráticas estritamente convexas (= resolução de sistemas lineares com matriz simétrica definida positiva)](https://drive.google.com/open?id=1jc3w_T6ylwTOcm79W-teVnYXEWzdfU7N)
    1.  Veja o tópico “Resolução de sistemas lineares quadrados usando Gradientes Conjugados” dos exercícios selecionados
12.  18/04 – [Aula laboratório] Uso de pacotes computacionais em otimização
    1.  [Ambiente AMPL (demonstração gratuita) para download](https://ampl.com/try-ampl/download-a-free-demo/). Neste link você pode:
        1.  Baixar a AMPL IDE para seu sistema (Windows/Linux)
        2.  Ver os solvers disponíveis para uso e suas especificações (algoritmos implementados e problemas que se aplicam)
    2.  [Documentação completa do AMPL](https://ampl.com/resources/the-ampl-book/)
    3.  [Exemplos – modelos lineares com CPLEX](https://www.cos.ufrj.br/~danielalubke/downloads.html)
    4.  **TAREFA 1:** Escreva em AMPL e resolva o Exemplo 1 da aula 2 (14/03) usando algum solver para otimização não linear
    5.  **TAREFA 2:** Escreva em AMPL o Exemplo 2 da aula 2\. Faça um arquivo de dados (.dat) para guardar os pontos. Resolva o problema com os pontos do Exercício 2 (2a parte) da Lista de Exercícios 1
    6.  **TAREFA 3:** Invente dois sistemas lineares Ax=b, um que admita solução e outro que não possui solução. Encontre a solução que minimiza o resíduo do sistema (norma || Ax – b ||). Veja o Exemplo 3 da aula 2
    7.  **TAREFA 4:** Minimize usando AMPL a função do Exercício 5 (2a parte) da Lista de Exercícios 1\. Verifique se o ponto estacionário do item (a) foi encontrado, ou se outro ponto foi atingido
    8.  **TAREFA 5 (lousa):** Escrever em AMPL o problema min -x^2 s.a. -10 <= x <= 10\. Resolver utilizando MINOS e GUROBI com ponto inicial x=0\. Fazer o mesmo com ponto inicial x=1\. Analise a solução dos algoritmos em ambos os casos.
        1.  [Arquivo do modelo](https://drive.google.com/open?id=1J5B-Th6XFmEmjdt6f_6OPSHslIGihLe4)
13.  [23/04 – Método dos Gradientes Conjugados para quadráticas quaisquer. Aplicação para cálculo de direções Newtonianas](https://drive.google.com/file/d/1tQknDA8AEbXQsXBd8UHEJP0-_gmQiwNd/view?usp=drivesdk)
14.  [25/04 – Otimização com restrições – condições de Karush-Kuhn-Tucker (KKT) (motivação geométrica)](https://drive.google.com/open?id=1mEj47JIKDO6CeRAv8ptcvO6JfQzDQtGS)
15.  [30/04 – KKT, pontos regulares e convexidade](https://drive.google.com/file/d/1bgp8z4aigNX4xoTAyF3r6r5az9LTDr0A/view?usp=drivesdk)
16.  [02/05 – Minimização com restrições lineares de igualdade (capítulos 7 e 8 do livro de Ana Friedlander)](https://drive.google.com/open?id=1ww58_Jmnpn92QQuTxYyw7_3K_BfZZ8Lo)
17.  [07/05 – Minimização com restrições lineares de desigualdade, parte 1 (capítulos 9 e 10 do livro de Ana Friedlander)](https://drive.google.com/open?id=16YQY82w2UBZ00M5-9hRrupL8gmdHSfPd)
18.  [09/05 – Minimização com restrições lineares de desigualdade, parte 2](https://drive.google.com/file/d/1WC0e-IhqLGuHENBbtCJQZnh3rjmjlwpH/view?usp=drivesdk)
19.  [14/05 – Estratégia de penalização externa](https://drive.google.com/open?id=1OgFeMsSdSpY9dt8ppRcWbsymyQsM7jmz)
20.  [16/05 – Convergência da estratégia de penalização externa](https://drive.google.com/file/d/1bzgryw0Dw0_bognvDVTAPUZP7pS1M95a/view?usp=drivesdk)
21.  [28/05 – Demonstração das condições de Karush-Kuhn-Tucker via penalização externa’](https://drive.google.com/open?id=12vlGu5iZgLccCVGqdH72GTOoMZRGaYMK)
22.  [30/05 – Exercícios](https://drive.google.com/open?id=1sJKY_a15U26TUHwgzTjHBQ6juaFYrq4Z)
23.  [04/06 – Exercícios](https://drive.google.com/open?id=1Ulk5G4zxgOEBywBJeIobIBAKQRBuxe1C)
24.  [06/06 – Exercícios](https://drive.google.com/open?id=10J67KGyD8dam4zehhzPiIGe6DU4pl6ml)
25.  11/06 – Exercícios
26.  [13/06 – Penalização interna / pontos interiores / método de barreiras](https://drive.google.com/open?id=1p16qV6tEMwd6wv2-zCfXuiOadaFQ1SDE)
    1.  Referência para esta aula: seção 10.1 de [Martínez, J. M.; Santos, S. A. Métodos computacionais de otimização](https://www.ime.unicamp.br/~sandra/MT601/handouts/MCDO_completo.pdf). **É recomendada a leitura desta referência!**
27.  [18/06 – Programação quadrática sequencial para restrições de igualdade](https://drive.google.com/file/d/1QxJmRZ5Ez8WuhKx9xHditQ76GwDyUqzG/view?usp=drivesdk)
28.  [25/06 – Pontos Interiores para restrições lineares](https://drive.google.com/open?id=1i84lEqKUEhX6VJBj3RpDkMS6RPl38J9L)
29.  27/06 – [Programação quadrática sequencial para restrições de igualdade e desigualdade](https://drive.google.com/open?id=1gokBR72K3qG_yYu2r9avf_b2FVczGHnY) / [aula laboratório] O pacote Ipopt (pontos interiores)
    1.  [Baixe o Ipopt para AMPL (prefira 64 bits quando possível)](https://ampl.com/products/solvers/open-source/)
    2.  Discussão da [referência bibliográfica](http://www.optimization-online.org/DB_HTML/2004/03/836.html) em sala
    3.  **TAREFA:** faça as tarefas da aula do dia 18/04 usando o Ipopt
    4.  [Veja alguns casos de uso do Ipopt em situações reais](https://projects.coin-or.org/Ipopt/wiki/SuccessStories)

## Alguns pacotes computacionais para Otimização Contínua usados pelas comunidades acadêmica e industrial:

1.  [WORHP](https://worhp.de/) (Programação Quadrática Sequencial)
    1.  [Link para principal referência bibliográfica](https://link.springer.com/chapter/10.1007%2F978-1-4614-4469-5_4)
2.  [Ipopt](https://github.com/coin-or/Ipopt) (penalização interna / barreira logarítmica / pontos interiores)
    1.  [Documentação completa](https://coin-or.github.io/Ipopt/)
    2.  [Link para principal referência bibliográfica](https://link.springer.com/article/10.1007/s10107-004-0559-y) (versão alternativa [com acesso livre](http://www.optimization-online.org/DB_HTML/2004/03/836.html))
