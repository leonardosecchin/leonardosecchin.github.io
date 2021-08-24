###################################################
# MÉTODO DOS GRADIENTES CONJUGADOS - TRABALHO COMPUTACIONAL
# Veja
#   https://leonardosecchin.github.io/files/otim1/4.6.Gradientes_conjugados.pdf
#
# Data : 23/08/2021
#
# Para testar o método em problemas selecionados, execute
#   testar()
# Certifique-se que todos os pacotes utilizados estejam instalados.
###################################################

using Printf, LinearAlgebra, MatrixDepot, SparseArrays, DataFrames
# using JLD2


####################################################################
#                       GRADIENTE CONJUGADOS
# para minimização de quadráticas estritamente convexas:
#   q(x) = 1/2*x'*A*x + b'*x + c
# onde A é matriz simétrica e definida positiva.
#
# O método anula o gradiente de q, isto é, resolve o sistema
#   g = Ax + b = 0
#
# A função gc requer os dados A e b desse sistema
####################################################################

function gc(A,b; x0=nothing, eps=1.0e-6, maxit=10000, saidas=true, reinicia=false)

    # DADOS DE ENTRADA
    # A,b   : dados do problema
    # x0    : ponto inicial (opcional, padrão=origem)
    # eps   : precisão para convergencia (opcional, padrão=1.0e-6)
    # maxit : número máximo de iterações (opcional, padrão=10000)
    # saidas: mensagens na tela?

    # DADOS DE SAÍDA
    # x     : último iterando
    # gnorm : norma do infinito do gradiente da quadrática |Ax+b|
    # iter  : número de iterações
    # status: 0=sucesso, 1=falha

    iter   = 0
    status = 1

    # captura número de variáveis (dimensão de A)
    n = size(A)[1]

    # define ponto inicial caso não fornecido
    if x0 == nothing
        x0 = zeros(n)
    end

    x     = float(x0)
    g     = A*x + b
    gnorm = norm(g, Inf)

    # imprimi cabeçalho saídas
    if saidas
        @printf("\nit     \t|grad|\n=====================")
        @printf("\n%d\t%8.2e", iter, gnorm)
    end


    # direção inicial
    d = -g

    while gnorm > eps && iter < maxit

        ##########################
        # IMPLEMENTE A ITERAÇÃO DE GRADIENTES CONJUGADOS
        # CONFORME VISTO EM AULA
        ##########################

        # ................................



        # atualiza norma de g
        gnorm = norm(g,Inf)

        # incrementa contador de iterações
        iter += 1

        # imprimi informações da iteração corrente
        if saidas
            if mod(iter,20) == 0
                @printf("\n\nit     \tf         |grad|\n==========================")
            end
            @printf("\n%d\t%8.2e", iter, gnorm)
        end
    end


    # sucesso!
    if gnorm <= eps
        status = 0
    end

    # saída
    if saidas
        println("\n\n*******************************")
        if status == 0
            println("PROBLEMA RESOLVIDO COM SUCESSO!")
        else
            println("FALHA NA RESOLUÇÃO.")
        end
        println("*******************************\n")
    end

    return x, gnorm, iter, status
end


###############################################
# FUNÇÃO PARA TESTES EM MATRIZES SELECIONADAS #
###############################################

function testar(; saidas=false, reinicia=false)

    # Matrizes definidas positivas para teste
    # Fonte: https://sparse.tamu.edu
    matrizesA = [
        "bcsstm21",
        "bcsstm02",
        "bcsstk27",
        "bcsstk06",
        "662_bus",
        "bcsstk21",
        "1138_bus",
        "finan512",
        "thermal2"
    ]

    # tabela com resultados
    resultados = DataFrame(Matriz=[],n=[],st=[],it=[],g=[],tempo=[])

    # executa gradientes conjugados em cada problema
    for i in 1:length(matrizesA)

        # lê/baixa a matriz
        A = mdopen("*/"*matrizesA[i]).A.data

        # dimensão de A
        n = size(A)[1]

        # calcula b, gerando a quadrática
        #   q(x) = 1/2*x'*A*x + b'*x
        # o vetor b será computado de forma que Ay+b=0, onde y=(1,...,1)
        b = -A*ones(n)

        # Gradiente conjugados resolverá   g = grad f = 0.
        # isto é, resolverá o sistema g=Ax+b=0. O ponto inicial é a origem.

        # Imprimi informações na tela
        println()
        println()
        println("================================================")
        println("Matriz: $(matrizesA[i])")
        println("n = $n    Não zeros em A (triâng sup): $(nnz(A))")
        println("================================================")

        status = -1
        iter   = -1
        tempo  = -1

        try
            println("Aplicando gradientes conjugados à quadrática com matriz $(matrizesA[i])...")

            # número máximo de iterações para GC
            maxit = 1000*n

            tempo = @elapsed ~, gnorm, iter, status = gc(A,b, maxit=maxit, saidas=saidas, reinicia=reinicia);

            if status == 0
                println("Sucesso!")
            else
                println("GC falhou.")
            end

            println("Tempo (seg): $tempo")
            println("Número de iterações: $iter")

            # grava linha em resultados
            push!(resultados, (matrizesA[i], n, status, iter, gnorm, tempo))

        catch
            println("ERRO ao minimizar quadrática com matriz $(matrizesA[i])!")
        end

    end

    # ordena resultados por nome da matriz (coluna 1)
    sort!(resultados, 1)

    # salva resultados em arquivo binário
    # você pode carregá-lo executando "@load result_ptoint.jdl2".
    # Veja https://leonardosecchin.github.io/juliaopt_ex11/
#     @save "result_gc.jdl2" resultados

    # salva resultados em TXT
    txt = open("result_gc.txt", "w")
    write(txt, @sprintf("%s", resultados))
    close(txt)
end
