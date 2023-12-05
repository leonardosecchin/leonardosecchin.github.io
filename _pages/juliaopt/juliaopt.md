---
layout: archive
title: "Julia para Otimização"
permalink: /juliaopt/
author_profile: true
---

Nesta página você encontrará exemplos/exercícios simples para iniciar a escrita e resolução de modelos de otimização em Julia. Não é um tutorial completo. Evidentemente, há muito material na internet que você pode acessar; um deles é o [curso de Abel Siqueira no Youtube](https://www.youtube.com/playlist?list=PLOOY0eChA1uyk_01nGJVmcQGvcJq9h6_6).


# Pré-requisitos

- Antes estudar os exemplos, leia atentamente o [tutorial de instalação](/julia/) do Julia. **Sugiro familiarizar-se com as dicas descritas na seção "Dicas" deste link.**

Principais pacotes utilizados nos exemplos:
- Escrita dos modelos de otimização: `JuMP`. Documentação completa [aqui](https://jump.dev/JuMP.jl/stable/)
- Modelos de otimização com derivadas automáticas: `NLPModels`, `NLPModelsJuMP`. Como avaliar funções e suas derivadas, veja [este link](https://github.com/JuliaSmoothOptimizers/NLPModels.jl)
- Rotinas de álgebra linear: `LinearAlgebra`
- Impressão na tela/arquivo estilo C: `Printf`
- Plotagem de gráficos: `Plots`

Outros pacotes são apresentados nos exemplos.

# Exemplos

- [Exemplo 1](/juliaopt_ex1/): escrevendo um modelo simples de otimização irrestrita
- [Exemplo 2](/juliaopt_ex2/): escrevendo um modelo de otimização a partir de variáveis do ambiente
- [Exemplo 3](/juliaopt_ex3/): carregando e executando códigos salvos em arquivos
- [Exemplo 4](/juliaopt_ex4/): um método simples de gradiente
- [Exemplo 5](/juliaopt_ex5/): construindo gráficos
- [Exemplo 6](/juliaopt_ex6/): escrevendo um modelo de otimização com restrições
- [Exemplo 7](/juliaopt_ex7/): resolvendo modelos de otimização restrita e irrestrita por métodos disponíveis
- [Exemplo 8](/juliaopt_ex8/): acessando bibliotecas de problemas-teste usadas na literatura
- [Exemplo 9](/juliaopt_ex9/): gravando arquivos de texto; tabelando resultados
- [Exemplo 10](/juliaopt_ex10/): executando códigos fora do ambiente Julia
- [Exemplo 11](/juliaopt_ex11/): salvando objetos em arquivos
- [Exemplo 12](/juliaopt_ex12/): tabelando resultados de forma inteligente com *DataFrames*
- [Exemplo 13](/juliaopt_ex13/): tratando erros de execução
- [Exemplo 14](/juliaopt_ex14/): calculando tempos de execução


# Bancos de problemas-teste

- Você encontra alguns bancos de problemas-teste para otimização contínua, otimização combinatória, programação linear inteira mista e outros [neste link](/juliaopt_problems/).


# [Pacotes para fins específicos (avançado)](/juliaopt_extrapkg/)


# Leituras interessantes

- **Computação com precisão finita.** Notas de aula do curso de [Cálculo Numérico de Paulo J. S. Silva (Unicamp)](https://www.ime.unicamp.br/~pjssilva/blog/notas_ms211/). Acesse o [PDF direto neste link](https://www.ime.unicamp.br/~pjssilva/pdfs/notas_de_aula/ms211/Computa%C3%A7%C3%A3o_com_Precis%C3%A3o_Finita.pdf) ou o [caderno Julia](https://github.com/pjssilva/ms211/blob/master/01_Computacao_com_Precisao_Finita.ipynb).