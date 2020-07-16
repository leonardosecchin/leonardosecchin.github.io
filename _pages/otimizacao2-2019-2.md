---
layout: archive
title: "Otimização 2 (2019/2)"
permalink: /otimizacao2-2019-2/
author_profile: true
---

## AULAS

*   **Apresentação**
    1.  TAREFA: Ler os capítulos 1 ao 4 (até a seção 4.1) do livro [Martínez, J. M. Otimização prática usando o Lagrangeano aumentado](http://www.ime.unicamp.br/~martinez/lagraum.pdf)
*   **Revisão Condições de Karush-Kuhn-Tucker (KKT)**  
    (aulas [14](https://drive.google.com/file/d/1mEj47JIKDO6CeRAv8ptcvO6JfQzDQtGS/view) e [15](https://drive.google.com/file/d/1bgp8z4aigNX4xoTAyF3r6r5az9LTDr0A/view) de Otimização I 2019/1)
*   **[lab] Modelagem e resolução de problemas através do AMPL**
    1.  [Ambiente AMPL (demonstração gratuita) para download](https://ampl.com/try-ampl/download-a-free-demo/). Neste link você pode:
        1.  Baixar o AMPL para seu sistema (Windows/Linux)
        2.  Ver os solvers disponíveis para uso e suas especificações (algoritmos implementados e problemas que se aplicam)
    2.  Dicas de configuração do AMPL (Ubuntu)
        1.  Você pode criar um atalho para o executável do AMPL de modo que possa executá-lo a partir de qualquer pasta no terminal. Se, por exemplo, o AMPL está em “/home/usuario/AMPL”, basta inserir a linha  
            **alias ampl=”/home/usuario/AMPL/./ampl**“  
            no arquivo “.bashrc” na pasta do usuário (o arquivo é oculto, peça para exibí-los). Abrindo um novo terminal, você poderá executar o AMPL de qualquer local através do comando  
            **ampl**
        2.  O ambiente AMPL nem sempre localiza os seus resolvedores automaticamente (ao executar “solve” o AMPL pode reportar que não existe o solver). Para resolver isso, insira a linha  
            **export PATH=$PATH:/home/usuario/AMPL**  
            no arquivo “.bashrc” na pasta do usuário. Abra um novo terminal. Isso fará com que o Ubuntu considere sua pasta do AMPL como uma pasta que contém executáveis de sistema
    3.  Documentação e exemplos
        1.  [Documentação completa do AMPL](https://ampl.com/resources/the-ampl-book/)
        2.  [Referência para construção de modelos no AMPL](https://ampl.com/REFS/amplmod.pdf)
        3.  [Um exemplo](https://en.wikipedia.org/wiki/AMPL)
        4.  [Manual resumido de comandos AMPL](http://www.dim.uchile.cl/~rlopez/TESIS/AMPL/Manual_AMPL.pdf)
    4.  Exercícios
        1.  Quadrados mínimos: resolver Ax=b equivale a encontrar x tal que ||Ax-b||^2=0\. Se o sistema não possuir solução, ainda podemos encontrar um x “menos pior possível” minimizando ||Ax-b||^2\. Escreva esse modelo em AMPL que leia as dimensões m, n e matrizes A (mxn) e b (mx1) de um arquivo separado. Faça o mesmo para o problema de encontrar um x que minimiza o resíduo do sistema e que tenha no máximo K (<n) entradas não nulas.
        2.  [Empacotamento de círculos e esferas via programação não linear](https://www.ime.usp.br/~egbirgin/publications/bs.pdf)
        3.  [Configurações iniciais para simulações de dinâmica molecular via empacotamento de moléculas – PACKMOL](http://m3g.iqm.unicamp.br/packmol/home.shtml). Veja [artigo](http://m3g.iqm.unicamp.br/packmol/packmol2.pdf)
        4.  Problemas de localização retirado [deste artigo](https://dl.acm.org/citation.cfm?doid=502800.502803), seção 3
        5.  [Estudo de tabelas de imposto de renda via otimização](https://drive.google.com/open?id=1o7mGGrE4Tdt7rREdd4LWB-yyu4nwuvGq)
*   [**Penalidade Externa Pura / controle de admissibilidade**](https://drive.google.com/file/d/1DnDtD7dc5LL30bfPuAvdapjh90GFOi86/view?usp=drivesdk)
    1.  Penalidade externa de curso anterior: aulas [19](https://drive.google.com/file/d/1OgFeMsSdSpY9dt8ppRcWbsymyQsM7jmz/view) e [20](https://drive.google.com/file/d/1bzgryw0Dw0_bognvDVTAPUZP7pS1M95a/view?usp=drivesdk) de Otimização I 2019/1
    2.  [Prova das condições KKT usando penalidade externa pura](https://drive.google.com/open?id=12vlGu5iZgLccCVGqdH72GTOoMZRGaYMK) (aula 21 de Otimização I 2019/1)
*   **[lab] Pacote** [**ALGENCAN**](https://www.ime.usp.br/~egbirgin/tango/codes.php) **(Lagrangeano Aumentado)**  
    Roteiro da aula:
    1.  [Baixe os arquivos fonte do ALGENCAN](https://www.ime.usp.br/~egbirgin/tango/downloads.php)
    2.  [Baixe o interpretador AMPL (arquivo solvers.tgz)](http://www.netlib.org/ampl/) (código livre)
    3.  Descompacte os arquivos em um local de sua preferência
    4.  Configure e compile o interpretador AMPL executando  
        **./configure-here**  
        e depois  
        **make**  
        da pasta “solvers”. _**CASO TENHA SUCESSO**_, isso criará a biblioteca compilada “amplsolver.a” na pasta “solvers”. Essa biblioteca é a ligação entre pacotes como ALGENCAN e o interpretador AMPL
    5.  Como configurar e compilar ALGENCAN com interface AMPL:
        1.  Configure o caminho do interpretador AMPL no arquivo “Makefile” no diretório raiz de ALGENCAN (isto é, “[…]/algencan-3.1.1/Makefile”) ajustando a linha “AMPL”. O caminho deve apontar para o local que contém a pasta “solvers”. Por exemplo, se a pasta “solvers” está situada no diretório “/home/usuario/otim2/solvers”, você pode atribuir à linha AMPL os valores  
            **/home/usuario/otim2**  
            ou ainda  
            **$(HOME)/otim2**
        2.  Compile ALGENCAN com a interface AMPL executando  
            **make algencan-ampl**  
            da pasta de ALGENCAN. É preciso ter instalado o compilador FORTRAN “gfortran” e opcionalmente “gcc-4.9” e “g++-4.9”. Se a versão 4.9 de gcc/g++ não estiver instalada, você pode usar a versão mais atual trocando as linhas CC e CP do Makefile de ALGENCAN para **gcc** e **g++**, respectivamente. _**CASO TENHA SUCESSO**_, isso criará o executável  
            **[…]/algencan-3.1.1/bin/ampl/algencan**
    6.  Use o AMPL para escrever modelos e exportá-los para arquivos em formato livre “.nl”. Exemplo:
        1.  Escreva o modelo “modelo.mod” e, se precisar, o arquivo de dados “modelo.dat”
        2.  Execute o ampl
        3.  Dentro do ampl, execute na ordem:
            1.  **model modelo.mod;**
            2.  **data modelo.dat;**
            3.  **option presolve 0;**
            4.  **write gmodelo;**
        4.  O comando “write” escreve o arquivo “modelo.nl” (tem o “g” mesmo antes do nome do modelo). Se preferir faça um arquivo “modelo.run” com esses comandos e execute-os em lote:  
            **ampl modelo.run**
    7.  Resolva os modelos com ALGENCAN usando o executável  
        **[…]/algencan-3.1.1/bin/ampl/algencan**  
        criado na compilação de ALGENCAN:
        1.  Faça seus modelos ou [baixe modelos .nl prontos para teste](https://drive.google.com/open?id=1x2sxoyiS8MnggIkU4Q9NbHqi-fjbMpBv)
        2.  Para resolvê-los, execute  
            **./algencan modelo.nl**  
            da pasta “[…]/algencan-3.1.1/bin/ampl”
    8.  Alterando configurações de ALGENCAN
        1.  [Baixe o arquivo de configurações](https://drive.google.com/open?id=1i898D5VyExH2s0H-VpVNkw41nxzjrphb) e descompacte-o na pasta “bin/ampl” do executável de ALGENCAN (“[…]/algencan-3.1.1/bin/ampl”)
        2.  Abra o arquivo em um editor de textos simples e descomente a configuração que deseja utilizar
        3.  Use o arquivo de configurações executando  
            **./algencan modelo.nl specfnm=”config_algencan**“  
            da pasta “[…]/algencan-3.1.1/bin/ampl”
        4.  Execute  
            **./algencan -=**  
            e veja outras opções de personalização via terminal de comandos
*   **[Método do Lagrangeano Aumentado – parte 1 de 3 (Apresentação)](https://drive.google.com/open?id=1ycpA3ZNl6cWMMRp_wY6mNR5ovPJ5HD8P)**
*   **[lab] Mais sobre AMPL**
    1.  Uma maneira simples de integrar ALGENCAN (ou qualquer outro pacote compilado com a interface AMPL) ao ambiente AMPL
        1.  Ao seguir os procedimentos para compilação de ALGENCAN com interface AMPL da aula 5, criamos o executável  
            **[…]/algencan-3.1.1/bin/ampl/algencan**
        2.  Uma maneira simples de integrar este executável no ambiente AMPL é copiá-lo para a pasta do AMPL, onde encontram-se os executáveis dos outros resolvedores
        3.  Desta forma você pode resolver “modelo.mod” de dentro do ambiente AMPL executando
            1.  **model modelo.mod;**
            2.  **data modelo.dat;**
            3.  **option solver algencan;**
            4.  **solve;**
        4.  Se necessário, reveja o item B “Dicas de configuração do AMPL (Ubuntu)” da aula 3 para configurar o ambiente AMPL
        5.  Mudando opções de ALGENCAN dentro do ambiente AMPL
        6.  As opções via linha de comando (que você pode ver executando “./algencan -=”, veja item H da aula 5) podem ser mudadas de dentro do AMPL executando  
            **option algencan_options ‘LISTA DE OPÇÕES’**  
            Por exemplo, você pode atribuir um arquivo externo de configurações:  
            **option algencan_options ‘specfnm=”caminho do arquivo”‘**  
            Outro exemplo que muda a precisão para viabilidade:  
            **option algencan_options ‘epsfeas=1e-5’**
    2.  Integrando o seu próprio código C/C++/Fortran ao AMPL (avançado)
        1.  É possível integrar a capacidade de ler modelos .nl a um código próprio. Ou seja, você pode escrever o código do seu algoritmo em C/C++/Fortran e fazê-lo capturar FO, restrições, seus gradientes e hessianas que a interface AMPL fornece. Para ter uma ideia de como isso foi feito em ALGENCAN, veja o arquivo  
            **[…]/algencan-3.1.1/sources/interfaces/ampl/amplwrapper.c**  
            [Neste link](https://ampl.com/resources/hooking-your-solver-to-ampl/), você encontra a documentação para escrever sua própria interface AMPL
*   **[Método do Lagrangeano Aumentado – parte 2 de 3 (convergência teórica)](https://drive.google.com/open?id=1o2gK8BfzL01r5a27j_ADBb6TemU6W-NE)**
*   [**Método do Lagrangeano Aumentado – parte 3 de 3 (convergência teórica)**](https://drive.google.com/open?id=1tLQGAdBCJffP8QMuluHWywaD-oRwaXq5)
*   [**Penalização Interna / Método de barreiras / Pontos interiores**](https://drive.google.com/open?id=1N00iFh-e3vz4xOyzixg1JKqa8zp1HJm-)
*   **Pontos interiores aplicado à Programação Linear; apresentação, discussão e atendimento acerca do Trabalho 1 com prática em laboratório**
    1.  **[Texto de apoio](https://drive.google.com/open?id=17a9rMYBi7TCjk_BbgTmRm_4019qiJVbW)**
    2.  Veja o primeiro trabalho na seção de avaliações
*   **[Estratégia de regiões de confiança](https://drive.google.com/open?id=1OLzPh2dD_TVz2bxXtAP9Mhyh9uvQkvA6)**
*   **[Programação Quadrática Sequencial (SQP) básica para restrições de igualdade](https://drive.google.com/open?id=1olsE4ts4a-Yt81t51S_MjHX9uxRWr-df)**
*   **[lab] Pacotes IPOPT (pontos interiores), SNOPT e WORHP (ambos SQP) para o ambiente AMPL**
    1.  IPOPT (Interior Point OPTimizer)
        1.  [Baixe o Ipopt para AMPL (prefira 64 bits quando possível)](https://ampl.com/products/solvers/open-source/)
        2.  Opções de configuração do IPOPT para AMPL: veja a seção “Options available via the AMPL Interface” [neste link](https://coin-or.github.io/Ipopt/OPTIONS.html)
        3.  Para saber mais sobre o IPOPT, veja sua principal [referência bibliográfica](http://www.optimization-online.org/DB_HTML/2004/03/836.html)
    2.  SNOPT (Sparse Nonlinear OPTimizer)
        1.  SNOPT está presente na versão corrente do AMPL
        2.  [Opções de configuração do SNOPT para AMPL](https://ampl.com/products/solvers/snopt-options/)
        3.  Para saber mais sobre o SNOPT, veja sua principal [referência bibliográfica](https://web.stanford.edu/group/SOL/papers/SNOPT-SIGEST.pdf)
    3.  WORHP (We Optimize Really Huge Problems)
        1.  Infelizmente, não está disponível para AMPL (deve ser compilado primeiro, como fizemos com ALGENCAN). Seu uso depende de licença obtida via requisição no [sítio oficial](https://worhp.de/) do pacote
        2.  Para saber mais sobre o WORHP, veja sua principal [referência bibliográfica](https://link.springer.com/chapter/10.1007/978-1-4614-4469-5_4)
    4.  [Problemas para teste (arquivos .mod)](https://wiki.mcs.anl.gov/leyffer/index.php/MacMPEC)
    5.  [Mais problemas para teste](https://ampl.com/NEW/COMPLEMENT/index.html)
*   **[Boa definição do SQP básico e algumas questões práticas do método](https://drive.google.com/open?id=11uQaOwruRMrqAJQiH_mPDTf_MzTmmW8W)**
*   **[Subproblemas quadráticos (parte 1 de 2)](https://drive.google.com/open?id=1T6jf7BmuxUDfi1xzFl6jMhy6AYFInq6F)**
*   **[Subproblemas quadráticos (parte 2 de 2)](https://drive.google.com/open?id=1Obeovb-4VjTfdV_H20-JCozJYxX6cVVM)**
*   **[Dualidade em Programação Não Linear (parte 1)](https://drive.google.com/open?id=1NRZUEr72nmoQqA6-_joTFYCaikdjqpEA)**  
    Referências:  
    (i) Izmailov, A.; Solodov, M. Otimização vol 1\. SBM.  
    (ii) Luenberguer; Ye. Linear and Nonlinear Programming. Springer, 2008.
*   **[Dualidade em Programação Não Linear (parte 2)](https://drive.google.com/file/d/1YrQrZpa4B2sVPcS84Y2Yb8zdLQ8zHZfw/view?usp=drivesdk)**
*   **[Método de planos de corte / Resolução de sistemas de inequações convexas](https://drive.google.com/open?id=1OXwC7JNp9p_KFy2_xJFS8ixFMtJRVitZ)**
*   **[lab] Resolução de sistemas via planos de corte**
    1.  Baixe o [código octave](https://drive.google.com/open?id=1Y5O66A8jWGUFJk2psBSuIKufsw17Ry5t)
    2.  O arquivo “cortes.m” implementa o método de planos de corte para resolução de sistemas lineares
    3.  O arquivo “testes.m” executa planos de corte para sistemas lineares gerados aleatoriamente

## Vídeos interessantes sobre Otimização:

1.  [IMECC Unicamp no facebook](https://www.facebook.com/IMECCUnicampBR/videos/1925349244449867/)
2.  [Grupo de otimização IMECC Unicamp](http://www.ime.unicamp.br/~martinez/seminarios.html)
