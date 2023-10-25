###################################################
# USO DE PACOTES DE PONTOS INTERIORES PARA PL

# Autor: Leonardo D. Secchin
###################################################

# pacotes para manipulação matricial
using LinearAlgebra, SparseArrays

# pacotes impressão e gravação de resultados
using Printf

# pacote para download de matrizes de https://sparse.tamu.edu
using MatrixDepot

using CPLEX, JuMP, Tulip


####################################
# PONTOS INTERIORES DO CPLEX
####################################

function cplex(A, b, c; lb=[], ub=[], eps=1e-8, saidas=true, simplex=false, presolve=true)

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
        ub = Inf * ones(n,1)
    end

    # estrutura JuMP associada com CPLEX
    P = Model(CPLEX.Optimizer)

    ### configura CPLEX (ver https://www.ibm.com/docs/en/icos/20.1.0?topic=cplex-list-parameters)

    # desliga presolve
    if !presolve
        set_optimizer_attribute(P, "CPXPARAM_Preprocessing_Presolve", CPX_OFF)
        set_optimizer_attribute(P, "CPX_PARAM_DEPIND", 0)
    end

    # saídas na tela
    if !saidas
        set_optimizer_attribute(P, "CPXPARAM_ScreenOutput", 0)
    end

    if simplex
        # escolhe o simplex primal
        set_optimizer_attribute(P, "CPXPARAM_LPMethod", CPX_ALG_PRIMAL)
    else
        # escolhe o algoritmo de barreiras (pontos interiores) do CPLEX
        set_optimizer_attribute(P, "CPXPARAM_LPMethod", CPX_ALG_BARRIER)

        # desliga crossover para Simplex (não purifica a solução para uma solução básica)
        set_optimizer_attribute(P, "CPXPARAM_SolutionType", CPX_NONBASIC_SOLN)

        # eps para convergência (o padrão já é 1e-8)
        set_optimizer_attribute(P, "CPXPARAM_Barrier_ConvergeTol", eps)
    end

    # adiciona variáveis
    @variable(P, x[1:n])

    # define limitantes das variáveis
    for j in 1:n
        if lb[j] > -1e+308
            set_lower_bound(x[j], lb[j])
        end
        if ub[j] < 1e+308
            set_upper_bound(x[j], ub[j])
        end
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
    return value.(x),objective_value(P),max(simplex_iterations(P),barrier_iterations(P)),((termination_status(P)) == OPTIMAL ? 0 : 1)
end


####################################
# PONTOS INTERIORES DO TULIP
####################################

function tulip(A, b, c; lb=[], ub=[], saidas=true, presolve=true)

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
        ub = Inf * ones(n,1)
    end

    # estrutura JuMP associada com Tulip
    P = Model(Tulip.Optimizer)

    # desliga parte do presolve
    if !presolve
        set_optimizer_attribute(P, "Presolve_Level", 0)
    end
    set_optimizer_attribute(P, "Presolve_Level", 0)

    # saídas na tela
    if !saidas
        set_optimizer_attribute(P, "OutputLevel", 0)
    else
        set_optimizer_attribute(P, "OutputLevel", 1)
    end

    # adiciona variáveis
    @variable(P, x[1:n])

    # define limitantes das variáveis
    for j in 1:n
        if lb[j] > -1e+308
            set_lower_bound(x[j], lb[j])
        end
        if ub[j] < 1e+308
            set_upper_bound(x[j], ub[j])
        end
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
    return value.(x),objective_value(P),max(simplex_iterations(P),barrier_iterations(P)),((termination_status(P)) == OPTIMAL ? 0 : 1)
end


# Função para testes
function testar(; saidas=false, presolve=true)

    # Fonte dos arquivos: https://sparse.tamu.edu/LPnetlib
    problemas = [
        # PROBLEMAS VIÁVEIS DA NETLIB (TAMANHO PEQUENO A MODERADO)
        "LPnetlib/lp_25fv47",
        "LPnetlib/lp_80bau3b",
        "LPnetlib/lp_adlittle",
        "LPnetlib/lp_afiro",
        "LPnetlib/lp_agg",
        "LPnetlib/lp_agg2",
        "LPnetlib/lp_agg3",
        "LPnetlib/lp_bandm",
        "LPnetlib/lp_beaconfd",
        "LPnetlib/lp_blend",
        "LPnetlib/lp_bnl1",
        "LPnetlib/lp_bnl2",
        "LPnetlib/lp_bore3d",
        "LPnetlib/lp_brandy",
#         "LPnetlib/lp_capri",
        "LPnetlib/lp_cre_a",
        "LPnetlib/lp_cre_b",
        "LPnetlib/lp_cre_c",
        "LPnetlib/lp_cre_d",
        "LPnetlib/lp_cycle",
        "LPnetlib/lp_czprob",
        "LPnetlib/lp_d2q06c",
        "LPnetlib/lp_d6cube",
        "LPnetlib/lp_degen2",
        "LPnetlib/lp_degen3",
        "LPnetlib/lp_dfl001",
        "LPnetlib/lp_e226",
        "LPnetlib/lp_etamacro",
        "LPnetlib/lp_fffff800",
        "LPnetlib/lp_finnis",
        "LPnetlib/lp_fit1d",
        "LPnetlib/lp_fit1p",
        "LPnetlib/lp_fit2d",
        "LPnetlib/lp_fit2p",
        "LPnetlib/lp_ganges",
        "LPnetlib/lp_gfrd_pnc",
        "LPnetlib/lp_greenbea",
        "LPnetlib/lp_greenbeb",
        "LPnetlib/lp_grow15",
        "LPnetlib/lp_grow22",
        "LPnetlib/lp_grow7",
        "LPnetlib/lp_israel",
        "LPnetlib/lp_kb2",
        "LPnetlib/lp_ken_07",
        "LPnetlib/lp_ken_11",
        "LPnetlib/lp_ken_13",
        "LPnetlib/lp_ken_18",
        "LPnetlib/lp_lotfi",
        "LPnetlib/lp_maros",
        "LPnetlib/lp_maros_r7",
        "LPnetlib/lp_modszk1",
        "LPnetlib/lp_osa_07",
        "LPnetlib/lp_osa_14",
        "LPnetlib/lp_osa_30",
        "LPnetlib/lp_osa_60",
        "LPnetlib/lp_pds_02",
        "LPnetlib/lp_pds_06",
        "LPnetlib/lp_pds_10",
        "LPnetlib/lp_pds_20",
        "LPnetlib/lp_perold",
        "LPnetlib/lp_pilot",
        "LPnetlib/lp_pilot4",
        "LPnetlib/lp_pilot87",
        "LPnetlib/lp_pilot_ja",
        "LPnetlib/lp_pilot_we",
        "LPnetlib/lp_pilotnov",
        "LPnetlib/lp_qap12",
        "LPnetlib/lp_qap15",
        "LPnetlib/lp_qap8",
        "LPnetlib/lp_recipe",
        "LPnetlib/lp_sc105",
        "LPnetlib/lp_sc205",
        "LPnetlib/lp_sc50a",
        "LPnetlib/lp_sc50b",
        "LPnetlib/lp_scagr25",
        "LPnetlib/lp_scagr7",
        "LPnetlib/lp_scfxm1",
        "LPnetlib/lp_scfxm2",
        "LPnetlib/lp_scfxm3",
        "LPnetlib/lp_scorpion",
        "LPnetlib/lp_scrs8",
        "LPnetlib/lp_scsd1",
        "LPnetlib/lp_scsd6",
        "LPnetlib/lp_scsd8",
        "LPnetlib/lp_sctap1",
        "LPnetlib/lp_sctap2",
        "LPnetlib/lp_sctap3",
        "LPnetlib/lp_share1b",
        "LPnetlib/lp_share2b",
        "LPnetlib/lp_shell",
        "LPnetlib/lp_ship04l",
        "LPnetlib/lp_ship04s",
        "LPnetlib/lp_ship08l",
        "LPnetlib/lp_ship08s",
        "LPnetlib/lp_ship12l",
        "LPnetlib/lp_ship12s",
        "LPnetlib/lp_sierra",
        "LPnetlib/lp_stair",
        "LPnetlib/lp_standata",
        "LPnetlib/lp_standgub",
        "LPnetlib/lp_standmps",
        "LPnetlib/lp_stocfor1",
        "LPnetlib/lp_stocfor2",
        "LPnetlib/lp_stocfor3",
        "LPnetlib/lp_truss",
        "LPnetlib/lp_tuff",
        "LPnetlib/lp_vtp_base",
        "LPnetlib/lp_wood1p",
        "LPnetlib/lp_woodw",
        # PROBLEMAS INVIÁVEIS DA NETLIB (TAMANHO PEQUENO A MODERADO)
        "LPnetlib/lpi_bgdbg1",
        "LPnetlib/lpi_bgetam",
        "LPnetlib/lpi_bgindy",
        "LPnetlib/lpi_bgprtr",
        "LPnetlib/lpi_box1",
        "LPnetlib/lpi_ceria3d",
        "LPnetlib/lpi_chemcom",
        "LPnetlib/lpi_cplex1",
        "LPnetlib/lpi_cplex2",
        "LPnetlib/lpi_ex72a",
        "LPnetlib/lpi_ex73a",
        "LPnetlib/lpi_forest6",
        "LPnetlib/lpi_galenet",
        "LPnetlib/lpi_gosh",
        "LPnetlib/lpi_gran",
        "LPnetlib/lpi_greenbea",
        "LPnetlib/lpi_itest2",
        "LPnetlib/lpi_itest6",
        "LPnetlib/lpi_klein1",
        "LPnetlib/lpi_klein2",
        "LPnetlib/lpi_klein3",
        "LPnetlib/lpi_mondou2",
        "LPnetlib/lpi_pang",
        "LPnetlib/lpi_pilot4i",
        "LPnetlib/lpi_qual",
        "LPnetlib/lpi_reactor",
        "LPnetlib/lpi_refinery",
        "LPnetlib/lpi_vol1",
        "LPnetlib/lpi_woodinfe",
        # PROBLEMAS "GRANDES"
        "Mittelmann/cont1_l",
        "Mittelmann/cont11_l",
        "Mittelmann/stormG2_1000",
        "Mittelmann/neos3",
        "Mittelmann/neos",
        "Mittelmann/watson_2",
        "Meszaros/tp-6",
        "Meszaros/degme",
        "Meszaros/stat96v3",
    ];

    # cabeçalho tabela com resultados
    arq = open("resultados.txt", "a")
    write(arq, "Prob                            n        m   st       it          f     tempo  metodo\n"*
               "==============================================================================================\n")

    # executa pontos interiores em cada problema
    for p in problemas

        # lê problema (e baixa caso não tenha sido baixado)
        n, m, A, b, c, l, u = carregaPL(p)

        try
            println("Resolvendo problema "*p)


            # CPLEX simplex
            PLtempo = @elapsed ~, PLf, PLiter, PLstatus =
                cplex(A, b, c, lb=l, ub=u, saidas=saidas, simplex=true, presolve=presolve);

            write(arq, @sprintf("%24s %8d %8d %4d %8d  %9.2e  %4.6f  cplex (simplex)\n", p, n, m, PLstatus, PLiter, PLf, PLtempo))

            # CPLEX pontos interiores
            PLtempo = @elapsed ~, PLf, PLiter, PLstatus =
                cplex(A, b, c, lb=l, ub=u, saidas=saidas, simplex=false, presolve=presolve);

            write(arq, @sprintf("%24s %8d %8d %4d %8d  %9.2e  %4.6f  cplex (pto int)\n", p, n, m, PLstatus, PLiter, PLf, PLtempo))

            # Tulip pontos interiores
            PLtempo = @elapsed ~, PLf, PLiter, PLstatus =
                tulip(A, b, c, lb=l, ub=u, saidas=saidas, presolve=presolve);

            write(arq, @sprintf("%24s %8d %8d %4d %8d  %9.2e  %4.6f  tulip\n", p, n, m, PLstatus, PLiter, PLf, PLtempo))


            write(arq, "----------------------------------------------------------------------------------------------\n")

            flush(arq)

        catch
            println("ERRO ao resolver $(p)!")
        end

    end

    close(arq)
end

# Carrega dados de um PL
function carregaPL(nome)
    PL = mdopen(nome)

    return PL.n, PL.m, PL.A, PL.b, PL.c, PL.lo, PL.hi
end