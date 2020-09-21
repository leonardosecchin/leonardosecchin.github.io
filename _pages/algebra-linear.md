---
layout: archive
title: "Álgebra Linear"
permalink: /algebra-linear/
author_profile: true
---

## ATENÇÃO: Turma semestre letivo especial de 2020

No semestre letivo especial de 2020, as informações, material de estudo, tarefas, avaliações e aulas da disciplina estarão disponíveis pelo Ambiente Virtual de Aprendizagem (AVA-UFES), [NESTE LINK](https://ava.ufes.br/course/view.php?id=15252). O(a) aluno(a) deverá fazer login com sua senha do portal do aluno para ter acesso ao curso.

Se você é aluno(a) da disciplina e não consegue ter acesso ao AVA-UFES, envie email para [leonardo.secchin@ufes.br](mailto:leonardo.secchin@ufes.br) com seu **nome completo** e **endereço de email**.


## Material semestre 2020 especial (também disponível no AVA-UFES)

### Matrizes

- [NOTAS DE AULA](https://leonardosecchin.github.io/files/alglin/notas-1.pdf)
- [VÍDEO-AULA UNIVESP: Aula sobre matrizes - parte 1](https://www.youtube.com/watch?v=r1o7RryS8WM&feature=youtu.be)
- [VÍDEO-AULA UNIVESP: Aula sobre matrizes - parte 2](https://www.youtube.com/watch?v=u4xKswRO4bQ&list=ULD4LDlLNM-W8&index=936)
- [**LISTA DE EXERCÍCIOS 1**](https://drive.google.com/file/d/11PJrb-o1OUIIm6ZtJmguxtODej6nYDZ0/view)
- **Conteúdo extra** Vídeos básicos (nível ensino médio) sobre matrizes do IMPA/Obmep. Veja as seções "O conceito de matriz" e "Operações com matrizes" em [https://portaldaobmep.impa.br/index.php/modulo/ver?modulo=75](https://portaldaobmep.impa.br/index.php/modulo/ver?modulo=75)
- **ATIVIDADES PARA NOTA:** somente no AVA-UFES


### Sistemas Lineares

- [NOTAS E AULA](https://leonardosecchin.github.io/files/alglin/notas-2.pdf)
- [Exercícios livro-texto (Boldrini) - Capítulo 2](https://drive.google.com/file/d/1ul17tDNq1nPVV_0BzAidjyaQ-cR4xQXf/view)
- [**LISTA DE EXERCÍCIOS 2**](https://drive.google.com/file/d/1fD0Gy-kU06uzeIxf2QzkUp12gZCsFTla/view)
- **Conteúdo extra** Vídeos básicos (nível ensino médio) do IMPA/Obmep. Veja as seções "Sistemas lineares" em [https://portaldaobmep.impa.br/index.php/modulo/ver?modulo=75](https://portaldaobmep.impa.br/index.php/modulo/ver?modulo=75)
- **ATIVIDADES PARA NOTA:** somente no AVA-UFES
- **CURIOSIDADE**  
> O método de resolução de sistemas lineares visto nesta seção é conhecido como **método do escalonamento**, ou **método da eliminação de Gauss**, ou ainda **método da eliminação de Gauss-Jordan**.  
Resolver sistemas lineares numericamente é uma necessidade frequente: aparece em computação gráfica, otimização, resolução de equações diferenciais etc etc etc...  
A ideia de escalonar um sistema é muito antiga, data, pelo menos, do século 18. A eliminação de Gauss consiste em uma maneira sistemática (implementável em computador) para resolução de sistemas lineares quaisquer usando as 3 operações elementares sobre linhas da matriz ampliada do sistema, como visto em aula. As operações são aplicadas de forma ordenada, de modo que os zeros na matriz ampliada apareçam primeiro nas colunas à esquerda, depois nas colunas à direita. Veja o [Wikipedia](https://pt.wikipedia.org/wiki/Elimina%C3%A7%C3%A3o_de_Gauss) para uma explicação "super-rápida" (ou o [Wikipedia em inglês](https://en.wikipedia.org/wiki/Gaussian_elimination), que está melhor escrito).  
**Mas, e daí?**  
Daí que, por incrível que pareça, a ideia deste método resiste até hoje em pacotes computacionais modernos. Talvez o exemplo mais famoso seja a "rotina MA57". Esta rotina é usada em inúmeros métodos computacionais de hoje em dia, e é considerada como uma espécie de "padrão de qualidade" na resolução de sistemas. Evidentemente, os métodos implementados nas rotinas modernas são versões melhoradas daquele falado em aula (eles envolvem, por exemplo, técnicas "espertas" para escolha de operações elementares, e os chamados pré-condicionadores).  
Você pode consultar a implementação em Fortran da MA57 de um grande grupo de pesquisa do Reino Unido [neste link](http://www.hsl.rl.ac.uk/catalogue/ma57.html) (sim, Fortran ainda é usado fortemente em computação de alto desempenho!). A descrição do pacote diz que ele implementa uma variante do método da eliminação de Gauss. A última versão deste pacote é de 2016, e baseia-se em um artigo científico de 1983 (1983 parece antigo, mas quando comparado à ideia de escalonamento, "é ontem"). E tenha certeza que artigos científicos foram submetidos em 2020 usando esta rotina!!! Ou seja, a ideia de escalonar uma matriz está presente na pesquisa de ponta até hoje.

### Determinantes

- [NOTAS E AULA](https://leonardosecchin.github.io/files/alglin/notas-3.pdf)
- [**LISTA DE EXERCÍCIOS 3**](https://drive.google.com/file/d/15EN6E5JOGy6ypXprWS6SRMKHZNg4nW8D/view)  
Nota: veja a observação sobre a Regra de Cramer após o exercício 9 da Lista 3.
- [EXERCÍCIOS EXTRAS - Exercícios livro-texto (Boldrini) - Capítulo 3](https://drive.google.com/file/d/1FUeuMRqESIm02YMIZ0RQeOCTX8nXXxfK/view)
- **ATIVIDADES PARA NOTA:** somente no AVA-UFES


### Espaços Vetoriais

- [VÍDEO-AULA (Prof. Possani, USP): Vetores no R3 (revisão de geometria analítica)](https://www.youtube.com/watch?v=-JcQJFNVjaA&list=PLIEzh1OveCVczEZAjhVIVd7Qs-X8ILgnI&index=1)
- [VÍDEO-AULA (Prof. Possani, USP): Independência / Dependência linear](https://www.youtube.com/watch?v=A7hwTnMmW_s&list=PLIEzh1OveCVczEZAjhVIVd7Qs-X8ILgnI&index=2)
- [VÍDEO-AULA (Prof. Possani, USP): Base, dimensão e revisão de sistemas lineares](https://www.youtube.com/watch?v=iaMTWxAS8FA&list=PLIEzh1OveCVczEZAjhVIVd7Qs-X8ILgnI&index=3)
- [Exercícios livro-texto (Boldrini) - Capítulo 4](https://drive.google.com/file/d/1ETwG3qjFQTNNJ5N0p1Uq0XZIbe8_yYFg/view)
- **LISTA DE EXERCÍCIOS 4**
- **ATIVIDADES PARA NOTA:** somente no AVA-UFES


### Transformações lineares

- [Exercícios livro-texto (Boldrini) - Capítulo 5](https://drive.google.com/file/d/1wakryLEheaBS1h_perJST0ecrSPZbx05/view)
- **Conteúdo extra** Vídeos básicos (nível ensino médio) do IMPA/Obmep.  
[A geometria das transformações lineares](https://portaldaobmep.impa.br/index.php/modulo/ver?modulo=203)  
[Operando com transformações lineares](https://portaldaobmep.impa.br/index.php/modulo/ver?modulo=204)
- **LISTA DE EXERCÍCIOS 5**
- **ATIVIDADES PARA NOTA:** somente no AVA-UFES


### Autovalores e autovetores

- [Exercícios livro-texto (Boldrini) - Capítulo 6](https://drive.google.com/file/d/1GfC_zBqSAcCxtxpQNCFz7NbQwdxV3ue-/view)
- **LISTA DE EXERCÍCIOS 6**
- **ATIVIDADES PARA NOTA:** somente no AVA-UFES


### Diagonalização

- [Exercícios livro-texto (Boldrini) - Capítulo 7](https://drive.google.com/file/d/1zTEbIHY4WxS7gvz0QHn8RSUxxny3z1I0/view)
- **LISTA DE EXERCÍCIOS 7**
- **ATIVIDADES PARA NOTA:** somente no AVA-UFES


### Produto interno

- [Exercícios livro-texto (Boldrini) - Capítulo 8](https://drive.google.com/file/d/1yUE7kXYI2QUOs-mfWa5-nO7FXWcdT78g/view)
- **LISTA DE EXERCÍCIOS 8**
- **ATIVIDADES PARA NOTA:** somente no AVA-UFES


<!--## Horários

*   -----

## [Ementa e programa](http://www.matematicaaplicada.saomateus.ufes.br/programas-de-disciplinas-do-dma)

## Texto de referência

*   Boldrini e outros. Álgebra Linear. Editora Harbra.

## Textos Complementares

*   Lay. Álgebra Linear e suas aplicações. LTC.
*   Anton, Rorres. Álgebra Linear com aplicações. 10a edição, Bookman.
*   Steinbruch, Winterle. Álgebra Linear. Pearson.

## Listas de exercícios

*   Lista 1 – Matrizes
*   Lista 2 – Operações elementares, sistemas lineares
*   Lista 3 – Determinantes
*   Lista 4 – Espaços Vetoriais
*   Lista 5 – Transformações
*   Lista 6 – Matrizes de transformações
*   Lista 7 – Autovalores, autovetores, diagonalização
*   Lista 8 – Produto interno, ortogonalização

## ===== Atividades durante o período de suspensão de aulas presenciais =====

Devido à suspensão das aulas presenciais em toda a UFES como forma de prevenção ao corona vírus ([veja comunicado](http://www.ufes.br/conteudo/ufes-suspende-atividades-presenciais-partir-desta-terca-feira-17)), as seguintes tarefas a serem realizadas em casa são sugeridas:

1.  Estudar o capítulo 2 do livro texto (Boldrini e outros. Álgebra Linear. Editora Harbra)
2.  Fazer a [Lista 2 de exercícios](https://drive.google.com/open?id=1HtjXnUbHqvY7UBEb_768obkszc0tN1JT). Nesta lista, há indicação de exercícios do livro texto. Outros exercícios dependem do conceito de “matrizes elementares”, e também de um “processo de inversão de matrizes”. **Estes conteúdos fazem parte da 1a prova**, e encontram-se nas seções 3.8 e 3.9 do livro texto.

Ressalto que é muito importante a realização das tarefas. A propósito, só com estudo você aprenderá e terá sucesso na disciplina, independentemente da situação atual. Eu retomarei esses conteúdos em sala de aula, adequando-os ao calendário.

A qualquer dúvida durante os estudos, podem me enviar um email – secchinleo@gmail.com

## AVALIAÇÕES

*   **1a prova**
    *   Conteúdo: Matrizes, matrizes elementares, sistemas lineares
    *   Data: 31 de março (terça-feira) – A SER REMARCADA POR CONTA DA SUSPENSÃO DAS AULAS
*   **2a prova**
    *   Conteúdo: ———–
    *   Data: ———–
*   **3a prova**
    *   Conteúdo: ———–
    *   Data: ———–
*   **4a prova (?)**
    *   Conteúdo: ———–
    *   Data: 09 de julho (terça-feira)
*   **Prova final**
    *   Conteúdo: toda a matéria
    *   Data: ———–
*   *** RESULTADO PARCIAL ***

## Aplicações da Álgebra Linear

Álgebra Linear aplica-se à uma infinidade de situações!!! Veja abaixo referências com algumas delas.

*   Seções 1.8, 1.9, 4.12, 5.4, 7.4, 9.6 e todo o capítulo 10 do livro “Álgebra Linear com aplicações” (10a edição) de Anton e Rorres. Disponível [neste link](http://www.professores.uff.br/jcolombo/wp-content/uploads/sites/124/2018/08/Algebra_Linear_com_Aplica_10_-Edi_Anton_Rorres.pdf)
*   Seções 1.9, 2.7, 2.8, 4.8, 4.9, 5.6, 5.7, 6.5, 6.6, 6.8, 7.5 do livro “Álgebra Linear e suas aplicações” de David Lay
*   … e no google é fácil de encontrar inúmeras aplicações!!!

## Vídeo-aulas de outras instituições

*   [**Curso de Álgebra Linear I da USP**](https://www.youtube.com/watch?v=-JcQJFNVjaA&list=PLIEzh1OveCVczEZAjhVIVd7Qs-X8ILgnI)
*   [Curso de Álgebra Linear UNIVESP](https://www.youtube.com/watch?v=WsLmdMPU3Rc&list=PLxI8Can9yAHdUtWDKtTA9AmuICNyX9EIr)-->
