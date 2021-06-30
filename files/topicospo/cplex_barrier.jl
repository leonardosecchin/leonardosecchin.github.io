###################################################
# EXEMPLO - resolver PL com a interface CPLEX do Julia
# * Requer CPLEX instalado e CPLEX.jl configurado no Julia
#
# Autor: Leonardo D. Secchin
# Data : 28/06/2021
# leonardosecchin.github.io/topicospo/
###################################################

using CPLEX, JuMP

function cplex_barrier(A, b, c; lb=[], ub=[], eps=1e-8)

    # Lê dimensões
    m,n = size(A)

    # Verifica se as dimensões dos dados são compatíveis
    if (length(b) != m) | (length(c) != n) | (m > n)
        error("Dados com dimensões incompatíveis!")
    end

    # limitantes padrão das variáveis, caso não fornecidos
    if isempty(lb)
        lb = zeros(n,1)
    end
    if isempty(ub)
        ub = 1.0e308 * ones(n,1)
    end

    # estrutura JuMP associada com CPLEX
    P = Model(CPLEX.Optimizer)

    ### configura CPLEX (ver https://www.ibm.com/docs/en/icos/20.1.0?topic=cplex-list-parameters)
    ### os parâmetros são da interface C

    # desliga parte do presolve
    set_optimizer_attribute(P, "CPXPARAM_Preprocessing_Presolve", CPX_OFF)
    set_optimizer_attribute(P, "CPX_PARAM_DEPIND", 0)

    # saídas na tela
    set_optimizer_attribute(P, "CPXPARAM_ScreenOutput", 1)

    # escolhe o algoritmo de barreiras (pontos interiores) do CPLEX
    set_optimizer_attribute(P, "CPXPARAM_LPMethod", CPX_ALG_BARRIER)

    # desliga crossover para Simplex (não purifica a solução para uma solução básica)
    set_optimizer_attribute(P, "CPXPARAM_SolutionType", CPX_NONBASIC_SOLN)

    # eps para convergência (o padrão já é 1e-8)
    set_optimizer_attribute(P, "CPXPARAM_Barrier_ConvergeTol", eps)

    # adiciona variáveis
    @variable(P, x[1:n])

    # define limitantes das variáveis
    for j in 1:n
        set_lower_bound(x[j], lb[j])
        set_upper_bound(x[j], ub[j])
    end

    # adiciona função objetivo
    @objective(P, Min, sum(c[j]*x[j] for j in 1:n))

    # adiciona restrições
    for i in 1:m
        @constraint(P, sum(A[i,j]*x[j] for j in 1:n) == b[i])
    end

    # resolve P
    optimize!(P)

    # retorna solução
    # como capturar número de iterações?
    return getvalue.(x),getobjectivevalue(P),0,((termination_status(P)) == 1 ? 0 : 1)
end
