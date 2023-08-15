###################################################
# Exemplo de uso do CPLEX/GLPK no Julia
#
# * CPLEX requer instalação e licença separada.
#   O pacote CPLEX.jl é apenas uma interface.
#
# * Ao instalar GLPK.jl no Julia, GLPK será
#   automaticamente instalado.
#
# Autor: Leonardo D. Secchin
# Data : 15/08/2023
# leonardosecchin.github.io/po2/
###################################################

using JuMP

# JuMP é um pacote para escrever modelos de otimização.
# Você pode associar diferentes solvers ao modelo.
# Para usar a interface com o CPLEX, você precisa instalá-lo
# em sua máquina, com uma licença válida. Caso não consiga,
# uma opção gratuita é o GLPK (https://www.gnu.org/software/glpk).
# Descomente as linhas adequadas para o solver que irá utilizar.

using CPLEX
# using GLPK

# INSTÂNCIA UFL DA LISTA DE EXERCÍCIOS, TÓPICO "RELAXAÇÃO LAGRANGIANA"
m = 6
n = 5

f = [2;4;5;3;3]

c = [6  2  1  3  5;
	4  10  2  6  1;
	3  2  4  1  3;
	2  0  4  1  4;
	1  8  6  2  5;
	3  2  4  8  1]


# estrutura JuMP associada com CPLEX
UFL = Model(CPLEX.Optimizer)

# estrutura JuMP associada com GLPK
# UFL = Model(GLPK.Optimizer)

#set_silent(UFL)  # desliga saída solver na tela

# insere variáveis
@variable(UFL, x[1:m,1:n] >= 0)
@variable(UFL, y[1:n], Bin)

# função objetivo
@objective(UFL, Min, sum(c[i,j]*x[i,j] for i in 1:m, j in 1:n) + sum(f[j]*y[j] for j in 1:n))

# restrições
for i in 1:m
    @constraint(UFL, sum(x[i,j] for j in 1:n) == 1)
end

for i in 1:m, j in 1:n
    @constraint(UFL, x[i,j] <= y[j])
end

# Resolve UFL
optimize!(UFL)

# FO ótima UFL
print("UFL Resolvido! FO ótima UFL: ")
println(objective_value(UFL))
