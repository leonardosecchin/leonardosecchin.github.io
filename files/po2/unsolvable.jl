# Exemplo (1) de
# JEROSLOW. Trivial integer programs unsolvable by branch-and-bound. Mathematical Programming, 6:105-109, 1974
#
# max x[1]  s.a.  2 sum x[i] = n,  x[i] binário

using CPLEX, JuMP, Printf, LinearAlgebra, Printf

# para n ímpar não há solução
n = 51

# inicializa modelo no CPLEX
P = direct_model(CPLEX.Optimizer())

# Para a lista de parâmetros, consulte
# https://www.ibm.com/docs/pt/icos/22.1.0?topic=cplex-list-parameters
# (ordem alfabética) ou
# https://www.ibm.com/docs/pt/icos/22.1.0?topic=cplex-topical-list-parameters
# (organizados por categoria)
#
# Significado das saídas em tela:
# https://www.ibm.com/docs/en/icos/22.1.1?topic=mip-progress-reports-interpreting-node-log

####### DESLIGA HEURÍSTICAS PARA OBTENÇÃO DE PONTOS VIÁVEIS #######

set_optimizer_attribute(P, "CPXPARAM_MIP_Strategy_HeuristicEffort", 0)
set_optimizer_attribute(P, "CPXPARAM_MIP_Strategy_HeuristicFreq", -1)
set_optimizer_attribute(P, "CPXPARAM_MIP_Strategy_LBHeur", CPX_OFF)


####### SAÍDAS NA TELA #######

# imprimir saídas na tela
set_optimizer_attribute(P, "CPXPARAM_ScreenOutput", 1)

# imprimir dados dos nós (somente para n pequeno)
if n <= 5
    set_optimizer_attribute(P, "CPXPARAM_MIP_Interval", 1)  # a cada 1 nó = "todo nó"
elseif n <= 15
    set_optimizer_attribute(P, "CPXPARAM_MIP_Interval", n^2)  # a cada n^2 nós
end

# não imprimir lista de parâmetros modificados pelo usuário
set_optimizer_attribute(P, "CPXPARAM_ParamDisplay", CPX_OFF)


####### DESLIGA PRESOLVE #######

set_optimizer_attribute(P, "CPXPARAM_Preprocessing_Presolve", 0)
set_optimizer_attribute(P, "CPXPARAM_MIP_Strategy_PresolveNode", -1)


####### DESLIGA GERAÇÃO DE CORTES PARA MIP #######

set_optimizer_attribute(P, "CPXPARAM_MIP_Cuts_Gomory", -1)        # Wolsey, seções 8.6, 8.7.3,  https://www.ibm.com/docs/pt/icos/22.1.0?topic=cuts-gomory-fractional
set_optimizer_attribute(P, "CPXPARAM_MIP_Cuts_Covers", -1)        # Wolsey, seção 9.3.1,  https://www.ibm.com/docs/pt/icos/22.1.0?topic=cuts-cover
set_optimizer_attribute(P, "CPXPARAM_MIP_Cuts_GUBCovers", -1)     # https://www.ibm.com/docs/pt/icos/22.1.0?topic=cuts-generalized-upper-bound-gub-cover
set_optimizer_attribute(P, "CPXPARAM_MIP_Cuts_Disjunctive", -1)   # Wolsey, seção 8.8,  https://www.ibm.com/docs/pt/icos/22.1.0?topic=cuts-disjunctive
set_optimizer_attribute(P, "CPXPARAM_MIP_Cuts_FlowCovers", -1)    # Wolsey, seção 9.4.1,  https://www.ibm.com/docs/pt/icos/22.1.0?topic=cuts-flow-cover
set_optimizer_attribute(P, "CPXPARAM_MIP_Cuts_Cliques", -1)       # https://www.ibm.com/docs/pt/icos/22.1.0?topic=cuts-clique
set_optimizer_attribute(P, "CPXPARAM_MIP_Cuts_PathCut", -1)       # https://www.ibm.com/docs/pt/icos/22.1.0?topic=cuts-flow-path
set_optimizer_attribute(P, "CPXPARAM_MIP_Cuts_LiftProj", -1)      # Wolsey, seção 8.8
set_optimizer_attribute(P, "CPXPARAM_MIP_Cuts_LocalImplied", -1)  # https://www.ibm.com/docs/pt/icos/22.1.0?topic=cuts-implied-bound-global-local
set_optimizer_attribute(P, "CPXPARAM_MIP_Cuts_Implied", -1)       # https://www.ibm.com/docs/pt/icos/22.1.0?topic=cuts-implied-bound-global-local
set_optimizer_attribute(P, "CPXPARAM_MIP_Cuts_MCFCut", -1)        # https://www.ibm.com/docs/pt/icos/22.1.0?topic=cuts-multi-commodity-flow-mcf
set_optimizer_attribute(P, "CPXPARAM_MIP_Cuts_MIRCut", -1)        # Wolsey, seção 8.7.2
set_optimizer_attribute(P, "CPXPARAM_MIP_Cuts_ZeroHalfCut", -1)   # https://www.ibm.com/docs/pt/icos/22.1.0?topic=cuts-zero-half


####### CONTROLA MODO DE EXPLORAÇÃO DA ÁRVORE DE ENUMERAÇÃO #######

set_optimizer_attribute(P, "CPXPARAM_MIP_Strategy_Search", CPX_MIPSEARCH_TRADITIONAL)   # => impressão de dados da ramificação
# set_optimizer_attribute(P, "CPXPARAM_MIP_Strategy_Branch", CPX_BRDIR_DOWN)


####### CONSTRÓI E RESOLVE MODELO #######

@variable(P, x[1:n], Bin)

@objective(P, Max, x[1])

@constraint(P, sum(2*x[i] for i=1:n) == n)

optimize!(P)

#########################################


println()
println("=====================================")

print("Status: ")
println(termination_status(P))

println()

print("Limitante inferior para o valor ótimo: ")
println(objective_bound(P))

println()

print("Limitante inferior para #nós dado por JEROSLOW: ")
println(2^ceil(n/2))

println()

print("Número de nós enumerados: ")
println(CPLEX.CPXgetnodecnt(P.moi_backend.env, P.moi_backend.lp))
