---
layout: archive
title: "Introdução à Matemática Industrial"
permalink: /matind/
author_profile: true
---

>## Sumário
>1. [Discussões iniciais (papel do matemática, divulgação científica etc)](#inicio)
>1. [Sistemas presa-predador](#presa-predador)
>1. [Simulação de eventos discretos](#eventos-discretos)
>1. [PALESTRA: Introdução à epidemiologia matemática](#apres1)
>1. [Programação Linear/Inteira](#pli)
>1. [PALESTRA: Gerenciamento de estoque em uma empresa do ramo alimentício](#apres2)
>1. [PALESTRA: Modelagem matemática da dinâmica populacional do mexilhão dourado](#apres3)
>1. [Matemática no aprendizado de máquina supervisionado](#ml)
>1. [PALESTRA: Redes neurais profundas: aplicação na detecção de câncer por imagem](#apres4)
>1. [PALESTRA: Análise de riscos competitivos da sobrevivência específica de pacientes diagnosticados com câncer de próstata no Espírito Santo: estudo de coorte retrospectivo](#apres5)
>1. [Discussão aplicações da matemática - contribuições dos alunos](#contrib)

<span style="font-size:8pt; line-height:8pt">
1. [Discussões iniciais (papel do matemática, divulgação científica etc)](#inicio)
1. [Sistemas presa-predador](#presa-predador)
1. [Simulação de eventos discretos](#eventos-discretos)
1. [PALESTRA: Introdução à epidemiologia matemática](#apres1)
1. [Programação Linear/Inteira](#pli)
1. [PALESTRA: Gerenciamento de estoque em uma empresa do ramo alimentício](#apres2)
1. [PALESTRA: Modelagem matemática da dinâmica populacional do mexilhão dourado](#apres3)
1. [Matemática no aprendizado de máquina supervisionado](#ml)
1. [PALESTRA: Redes neurais profundas: aplicação na detecção de câncer por imagem](#apres4)
1. [PALESTRA: Análise de riscos competitivos da sobrevivência específica de pacientes diagnosticados com câncer de próstata no Espírito Santo: estudo de coorte retrospectivo](#apres5)
1. [Discussão aplicações da matemática - contribuições dos alunos](#contrib)
</span>

***

## Horários das aulas

- Segundas-feiras de 13:00 as 15:00 (Sala 12 Eixo 1)
- Terças-feiras de 16:00 as 18:00 (Sala 08 Eixo 1)


<!-- ## [Ementa e programa (7o período)](https://matematicaaplicada.saomateus.ufes.br/sites/matematicaaplicada.saomateus.ufes.br/files/field/anexo/Matem%c3%a1tica%20Industrial%20-%20DMA12413.pdf) -->


## Objetivos da disciplina

- Motivar e promover a reflexão sobre a atuação do matemático na sociedade e na resolução de problemas reais
- Estudar textos científicos de variados temas e problemas no contexto industrial relacionados à conteúdos do curso
- Reproduzir, na medida do possível, casos de aplicação da matemática para a resolução de problemas variados
- Desenvolver atividades de extensão


<!-- ## Textos de apoio -->

<!-- - Artigos científicos a serem escolhidos pelo professor -->
<!-- - Friedman, A.; Littman, W. Industrial Mathematics - A course in Solving Real-World Problems, SIAM, 1994 -->
<!-- - Burkard, R. et al. Computational Mathematics Driven By Industrial Problems. Lectures Notes in Mathematics, Springer, 1999 -->
<!-- - Schmidt, A.; Narimanyan, A. Advanced Numerical Methods and Their Applications to Industrial Problems. Center for Industrial Mathematics University of Bremen, Bremen, Germany, 2004 -->


## Canais de acesso

- E-mail do professor: leonardo.secchin@ufes.br
- Sala do professor: prédio do Departamento de Matemática Aplicada, sala 08


## Formas de avaliação

- Nota parcial 1: participação nas aulas e discussões
- Nota parcial 2: relatório dos tópicos vistos em sala de aula, construído ao longo da disciplina
- Nota parcial 3: apresentação oral do relátorio

<!-- - **PROVA FINAL** -->
<!--   - **Prova escrita** -->
<!--   - Conteúdo: toda a matéria -->
<!--   - Valor: 10,0 pontos -->
<!--   - **Data: --** -->


## Critérios para aprovação

- Faltas acima de 25% da carga horária –> reprovado(a) por falta
- Média notas parciais >= 7,0 —> aprovado(a) (desde que não reprovado(a) por falta)
- Média notas parciais < 7,0 —> Avaliação final (desde que não reprovado(a) por falta). Neste caso, média final >= 5,0 —> aprovado(a)


## Tópicos abordados nas aulas


### <a name="inicio"></a>SEMANAS 1 e 2 (11/03/24 a 22/03/24): Discussões iniciais

- Discussão sobre como e onde se aplica a matemática e a atuação do "matemático aplicado"
- Exemplos de aplicações
  - [Dinâmica populacional](https://pt.wikipedia.org/wiki/Din%C3%A2mica_populacional)
    - Modelo predador-presa
    - Modelos de propagação do COVID-19
  - Simulação de fenômenos físicos
    - [Dinâmica de Fluidos (ou Mecânica do Fluidos)](https://impa.br/pesquisa/dinamica-dos-fluidos/)
  - Problemas de otimização e pesquisa operacional
    - [Roteamento (de veículos)](https://pt.wikipedia.org/wiki/Problema_de_roteamento_de_ve%C3%ADculos)
    - [Confecção de grade de horários escolares](https://anaisjornadaic.sappg.ufes.br/piic/rel_final_4479_relatorio.pdf)
    - Problemas de logística
    - etc...
- Uso do computador na resolução de problemas: será frequente durante o curso!
- [Algoritmos](https://pt.wikipedia.org/wiki/Algoritmo)
  - Um exemplo de algoritmo iterativo simples para minimizar funções
  - Discussão de testes simples no computador
  - O suporte teórico para o funcionamento de algoritmos: um dos papéis de um matemático aplicado
    - O matemático tem a capacidade de criar algoritmos...
    - também de mostrar ou pelo menos sugerir sob quais condições ele funciona...
    - para tanto, alia argumentos matemáticos com testes numéricos em computador!
- Hoje em dia, novas descobertas são feitas em matemática? SIM!!!
- Como se divulga a ciência produzida pela humanidade (em particular, em matemática)?
  - [Revistas científicas](https://ciencia.ufla.br/todos-livros/566-a-importancia-da-comunicacao-e-divulgacao-da-ciencia)
    - Revistas de **comunicação científica** (comunicação de alto nível técnico, direcionado à comunidade científica especializada)
      - Exemplo de revista da área de matemática aplicada: [Computational and Applied Mathematics](https://link.springer.com/journal/40314/volumes-and-issues)
      - Processo de validação de um trabalho científico por especialistas: [revisão por pares](https://www.springer.com/br/authors-editors/authorandreviewertutorials/submitting-to-a-journal-and-peer-review/peer-review-process/12011818#:~:text=A%20revis%C3%A3o%20por%20pares%20%C3%A9,oferecem%20aconselhamento%20gratuito%20aos%20autores.)
    - Exemplos de revistas de **divulgação científica** (linguajar acessível direcionado à sociedade em geral)
      - [Revista Universidade (UFES)](https://blog.ufes.br/revistauniversidade/)
      - [Revista FAPESP (instituições de SP)](https://revistapesquisa.fapesp.br/)
      - [Ciência Hoje](https://cienciahoje.org.br/)
      - [Iniciativas de divulgação científica promovidas pelo IMPA (Instituto de Matemática Pura e Aplicada)](https://impa.br/divulgacao/)
  - Eventos/Congressos científicos (direcionados à divulgação interna à comunidade científica). Veja exemplos no fim desta página


*Exemplos de aplicação motivados pela matéria "Saber matemática é cada dia mais importante para os médicos"*

- [PACKMOL](https://onlinelibrary.wiley.com/doi/10.1002/jcc.21224) - um *software* desenvolvido com parceria de matemáticos para configurações iniciais para simulações de dinâmica molecular
  - [Vídeo](https://www.youtube.com/watch?v=SINkp_3yvi0)
  - [Dinâmica molecular](https://pt.wikipedia.org/wiki/Din%C3%A2mica_molecular)
  - [Dinâmica molecular: teoria e aplicações em planejamento de fármacos](https://www.scielo.br/j/eq/a/FKXQP7hsfpP3Sgzw4GL7Vkg/)
- [O problema de alocação de salas em um corredor](https://doi.org/10.1016/j.cor.2012.04.016)
- [Artigo científico sobre detecção de câncer por imagem usando aprendizado de máquina, co-autoria com ex-aluno do curso de Matemática Industrial](https://doi.org/10.1016/j.eswa.2023.122418)
- [Exemplo de uso de simulação computacional na gestão hospitalar](https://www.aedb.br/seget/arquivos/artigos16/1424430.pdf)
- [Vídeo com similação computacional da circulação sanguínea através de um aneurisma](https://www.youtube.com/watch?v=eBp0H7qvYQA)


### <a name="presa-predador"></a>SEMANA 3 (25/03/24 a 29/03/24): Sistemas presa-predador

- [Equação de Lotka-Volterra](https://pt.wikipedia.org/wiki/Equa%C3%A7%C3%A3o_de_Lotka-Volterra)
- [Vídeo](https://www.youtube.com/watch?v=cHLCAXY-ZTw)
- [Modelagem de um sistema presa-predador simples](/files/matind/presa-predador.html)
- [Código da simulação feita em aula (notebook na linguagem Julia)](/files/matind/presa-predador.ipynb)


### <a name="eventos-discretos"></a>SEMANAS 4 e 5 (01/04/24 a 12/04/24): Simulação de eventos discretos

- [Introdução](https://pt.wikipedia.org/wiki/Simula%C3%A7%C3%A3o_de_eventos_discretos)
- Simulações com eventos aleatórios (Simulação Monte-Carlo)
  - [Texto 1](https://pt.wikipedia.org/wiki/M%C3%A9todo_de_Monte_Carlo)
  - [Texto 2](https://www.ibm.com/br-pt/topics/monte-carlo-simulation)
  - [Vídeo com exemplos](https://www.youtube.com/watch?v=4c68KAbdYdQ) do prof. [João F. de F. Almeida (UFMG)](http://lattes.cnpq.br/9513742728448307)
  - Sistemas de Filas (exemplos de aplicação): [ex 1](https://proceedings.science/sbpo/sbpo-2020/trabalhos/teoria-das-filas-e-simulacao-um-estudo-para-a-otimizacao-das-filas-de-um-superme?lang=pt-br) ; [ex 2](https://proceedings.science/sbpo/sbpo-2020/trabalhos/estudo-de-simulacao-em-um-contact-center-hospitalar-o-caso-de-um-hospital-oncolo?lang=pt-br) ; [ex 3](https://abepro.org.br/biblioteca/tn_stp_231_350_30416.pdf)
- Software de simulação [Arena](https://paragon.com.br/arena/)
  - Exemplo do cálculo aproximado de $\pi$; arquivo do [Arena](/files/matind/pi.doe)
  - Exemplo simples de simulação de uma fila: [arquivo Arena](/files/matind/fila.doe) ; [relatório simulação](/files/matind/fila_relatorio.pdf)
  - Exemplo de [simulação de uma praça de pedágio](/files/matind/apresArena.pdf)
    - arquivo do [Arena](/files/matind/praca_pedagio.doe)
    - [passo a passo da construção do modelo no Arena](/files/matind/pedagio_arena_passo-a-passo.pdf)


### <a name="apres1"></a>SEMANA 6: Apresentação 1 (15/04/24)

- **Introdução à epidemiologia matemática**  
  *Douglas Santos Lacerda (estudante Mat. Ind.)*

Material fornecido pelo palestrante:
1. [Slides da apresentação](/files/matind/slides_Douglas.pdf)
1. [Site com os dados do covid no ES](https://coronavirus.es.gov.br/painel-covid-19-es)
1. [Valores do R efetivo no Espírito Santo](https://covid19br.github.io/estados?aba=aba3&uf=ES&q=dia)
1. [Nota técnica - Análise da propagação da pandemia de COVID-19 no estado do Espírito Santo e na conurbação da Grande Vitória a partir de modelos matemáticos](https://ijsn.es.gov.br/publicacoes/nota-tecnica/nt-niee-01-2020-analise-da-propagacao-da-pandemia-de-covid-19-no-estado-do-espirito-santo-e-na-conurbacao-da-grande-vitoria-a-partir-de-modelos-matematicos#:~:text=Esta%20Nota%20T%C3%A9cnica%20foi%20elaborada,coronav%C3%ADrus%20(COVID%2D19).)


### <a name="pli"></a>SEMANAS 6 e 7 (16/04/24 a 26/04/24): Programação Linear/Inteira

- [Sobre problemas de otimização](https://pt.wikipedia.org/wiki/Otimiza%C3%A7%C3%A3o)
- Pequena apresentação da [programação linear/inteira](https://pt.wikipedia.org/wiki/Programa%C3%A7%C3%A3o_linear)
- Uma visão mais completa da programação linear: leia o capítulo 1 da [referência 1](/files/matind/livro_18_sbmac.pdf)
- Exemplos de aplicação
  - Planejamento da produção (seção 4.1 da [referência 1](/files/matind/livro_18_sbmac.pdf))
  - O problema da mochila (seção 5.1 da [referência 1](/files/matind/livro_18_sbmac.pdf))
  - O problema do caixeiro viajante (seção 5.2 da [referência 1](/files/matind/livro_18_sbmac.pdf))
    - [Resolvedor on-line](https://tspvis.com/) (escolher o algoritmo Branch-and-Bound)
  - O problema do caminho mínimo (seção 2.1 da [referência 2](/files/matind/livro_76_sbmac.pdf))
  - Localização de facilidades (seção 2.3 da [referência 2](/files/matind/livro_76_sbmac.pdf))
  - Problema de [corte de estoque](/files/topicospo/GER_COL_4-cutting-stock.pdf)
  - Mais exemplos nas referências 1, 2 e no capítulo 2 de [LUNA, E. P. L.; GOLDBARG, M. C. Otimização combinatória e programação linear - modelos e algoritmos. Ed. Elsevier, 2005.](https://web.ist.utl.pt/luis.tarrataca/classes/linear_programming/OtimizacaoCombinatoriaeProgramacaoLinear.pdf)
- Resolução numérica de modelos de programação linear inteira mista
  - [Códigos usados em aula](/files/matind/PLI.zip)

*Referências:*

1. [RANGEL, S. Introdução à Construção de Modelos de Otimização Linear e Inteira. Notas em Matemática Aplicada, v. 18. SBMAC, 2012](/files/matind/livro_18_sbmac.pdf)
1. [ARAUJO, S. A. de; RANGEL, S. Matemática Aplicada ao Planejamento da Produção e Logı́stica. Notas em Matemática Aplicada, v. 76. SBMAC, 2014](/files/matind/livro_76_sbmac.pdf)


### <a name="apres2"></a>SEMANA 8: Apresentação 2 (29/04/24)

- **Gerenciamento de estoque em uma empresa do ramo alimentício**  
  *Joao Pedro Gouvea de Camargo (estudante Mat. Ind.)*


### <a name="apres3"></a>SEMANA 9: Apresentação 3 (07/05/24)

- **Modelagem matemática da dinâmica populacional do mexilhão dourado**  
  *Carolina Martinelli (estudante Mat. Ind.)*


### SEMANA 10 (13/05/2024 a 17/05/2024)


### <a name="ml"></a>SEMANA 11 (20/05/2024 a 24/05/2024): Matemática no aprendizado de máquina supervisionado


### <a name="apres4"></a>SEMANA 11: Apresentação 4 (21/05/2024)

- **Redes neurais profundas: aplicação na detecção de câncer por imagem**  
  *Matheus Becali Rocha (ex-estudante Mat. Ind., mestrando Computação/UFES)*


### <a name="apres5"></a>SEMANA 12: Apresentação 5 (27/05/24)

- **Análise de riscos competitivos da sobrevivência específica de pacientes diagnosticados com câncer de próstata no Espírito Santo: estudo de coorte retrospectivo**  
  *Wesley Rocha Grippa (docente DMA/UFES)*


<!-- ### SEMANA 13 (03/06/2024 a 07/06/2024) -->


<!-- ### SEMANA 14 (10/06/2024 a 14/06/2024) -->


<!-- ### SEMANA 15 (17/06/2024 a 21/06/2024) -->


<!-- ### SEMANA 16 (24/06/2024 a 28/06/2024) -->


<!-- ### SEMANA 17 (01/07/2024 a 05/07/2024) -->


<!-- ### SEMANA 18 (08/07/2024 a 12/07/2024) -->


*No radar*

- Discussão aplicações da matemática - contribuições dos alunos
- Apresentação aluno Pedro Henrique Fischer (TCC) - Segunda-feira (a definir)
- Apresentação aluno Pedro Lucas (projeto IC)


## <a name="contrib"></a>Discussão aplicações da matemática - contribuições dos alunos
- (Caio) [Saber matemática é cada dia mais importante para os médicos](https://ensinoepesquisa.einstein.br/fiquepordentro/noticia/saber-matematica-e-cada-dia-mais-importante-para-os-medicos#:~:text=O%20aprendizado%20da%20interpreta%C3%A7%C3%A3o%20dos,os%20profissionais%20envolvidos%20em%20pesquisa.)
- (André) [A matemática na produção e análise de alimentos](https://matematicax.com.br/a-matematica-na-producao-e-analise-de-alimentos/)


## Sociedades e Institutos de Matemática Aplicada no mundo

- [Sociedade Brasileira de Matemática Aplicada e Computacional - SBMAC](https://www.sbmac.org.br/)
- [Society for Industrial and Applied Mathematic - SIAM](https://siam.org/)
- [Canadian Applied and Industrial Mathematics Society - CAIMS](https://caims.ca/)
- [Courant Institute of Mathematical Sciences](http://www.cims.nyu.edu/)
- [Massachusetts Institute of Technology - MIT](https://www.mit.edu/)
- [The International Council for Industrial and Applied Mathematics - ICIAM](https://iciam.org/)


## Eventos de Matemática Aplicada à Indústria

- [Congresso Nacional de Matemática Aplicada e Computacional (CNMAC)](https://www.cnmac.org.br/)
- [Workshop de Soluções Matemáticas para Problemas Industriais - CeMEAI/USP](https://cemeai.icmc.usp.br/WSMPI/)
- [Congressos da ICIAM](https://iciam.org/iciam-congresses)
- [Congressos da SIAM](https://www.siam.org/conferences/calendar)