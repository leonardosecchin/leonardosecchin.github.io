###############################
# Exemplo das ligas metálicas
#
# Para executá-lo, abra um terminal na pasta em
# que salvou este arquivo, abra o Julia executando
# 'julia' e, já dentro do Julia, execute
#       include("ligas.jl")
###############################

# insere pacotes necessários
using JuMP, GLPK

# cria o modelo vazio P
P = Model(GLPK.Optimizer)

# (opcional) imprimir as saídas do resolvedor na tela
set_optimizer_attribute(P, "msg_lev", GLPK.GLP_MSG_ALL)

# insere as variáveis x[1], x[2] não negativas no modelo P
@variable(P, x[1:2] >= 0)

# função objetivo (receita bruta)
@objective(P, Max, 3000*x[1] + 5000*x[2])

# disponibilidade de cobre
@constraint(P, 0.5*x[1] + 0.2*x[2] <= 16)

# disponibilidade de zinco
@constraint(P, 0.25*x[1] + 0.3*x[2] <= 11)

# disponibilidade de chumbo
@constraint(P, 0.25*x[1] + 0.5*x[2] <= 15)

# resolve P !!!
optimize!(P)

# imprime a solução
println()

println("Quantidade de liga de baixa resistência: ", value(x[1]))
println("Quantidade de liga de alta resistência: ", value(x[2]))

println("Receita bruta: ", objective_value(P))
