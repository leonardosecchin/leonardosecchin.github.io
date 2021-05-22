---
layout: archive
title: "Iniciação Científica / TCC"
permalink: /ic/
author_profile: true
---

De acordo com a UFES, "o Programa Institucional de Iniciação Científica (PIIC) é voltado para a iniciação à pesquisa de estudantes de graduação universitária. Ele visa fundamentalmente incentivar a carreira científica dos estudantes de graduação que apresentam bom desempenho acadêmico, preparando-os para a pós-graduação" (retirado do [site da PRPPG](https://prppg.ufes.br/programa-institucional-de-ic-piic)). Nesse sentido, nas minhas orientações procuro sugerir a leitura de artigos científicos e, dentro do possível, proponho algo novo para estudar.

O(A) aluno(a) que deseja realizar trabalho de iniciação científica (IC) comigo poderá propor temas relacionados à otimização de acordo com suas habilidades e interesses. **Porém encorajo os estudantes interessados em uma iniciação científica comigo a procurar-me mesmo que não tenham temas em mente.** Além de considerar o conhecimento prévio do(a) estudante, a escolha do tema levará em conta meus projetos de pesquisa, interesses em novas frentes, desempenho do(a) candidato(a) em disciplinas, adequação do tema ao perfil de formação desejado para o egresso do curso e quantidade de alunos que oriento. O(A) aluno(a) interessado(a) deve ficar atento(a) às datas estabelecidas nos [editais de IC da UFES](http://prppg.ufes.br/ultimos-editais-iniciacao-cientifica), e entrar em contato comigo pessoalmente ou por **email** (leonardo.secchin@ufes.br), **com antecedência**.

Estudantes interessados(as) em TCC devem procurar-me com antecedência. É desejável iniciar o estudo pelo menos 1 ano antes da data de colação de grau, sobretudo se o(a) estudante não tem um tema maduro com o qual já tenha trabalhado.


### Sugestões de temas/projetos

- Métodos baseados em Lanczos para resolução de problemas de regiões de confiança ([ref](https://epubs.siam.org/doi/abs/10.1137/S1052623497322735?journalCode=sjope8) ou [ref](https://www.researchgate.net/publication/2263739_Solving_the_Trust-Region_Subproblem_using_the_Lanczos_Method))
- Métodos de gradiente para otimização multi-objetivo ([ref](http://www.optimization-online.org/DB_FILE/2020/04/7729.pdf))
- Métodos Quasi-Newton com baixo uso de memória ([ref 1](https://www.tandfonline.com/doi/abs/10.1080/02331934.2020.1712391?journalCode=gopt20), [ref 2](https://arxiv.org/pdf/2101.04413.pdf), [ref 3](https://arxiv.org/pdf/2101.11048.pdf))
- Tópicos variados em otimização não linear. Uma referência com vários tópicos é o livro “Numerical Optimization” de Nocedal e Wright
- Modelos típicos de Pesquisa Operacional (em particular, de programação inteira mista), vistos nas disciplinas “Pesquisa Operacional I e II” (Exemplos: [DRLP](https://drive.google.com/file/d/1OQmZN3R_ZWwI8yjiXoLhmeDEDke4r3zy/view?usp=sharing); [Grade de horários](https://drive.google.com/open?id=12h9bnTpkS2lSmRNNLTlUkTakGrF7g6-i))
- Variantes BFGS para otimização irrestrita ([ref 1](https://www.researchgate.net/publication/30932966_A_Modified_BFGS_Algorithm_for_Unconstrained_Optimization), [ref 2](https://doi.org/10.1016/S0377-0427(00)00540-9), [ref 3](https://doi.org/10.1186/s13660-017-1453-5), [ref 4](https://doi.org/10.1007/s40314-018-0620-8))
- Método do gradiente ponderado com retardo para minimização de quadráticas estritamente convexas ([ref 1](http://www.optimization-online.org/DB_HTML/2019/03/7142.html), [ref 2](http://www.optimization-online.org/DB_HTML/2020/03/7655.html))
- Condições sequenciais de otimalidade em programação não linear ([slides](https://drive.google.com/open?id=1UOQ_CFm3yPapuoWBxL1sKI6LMZClJUpq), [livro SBMAC](http://arquivo.sbmac.org.br/arquivos/notas/livro_83.pdf))
- Métodos de otimização para Inteligência Artificial/Aprendizado de máquina ([intro](https://drive.google.com/file/d/1cy_d21RDGfP-VhFNRUdD7DFN5xI2ATQ-/view?usp=sharing))
- O ensino de Pesquisa Operacional/Otimização no Ensino Médio *(depende de parceria com docente da área de educação matemática)*


## Pré-requisitos

Os pré-requisitos variam com o tema de estudo. Em geral, é recomendado que o(a) aluno(a) tenha cursado uma disciplina de programação não linear (na matemática industrial, "Otimização 1"). Para projetos que requeiram implementação computacional, é desejável mínima experiência com alguma linguagem de programação. Como as referências são em grande parte escritas em inglês, é desejável que o(a) aluno(a) consiga ler textos na língua.


### Linguagens de programação

Nos trabalhos que requerem implementação computacional, recomendo o uso da linguagem **Julia**. Nela, a escrita de modelos de otimização, o acesso à bancos de problemas-teste e o uso de pacotes de otimização consagrados é fácil. Essas características nem sempre estão disponíveis em C, Fortran ou mesmo Python. Além disso, é fácil programar em Julia (assemelha-se ao Matlab) e sua eficiência é comparada à linguagens de baixo nível como C e Fortran. Portanto, mesmo que você domine uma linguagem de programação como Python, recomendo considerar o uso do Julia.

Você encontra mais detalhes da linguagem [neste link](/julia/) e exemplos para iniciar o uso do Julia em otimização [neste link](/juliaopt/).


## Etapas

### para ingresso na IC

Em primeiro lugar, o(a) aluno(a) deve mostrar seu interesse por email ou pessoalmente. Combinado o tema a ser estudado, escrevo um subprojeto em comum acordo com o candidato. O projeto é submetido ao edital de IC corrente, e será avaliado/classificado por docentes da UFES. Se aprovado, a execução do subprojeto começa seguindo calendário estabelecido em edital.

Todo subprojeto de IC é vinculado a um projeto de pesquisa no qual faço parte.

**Bolsas de IC para estudantes:** Há possibilidade de bolsa(s) de IC, a depender da disponibilidade de recursos previstos nos editais. Na escolha do bolsista são considerados aspectos como desempenho curricular, entrevista e situação de vulnerabilidade sócioeconômica (cadastro em programas de assistência estudantil).


### para orientação de TCC

O(a) aluno(a) deve mostrar seu interesse por email ou pessoalmente. O TCC consta como disciplina obrigatória dos cursos de graduação, mas não é necessária a matrícula para a orientação. Na verdade, é desejável que o estudo inicie um ano antes da colação de grau.


## Orientações

### em andamento

- 2020-2021 (IC). Variantes do método do gradiente para otimização irrestrita.  
  Aluno: Elivandro Oliveira Grippa  
  [Resumo do projeto](https://drive.google.com/file/d/1AsCeRaIqg_82Q-irbgp4zOW4UcmuQDKt/view?usp=sharing)

- 2020-2021 (IC). Introdução à otimização aplicada ao aprendizado de máquina supervisionado.  
  Aluno: Matheus Becali Rocha  
  [Resumo do projeto](https://drive.google.com/file/d/1cy_d21RDGfP-VhFNRUdD7DFN5xI2ATQ-/view?usp=sharing)


### concluídas

- 2021 (TCC). Uma condição sequencial de otimalidade em otimização não linear e sua aplicação a um método lagrangiano aumentado  
  Aluno: Thiago Mantegazini
- 2020 (IC). Métodos e formulações para o problema de layout em fila dupla  
  Aluno: Manoel de Almeida Rocha Neto  
  [Resumo do projeto](https://drive.google.com/file/d/1OQmZN3R_ZWwI8yjiXoLhmeDEDke4r3zy/view?usp=sharing)
- 2014 (TCC). Problemas de escalonamento  
  Aluno: Rafael Marin Permanhane
- 2014 (TCC). O problema da elaboração de grade de horários via Programação Inteira  
  Aluno: Rodrigo Leppaus de Araujo
- 2013 (IC). O Problema de Alocação de Horários via Programação Inteira  
  Aluno: Rafael Marin Permanhane  
  [Resumo do projeto](https://drive.google.com/open?id=12h9bnTpkS2lSmRNNLTlUkTakGrF7g6-i)
- 2012 (IC). Programação Inteira: Teoria e Algoritmos  
  Aluno: Rodrigo Leppaus de Araujo  
  [Resumo do projeto](https://drive.google.com/open?id=136KkA12IjmcM1oDOAtcIL0SvynE0i2HN)
- 2012 (IC). Utilização de um Algoritmo Genético para Solução de Problemas em Engenharia  
  Aluna: Cintia Cassa Libardi


## Modelos não oficiais em Latex

Os modelos abaixo **NÃO são modelos oficiais** de qualquer curso ou da Universidade. Seu uso é facultativo.

Podem ser baixados e modificados livremente pelos alunos e docentes, não sendo necessário pedir permissão para tal. É importante frisar que **não há suporte**, sendo de inteira responsabilidade do estudante e seu orientador qualquer dano ou problema decorrente do seu uso.

**[Modelo TCC Matemática Industrial](https://drive.google.com/file/d/1S-Rtsf3iPgLUQ4IwrHRJYUMaZQQZ-50T/view?usp=sharing)**

**[Modelo apresentação slides](https://drive.google.com/file/d/1-cmwFB82Ds1hpxEtIlJIKQPfuzNU6bCW/view?usp=sharing)**
