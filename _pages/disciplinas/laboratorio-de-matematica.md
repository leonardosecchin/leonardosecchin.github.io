---
layout: archive
title: "Laboratório de matemática"
permalink: /laboratorio-de-matematica/
author_profile: true
---

<!--## [Ementa e programa](https://matematicaaplicada.saomateus.ufes.br/programas-de-disciplinas-do-dma)-->

**Matemática Industrial (Carga Horária: 60)**  
Utilização de computadores na Resolução de Problemas elementares de geometria analítica, gráficos de funções reais de uma variável real. Estudo de crescimento/decrescimento com o uso de derivadas simbólicas. Integração simbólica. Resolução de problemas de Cálculo Diferencial e Integral que requerem computação simbólica. Vetores, matrizes e aritmética matricial de sistemas lineares de equações. Resolução de sistemas lineares de equações. Resolução de algumas equações não lineares.  

**Licenciatura em Matemática (Carga Horária: 30)**  
Softwares computacionais para a resolução de problemas envolvendo funções e matrizes.

**Objetivo:** estudar/resolver problemas com o uso do computador, no _software_ Octave.

Versão on-line do octave: [http://octave-online.net/](http://octave-online.net/)

**Códigos Octave utilizados em aula **(códigos comentados):  
**[BAIXAR TUDO](https://drive.google.com/file/d/1712lHsk8Ob7__Xs63dTqzbGRpCCfqHt_/view?usp=sharing)**

16/10

*   Multiplicação vetor por vetor (produto escalar)

17/10

*   Multiplicação matriz por vetor
*   Verifica se uma matriz é simétrica
*   Verifica se uma matriz é definida positiva

23/10

*   Plota o polinômio que melhor aproxima uma lista de pontos

24/10

*   TAREFA: fazer a função “aproximaerro” que receba vetores $x$ e $y$, e um erro máximo ERRO, e retorne o polinômio aproximador de menor grau que possua erro $<=$ ERRO.
*   Veja aqui duas versões para a função “aproximaerro” da tarefa

30/10

*   Resolve um sistema com duas equações não lineares (no caso, encontrar a interseção de duas circunferências)
*   TAREFA: resolver sistema com duas equações dadas em sala (para entrega)

06/11

*   Plota o gráfico de um polinômio e a reta tangente em um dado ponto

07/11

*   Calcula e plota pontos críticos de um polinômio, classificando-os entre máximos ou mínimos locais

13/11

*   Comentários acerca de derivadas no octave, computação numérica x simbólica
*   TAREFA:
    *   função “valormedio”
    *   recebe uma função $f$ e numeros $a$, $b$
    *   definir a funcao df derivada de $f$
    *   encontrar $c$ que satisfaça o teorema do valor médio
    *   dica: iniciar fsolve no ponto medio $(a+b)/2$
    *   na mesma figura:
    *   plotar o grafico de $f$ em $[a,b]$
    *   plotar a reta de $(a,f(a))$ até $(b,f(b))$
    *   plotar a reta tangente ao grafico de $f$ no ponto $(c,f(c))$
*   Derivação de funções genéricas. Ilustração do Teorema do Valor Médio (resolução da tarefa anterior)

21/11

*   Comentários acerca de funções para cálculo de integrais definidas
*   Calculo de integrais de poligonais (areapoligonal.m)
*   **TAREFA 1:** Use a funcao “trapz” para resolver o exercicio de lab_nave.pdf
*   **TAREFA 2:** Defina a função de Fresnel como descrito em lab_fresnel.pdf. Depois, plote em duas janelas usando subplot (uma em cima e outra abaixo) a função de Fresnel no intervalo $[-5, 5]$ no plot de cima e o integrando $\text{sen}\,(pi t^2/2)$ no mesmo intervalo no plot de baixo. Pinte a area entre o gráfico desta função usando o comando “area”. Veja um exemplo de plot em lab_fresnel.png.
*   **TAREFA 3:** Defina as funções $C(t)$, $f(t)$ e $g(t)$ como descrito em lab_exercicio_integral.pdf. Use arquivos separados para as funções $f$ e $g$. Considere o item (a) verdadeiro. Resolva então os itens (b), (c) e (d). Veja um exemplo de plot para o item (d) em lab_exercicio_integral.png.
*   **As tarefas acima serão distribuídas na aula, em grupos. Deverão ser entregues por email (enviar para secchinleo@gmail.com), valendo nota. Prazo máximo de entrega: 27/11 (quinta-feira).**

27/11

*   Lista de alguns comandos do pacote “geometry” do Octave, para manipulação de objetos geométricos

## Material de apoio

[NETO, F. G. A; NASCIMENTO, V. H. Apostila Introdutória de Matlab/Octave. Escola Politénica da USP, São Paulo, 2011.](http://disciplinas.stoa.usp.br/pluginfile.php/144836/mod_resource/content/1/apostila_matlab_octave.pdf)

[TEIXEIRA, Sergio Roberto. Octave – Uma introdução. UEL, Londrina, 2010.](http://www.uel.br/projetos/matessencial/superior/pdfs/Octave-final.pdf)

[Documentação oficial do Octave (em inglês)](http://octave.sourceforge.net/docs.html)
