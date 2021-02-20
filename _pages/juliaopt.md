---
layout: archive
title: "Julia para Otimização"
permalink: /juliaopt/
author_profile: true
---

Nesta página você encontrará exercícios simples para iniciar a escrita e resolução de problemas de otimização em Julia. Não é um tutorial completo sobre, e poderá ser expandido ao longo do curso. Evidentemente, há muito material na internet que você pode acessar. Um deles é o [curso de Abel Siqueira (UFPR) no Youtube](https://www.youtube.com/playlist?list=PLOOY0eChA1uyk_01nGJVmcQGvcJq9h6_6).


# Pré-requisitos

- Antes de fazer os exercícios, leia atentamente o [tutorial de instalação](/julia/) do Julia. **Sugiro se familiarizar com as dicas descritas na seção "Dicas" deste link.**

Pacotes utilizados nos exercícios (alguns necessitam de instalação):
- Escrita dos modelos de otimização: `JuMP`. Documentação completa [aqui](https://jump.dev/JuMP.jl/stable/)
- Modelos de otimização com derivadas automáticas: `NLPModels`, `NLPModelsJuMP`. Como avaliar funções e suas derivadas, veja [este link](https://github.com/JuliaSmoothOptimizers/NLPModels.jl)
- Rotinas de álgebra linear: `LinearAlgebra`
- Armazenamento de matrizes esparsas: `SparseArrays`
- Comando de impressão na tela estilo C: `Printf`
- Plotagem de gráficos: `Plots`


# Exercícios

- [Exercício 1](/juliaopt_ex1): escrevendo um modelo simples de otimização irrestrita.
- [Exercício 2](/juliaopt_ex2): escrevendo um modelo de otimização a partir de variáveis do ambiente.
- [Exercício 3](/juliaopt_ex3): carregando e executando códigos salvos em arquivos.
- [Exercício 4](/juliaopt_ex4): um método simples de gradiente.
- [Exercício 5](/juliaopt_ex5): construindo gráficos.
- [Exercício 6](/juliaopt_ex6): escrevendo um modelo de otimização com restrições.
- [Exercício 7](/juliaopt_ex7): resolvendo modelos de otimização restrita e irrestrita por métodos disponíveis.
- [Exercício 8](/juliaopt_ex8): acessando bibliotecas de problemas-teste usadas na literatura.
- [Exercício 9](/juliaopt_ex9): gravando arquivos de texto; tabelando resultados.
