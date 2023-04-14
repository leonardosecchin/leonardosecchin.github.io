###################################################
# FUNÇÕES E HEURÍSTICAS VARIADAS PARA O TSP
#
# Autor: Leonardo D. Secchin
# Data : 02/04/2023
# leonardosecchin.github.io/metaheuristicas/
#
# 'tsp' é a estrutura de uma instância da TSPLIB,
# definida a partir do pacote 'TSPLIB'
###################################################

using TSPLIB
using Random

# usa randomizador MersenneTwister
rng = MersenneTwister()

include("tspplot.jl")

# Custo da solução sol
function tspdist(tsp, sol)
    n = tsp.dimension

    dist = 0

    for i = 1:(n-1)
        dist += tsp.weights[sol[i], sol[i+1]]
    end
    dist += tsp.weights[sol[1], sol[n]]

    return dist
end

# Aplica swap e grava em sol
function swap!(sol, i, j)
    # inverte as posições i e j em sol
    aux = sol[i]
    sol[i] = sol[j]
    sol[j] = aux
end

# Aplica reversão e grava em sol
function reversao!(sol, i, j)
    if i < j
        # inverte a ordem do trecho sol[i+1] a sol[j] (caso i < j)
        sol[i:j] .= sol[j:-1:i]
    else
        # caso i > j
        sol[j:i] .= sol[i:-1:j]
    end
end

# Aplica inserção e grava em sol
function insercao!(sol, i, j)
    # insere a primeira cidade após a segunda na permutação
    if i < j
        sol = [ sol[1:(i-1)] ; sol[(i+1):j]; i; sol[(j+1):end] ]
    else
        sol = [ sol[1:j] ; i; sol[(j+1):(i-1)]; sol[(i+1):end] ]
    end
end

# Seleção por roleta
# Exemplo de uso:
#   indice = roleta([0.05;0.8;0.15])
# indice = índice da ação/cidade escolhida
function roleta(p)
    # p = probabilidades de escolha de cada ação/cidade
    # c = probabilidade acumulada (c[end] = 1.0)
    c = cumsum(p)

    r = rand(rng)

    # retorna o primeiro índice para o qual r<=c
    return findfirst(r .<= c)
end


# HEURÍSTICA VIZINHO MAIS PRÓXIMO (Nearest Neighborhood - NN)
# Uso:
#   sol = NN(tsp)
#
function NN(tsp)
    n = tsp.dimension

    # armazena vetor solução
    sol = zeros(Int, n)

    # lista das cidades visitadas
    visitada = falses(n)

    # sorteia a cidade inicial
    sol[1] = rand(rng, 1:n)
    visitada[sol[1]] = true

    # cidades 2, 3, ..., n
    for i = 2:n
        # captura os custos partindo da cidade sol[i-1]
        custos = tsp.weights[:,sol[i-1]]

        # custo = Inf para cidades já visitadas
        custos[visitada] .= Inf

        # captura a cidade mais próxima de sol[i] ainda não visitada
        # em caso de empate, argmin retorna o primeiro índice
        prox = argmin(custos)

        # adiciona cidade à solução
        sol[i] = prox

        visitada[prox] = true
    end

    # retorna solução
    return sol
end
