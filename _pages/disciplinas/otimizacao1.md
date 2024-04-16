---
layout: archive
title: "Otimização 1"
permalink: /otimizacao1/
author_profile: true
---

{% include toc title="Sumário" %}

> ## Sumário
> 1. [LISTAS DE EXERCÍCIOS](#listas)
> 1. [Conceitos básicos](#basico)
> 1. [Otimização sem restrições](#irrestrito)
> 1. [Convexidade](#convexidade)
> 1. [A linguagem de programação Julia](#julia)
> 1. Métodos para otimização sem restrições
>    1. [Métodos de descida gerais](#descida)
>    1. [Método de Newton](#newton)
>    1. [Métodos quase-Newton](#quase-newton)
>    1. [Método do gradiente espectral](#espectral)
>    1. [Método dos gradientes conjugados](#cg)
> 1. [Otimização com restrições](#kkt)
> 1. Métodos para otimização com restrições
>    1. [Minimização com restrições lineares](#min-rest-lineares)
>    1. [Penalização externa](#externa)
>    1. [Penalização interna](#interna)
>    1. [Programação Quadrática Sequencial](#sqp)
>    1. [Pontos interiores](#pi)
> 1. [Códigos em Julia](#codigos)
> 1. Tópicos extras
>    1. [Comparação de desempenho](#desempenho)
>    1. [Método do gradiente com passo constante](#grad-passo-cte)
>    1. [Gradiente projetado para restrições convexas](#grad-projetado)

***

## Horários das aulas
{:.no_toc}

- Quartas-feiras de 11:00 as 13:00 (Sala 09 Eixo 1)
- Sextas-feiras de 07:00 as 09:00 (Sala 12 Eixo 1)


## [Ementa e programa](http://www.matematicaaplicada.saomateus.ufes.br/sites/matematicaaplicada.saomateus.ufes.br/files/field/anexo/Otimiza%C3%A7%C3%A3o%20I%20-%20DMA11995.pdf)
{:.no_toc}


## Objetivos da disciplina
{:.no_toc}

- Estudar conceitos básicos em programação não linear
- Estudar os fundamentos dos métodos de resolução clássicos para programação não linear, sobretudo sem restrições
- Analisar aspectos teóricos e numéricos dos métodos
- Implementar algoritmos em computador e testá-los em problemas da literatura


## Textos de referência

- [**Friedlander, A. Elementos de Programação Não-Linear.**](https://www.ime.unicamp.br/~friedlan/livro.pdf) (uma versão reformulada deste livro feita em 2019 também está disponível gratuitamente – [em inglês](https://www.researchgate.net/profile/Ana_Friedlander/publication/333092979_Lectures_on_Fundamentals_of_Numerical_Optimization_This_work_is_licensed_under_a_Creative_Commons_Attribution-NonCommercial-NoDerivatives_40_International_License/links/5cdb3316299bf14d95986f4c/Lectures-on-Fundamentals-of-Numerical-Optimization-This-work-is-licensed-under-a-Creative-Commons-Attribution-NonCommercial-NoDerivatives-40-International-License.pdf?_sg%5B0%5D=OcGvJeXueMxS6BI2Ruh7vdBjq1UbRs08hbzY_ieOwf-F0wbQV_O5SCrfExGkTY-y43lsfpsMQPPREXRuUtCI3Q.L1d61aB9LuNNTfXTsMGRDUyMu00T2tMlftIlfXKRwzMOxblNU-PGVtK1f8wKCtVkis9mkC5L8aBBMztB8CL8Pg&_sg%5B1%5D=vow2_Zf4aDnMI9DAyt0keCr_vCEW83UgpiHMcP9TuSekVV5WsTXWfPlSy9f0mvI65u3MoRoPQsY8UAxf5x5ERSHyb330XujVzueLhVpB79ZJ.L1d61aB9LuNNTfXTsMGRDUyMu00T2tMlftIlfXKRwzMOxblNU-PGVtK1f8wKCtVkis9mkC5L8aBBMztB8CL8Pg&_iepl%5BviewId%5D=vGV9CjhN7zYAxyRbOeaGqa1E&_iepl%5BsingleItemViewId%5D=DdnpMX2t0bkYAOVB5OSNnqJP&_iepl%5BpositionInFeed%5D=8&_iepl%5BhomeFeedVariantCode%5D=ncls&_iepl%5BactivityId%5D=1105855063920647&_iepl%5BactivityType%5D=service_add_recommendation_activity&_iepl%5BactivityTimestamp%5D=1558097593&_iepl%5BrecTarActComb%5D=person_publish_publication&_iepl%5BrecActVar%5D=feed_via_people_you_follow_and_feed_interest_nodes_blended_signals_boost_preprints_and_reads%3Epublications_via_interest_nodes_scored_by_keywords_and_cited_a_boost_preprints_and_reads&_iepl%5BrecScore%5D=39.05640411377&_iepl%5Bcontexts%5D%5B0%5D=homeFeed&_iepl%5BtargetEntityId%5D=PB%3A333092979&_iepl%5BinteractionType%5D=publicationDownload))
- [Ribeiro, A. A; Karas, E. W. Otimização contínua. Cengage, 2014.](https://www.cengage.com.br/livro/otimizacao-continua/) (uma versão alternativa similar [neste link](https://www.ime.unicamp.br/~sandra/MS629/handouts/livro28jul.pdf))
- [Martínez, J. M.; Santos, S. A. Métodos computacionais de otimização](https://www.ime.unicamp.br/~sandra/MT601/handouts/MCDO_set2020.pdf)
- Luenberguer; Ye. Linear and Nonlinear Programming. Springer, 2008.  
    (disponível na biblioteca).
- Nocedal, J.; Wright, S. J. Numerical optimization. Springer, 2006


## Textos complementares
{:.no_toc}

- [Izmailov, A.; Solodov, M. Otimização vol 1. SBM](https://loja.sbm.org.br/index.php/otimizac-o-volume-1.html)
- [Martínez, J. M. Otimização prática usando o Lagrangiano aumentado](http://www.ime.unicamp.br/~martinez/lagraum.pdf)


## Canais de acesso
{:.no_toc}

- E-mail do professor: leonardo.secchin@ufes.br
- Sala do professor: prédio do Departamento de Matemática Aplicada, sala 08


## Formas de avaliação
{:.no_toc}

- provas escritas, listas de exercícios, trabalhos computacionais ou apresentações orais.


## Avaliações

- **Avaliação 1**
<!--   - **Prova escrita** -->
<!--   - Conteúdo: condições de otimalidade para otimização irrestrita, métodos de descida gerais (em particular, gradiente e Newton), convexidade -->
  - Valor: 10,0 pontos
  - **Data: --**

- **Avaliação 2**
<!--   - **Apresentação de trabalho computacional** -->
<!--   - Conteúdo: método dos gradientes conjugados, métodos quase-Newton, método do gradiente espectral -->
  - Valor: 10,0 pontos
  - **Data: --**

- **Avaliação 3**
<!--   - **Lista de exercícios** -->
<!--   - Conteúdo: otimização com restrições; método de restrições ativas -->
  - Valor: 10,0 pontos
<!--   - **TAREFAS A SEREM ENTREGUES:** -->
<!--     - exercícios 13.1, 13.6, 13.13 (livro de Ana Friedlander) -->
<!--     - exercícios 2, 3, 8 ([Lista 4](https://drive.google.com/file/d/1OD83-5-rjmD8pVqrVnYFY_MPuUpoD6e6/view?usp=sharing)) -->
  - **Data: --**
<!--   - *Entregar resolução por escrito* -->

- **PROVA FINAL**
  - **Prova escrita**
  - Conteúdo: toda a matéria
  - Valor: 10,0 pontos
  - **Data: --**


## Critérios para aprovação
{:.no_toc}

- Faltas acima de 25% da carga horária –> reprovado(a) por falta
- Média parcial >= 7,0 —> aprovado(a) (desde que não reprovado(a) por falta)
- Média parcial < 7,0 —> Avaliação final (desde que não reprovado(a) por falta). Neste caso, média final >= 5,0 —> aprovado(a).


## <a name="listas"></a>Listas de exercícios

- [LISTA 1 – Conceitos básicos, otimização irrestrita](https://drive.google.com/file/d/1yV6DClaPT3zCmB1JkfnVq_j4g77-8EJU/view?usp=sharing)
- [LISTA 2 – Convexidade](https://drive.google.com/file/d/1dtHGGeXg4Sn4qz-3PeWBFdQvG9C5mucq/view?usp=sharing)
- [LISTA 3 – Métodos para otimização sem restrições](https://drive.google.com/file/d/1_SjC-bMI8S4rQViRZ5LZe1Ef4oad1jwv/view?usp=sharing)
- [LISTA 4 – Otimização com restrições](https://drive.google.com/file/d/1OD83-5-rjmD8pVqrVnYFY_MPuUpoD6e6/view?usp=sharing)


## Trabalhos computacionais

- Método dos gradientes conjugados: [descrição](https://drive.google.com/file/d/1MnXOSK4mQs5rVvqPdjBzfA6tTMYreLOq/view?usp=sharing); [código base](/files/otim1/gc.jl)
- Método do gradiente espectral: [descrição](https://drive.google.com/file/d/1peXtd38yV7RDbVAqRp0NFCEu06RCLoJI/view?usp=sharing); [código base](/files/otim1/gradiente_newton.zip)
- Quase-Newton (BFGS) globalizado: [descrição](https://drive.google.com/file/d/1v6_Ka1Tj5MJs2qiwNSsZ7ICzbAXA0fMz/view?usp=sharing); [código base](/files/otim1/gradiente_newton.zip)


## Material

### <a name="basico"></a>Conceitos básicos

*Referência principal:* [Friedlander, A. Elementos de Programação Não-Linear](https://www.ime.unicamp.br/~friedlan/livro.pdf) **(capítulo 1)**

- [**ANOTAÇÕES** - Conceitos básicos](/files/otim1/1.Conceitos_basicos.pdf)
- [VÍDEO: Uma visão geral da otimização - fala do prof. Jose Mario Martinez (Unicamp)](https://www.facebook.com/IMECCUnicampBR/videos/1925349244449867/)


### <a name="irrestrito"></a>Otimização sem restrições

*Referência principal:* [Friedlander, A. Elementos de Programação Não-Linear](https://www.ime.unicamp.br/~friedlan/livro.pdf) **(capítulo 2)**  
*Referência complementar:* [Ribeiro, A. A; Karas, E. W. Otimização contínua. Cengage, 2014](https://www.ime.unicamp.br/~sandra/MS629/handouts/livro28jul.pdf) **(capítulo 2)**

- [**ANOTAÇÕES** - Otimização sem restrições](/files/otim1/2.Otimizacao_sem_restricoes.pdf)


### <a name="convexidade"></a>Convexidade

*Referência principal:* [Friedlander, A. Elementos de Programação Não-Linear](https://www.ime.unicamp.br/~friedlan/livro.pdf) **(capítulo 3)**  
*Referência complementar:* [Ribeiro, A. A; Karas, E. W. Otimização contínua. Cengage, 2014](https://www.ime.unicamp.br/~sandra/MS629/handouts/livro28jul.pdf) **(capítulo 3)**

- [**ANOTAÇÕES** - Convexidade](/files/otim1/3.Convexidade.pdf)


### <a name="julia"></a>A linguagem de programação Julia

Julia é uma linguagem de programação de alto nível criada em 2012 que implementa várias ferramentas para uso geral em matemática aplicada. Em particular, Julia possui várias ferramentas para otimização. É muito parecida com o Matlab, portanto os códigos são fáceis de entender. Os trabalhos computacionais desta disciplina serão feitos em Julia. A seguir você encontra instruções de instalação, bem como exemplos simples que ajudarão você a dar os primeiros passos nas ferramentas de otimização disponíveis no Julia.

- [Tutorial para instalação e uso da linguagem de programação Julia](/julia/)
- [Julia para Otimização - primeiros passos](/juliaopt/)
  - Estude os exemplos 1 a 5, 8, 9, 12 e 14 do *link* acima
  - Execute os testes com o método do gradiente do tópico **Métodos de descida gerais**

**Para auxiliá-lo na instalação do Julia pré-compilado + pré-requisitos + pacotes utilizados nas disciplinas de otimização, baixe [ESTE SCRIPT](/files/julia/instalar_julia) e siga as instruções contidas nele (testado no Ubuntu 22.04)**


### Métodos para otimização sem restrições

1. <a name="descida"></a>**Métodos de descida gerais**

   *Referência principal:* [Friedlander, A. Elementos de Programação Não-Linear](https://www.ime.unicamp.br/~friedlan/livro.pdf) **(seção 6.1)**  
   *Referência complementar:* [Martínez, J. M.; Santos, S. A. Métodos computacionais de otimização](https://www.ime.unicamp.br/~sandra/MT601/handouts/MCDO_set2020.pdf) **(seção 6.1)**

   - [**ANOTAÇÕES** - Métodos de descida gerais](/files/otim1/4.1.Metodos_descida_gerais.pdf)
   - [**ANOTAÇÕES** - Convergência dos métodos de descida](/files/otim1/4.3.Convergencia_metodos_descida.pdf) (baseado no Teorema 6.1.6 da referência complementar)
   - *Código do método do gradiente com busca linear inexata - veja seção "Códigos em Julia"*


1. <a name="newton"></a>**Método de Newton**

   *Referência principal:* [Friedlander, A. Elementos de Programação Não-Linear](https://www.ime.unicamp.br/~friedlan/livro.pdf) **(capítulo 5, seção 6.2)**  
   *Referência complementar:* [Martínez, J. M.; Santos, S. A. Métodos computacionais de otimização](https://www.ime.unicamp.br/~sandra/MT601/handouts/MCDO_set2020.pdf) **(seção 6.1)**

   - [**ANOTAÇÕES** - Método de Newton](/files/otim1/4.2.Metodo_de_Newton.pdf)
     - Leitura interessante: [Artigo sobre o desenvolvimento da ideia Newtoniana ao longo dos anos (download acessando pela Universidade)](https://doi.org/10.1007/978-3-319-94015-1_9)
   - [**ANOTAÇÕES** - Convergência global vs local](/files/otim1/4.4.Convergencia_global_vs_local.pdf)
   - [**ANOTAÇÕES** - Convergência dos métodos de Newton e Newton globalizado](/files/otim1/4.5.Convergencia_Newton.pdf)
   - *Código dos métodos de Newton e Newton globalizado - veja seção "Códigos em Julia"*


1. <a name="quase-newton"></a>**Métodos quase-Newton**

   *Referência principal:* [Martínez, J. M.; Santos, S. A. Métodos computacionais de otimização](https://www.ime.unicamp.br/~sandra/MT601/handouts/MCDO_set2020.pdf) **(seção 6.3)**  
   *Referência complementar 1:* [Friedlander, A. Elementos de Programação Não-Linear](https://www.ime.unicamp.br/~friedlan/livro.pdf) **(seção 6.1)**  
   *Referência complementar 2:* Ribeiro, A. A; Karas, E. W. Otimização contínua. Cengage, 2014 **(seção 5.4 do livro publicado pela Cengage)**

   - [**ANOTAÇÕES** - Métodos quase-Newton tipo secante](/files/otim1/4.7.Quase-Newton.pdf)


1. <a name="espectral"></a>**Método do gradiente espectral**

    *Referência principal:* [TCC de Elivandro Oliveira Grippa](/files/ic-tcc/TCC_Elivandro_Grippa.pdf) **(seção 3.4)**

   - [**ANOTAÇÕES** - Método do gradiente espectral](/files/otim1/4.8.Gradiente_espectral.pdf)


1. <a name="cg"></a>**Método dos gradientes conjugados para minimização de quadráticas**

   *Referência principal:* Ribeiro, A. A; Karas, E. W. Otimização contínua. Cengage, 2014 **(seção 5.3 do livro publicado pela Cengage)**

   - [**ANOTAÇÕES** - Método dos gradientes conjugados](/files/otim1/4.6.Gradientes_conjugados.pdf)


### <a name="kkt"></a>Otimização com restrições

*Referência principal:* [Friedlander, A. Elementos de Programação Não-Linear](https://www.ime.unicamp.br/~friedlan/livro.pdf) **(seções 13.1 e 13.2)**

- [**ANOTAÇÕES** - Otimização com restrições; condições de Karush-Kuhn-Tucker (KKT)](/files/otim1/5.Otimizacao_com_restricoes-KKT.pdf)


### Métodos para otimização com restrições

*Referência principal 1:* [Friedlander, A. Elementos de Programação Não-Linear](https://www.ime.unicamp.br/~friedlan/livro.pdf)  
*Referência principal 2:* [Martínez, J. M. Otimização prática usando o Lagrangiano aumentado](http://www.ime.unicamp.br/~martinez/lagraum.pdf) **(capítulo 2)**  
*Referência complementar:* [Martínez, J. M.; Santos, S. A. Métodos computacionais de otimização](https://www.ime.unicamp.br/~sandra/MT601/handouts/MCDO_set2020.pdf)

- <a name="min-rest-lineares"></a>[**ANOTAÇÕES** - Minimização com restrições lineares de igualdade (método do gradiente projetado para restrições lineares)](/files/otim1/6.1.Min_restricoes_lineares_igualdade.pdf)
- [**ANOTAÇÕES** - Minimização com restrições lineares de desigualdade; método das restrições ativas](/files/otim1/6.2.Min_restricoes_lineares_desig-restricoes_ativas.pdf)
- <a name="externa"></a>[**ANOTAÇÕES** - Penalização externa](/files/otim1/6.3.Penalizacao_externa.pdf)
- <a name="interna"></a>[**ANOTAÇÕES** - Penalização interna](/files/otim1/6.5.Penalizacao_interna.pdf)
- <a name="sqp"></a>[**ANOTAÇÕES** - Programação Quadrática Sequencial (SQP, do inglês) - algoritmo básico](/files/otim1/6.6.SQP.pdf)
- <a name="pi"></a>[**ANOTAÇÕES** - Pontos interiores para problemas com restrições lineares](/files/otim1/6.7.Pontos_interiores_para_PL.pdf)
- [**ANOTAÇÕES** - SQP para restrições não lineares de igualdade e desigualdade](/files/otim1/6.8.SQP_subprob_IP.pdf)


## <a name="codigos"></a>Códigos em Julia

- [Métodos do gradiente, Newton e Newton globalizado, com funções para testes](/files/otim1/gradiente_newton.zip)
- ["Pré-implementação" do método de gradientes conjugados para quadráticas, com função para testes](/files/otim1/gc.jl)


## Tópicos extras

### <a name="desempenho"></a>Comparação do desempenho de diferentes algoritmos

*Referência principal:* Ribeiro, A. A; Karas, E. W. Otimização contínua. Cengage, 2014 **(seção 6.3 do livro publicado pela Cengage)**

- [**ANOTAÇÕES**](/files/topicospo/performance_profiles.pdf) - Perfis de desempenho segundo [Dolan e Moré](https://link.springer.com/article/10.1007/s101070100263) e comentários sobre contagem de tempo de execução
  - [BenchmarkProfiles.jl](https://github.com/JuliaSmoothOptimizers/BenchmarkProfiles.jl) - gerando perfis de desempenho com o Julia


### Breve introdução à otimização aplicada ao aprendizado de máquina supervisionado (a fazer)


### Outros

   - <a name="grad-passo-cte"></a>[**ANOTAÇÕES** - Método do gradiente com passo constante e introdução à complexidade de algoritmos](/files/otim1/4.9.Gradiente_passo_cte.pdf)
   - <a name="grad-projetado"></a>[**ANOTAÇÕES** - Método do gradiente projetado para restrições convexas quaisquer](/files/otim1/6.9.Gradiente_projetado.pdf)


## Vídeos interessantes sobre Otimização

-  [IMECC Unicamp no facebook](https://www.facebook.com/IMECCUnicampBR/videos/1925349244449867/)
-  [Grupo de Otimização IMECC Unicamp](http://www.ime.unicamp.br/~martinez/seminarios.html)
