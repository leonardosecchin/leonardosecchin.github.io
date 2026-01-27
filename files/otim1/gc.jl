###################################################
# MÉTODO DOS GRADIENTES CONJUGADOS
#
# Autor: Leonardo D. Secchin
# Data : atualizado em 10/07/2024
#
# Para testar o método em problemas selecionados, execute
#   testar()
###################################################

using Printf, LinearAlgebra, SparseArrays, DataFrames, MatrixDepot

"""
`x, gsupn, iter, status = gc(A, b, [opções])`

Método de gradientes conjugados para minimização de quadráticas estritamente convexas `q(x) = 1/2*x'*A*x + b'*x + c` onde `A` é matriz simétrica e definida positiva.

`https://leonardosecchin.github.io/files/otim1/4.6.Gradientes_conjugados.pdf`

O método anula o gradiente de `q`, isto é, resolve o sistema `g = Ax + b = 0`.

`A` é uma matriz quadrada esparsa, `b` vetor.

# Saídas

- `x`      : último iterando
- `gsupn`  : norma do infinito do gradiente da quadrática no último iterando
- `iter`   : número de iterações realizadas
- `status` : 0 para sucesso, 1 para falha

# Opções

- `x0`       : ponto inicial (caso não fornecido, `x0 = zeros(n)`)
- `eps`      : precisão para convergencia (padrão = 1.0e-6)
- `maxiter`  : número máximo de iterações (padrão = 10000)
- `saidas`   : mensagens na tela? (padrão = true)
"""
function gc(A,b; x0=nothing, eps=1.0e-6, maxiter=10000, saidas=true)

    iter   = 0
    status = 1

    # captura número de variáveis (dimensão de A)
    n = size(A)[1]

    # aloca vetores
    x     = zeros(n)
    g     = similar(x)
    g_ant = similar(x)
    w     = similar(x)
    d     = similar(x)

    # ponto inicial
    if !isnothing(x0)
        x .= float(x0)
    end
    g .= A*x + b
    gsupn = norm(g, Inf)

    # imprimi cabeçalho saídas
    if saidas
        @printf("\nit     \t|grad|\n=====================")
        @printf("\n%d\t%8.2e", iter, gsupn)
    end

    # direção inicial
    d .= -g

    while gsupn > eps && iter < maxiter

        ##########################
        # IMPLEMENTE A ITERAÇÃO DE GRADIENTES CONJUGADOS
        # CONFORME VISTO EM AULA
        ##########################

        # .................

        # atualiza norma de g
        gsupn = norm(g,Inf)

        # incrementa contador de iterações
        iter += 1

        # imprimi informações da iteração corrente
        if saidas
            if mod(iter,20) == 0
                @printf("\n\nit     \tf         |grad|\n==========================")
            end
            @printf("\n%d\t%8.2e", iter, gsupn)
        end
    end

    # sucesso!
    if gsupn <= eps
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

    return x, gsupn, iter, status
end


"""
FUNÇÃO PARA TESTES EM MATRIZES SELECIONADAS. Execute `testar()`.

A saída dos testes é gravada no arquivo `result_gc.txt`.
"""
function testar(; saidas=false, reinicia=false)

    # Matrizes definidas positivas para teste (pode adicionar outras)
    # Fonte: https://sparse.tamu.edu
    matrizesA = [
        "bcsstm21",
        "bcsstm02",
        "bcsstk27",
        "bcsstk06",
        "662_bus",
        "bcsstk21",
        "1138_bus",
        "finan512"
    ]

    # tabela com resultados
    resultados = DataFrame(Matriz=[],n=[],st=[],it=[],g=[],tempo=[])

    # executa gradientes conjugados em cada problema
    for i in 1:length(matrizesA)

        # lê a matriz
        A = mdopen("*/"*matrizesA[i]).A;

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
        println("n = $n    Não zeros em A (triâng sup): $(nnz(sparse(A)))")
        println("================================================")

        status = -1
        iter   = -1
        tempo  = -1

        try
            println("Aplicando gradientes conjugados à quadrática com matriz $(matrizesA[i])...")

            # número máximo de iterações para GC
            maxiter = 1000*n

            tempo = @elapsed ~, gsupn, iter, status = gc(A,b, maxiter=maxiter, saidas=saidas, reinicia=reinicia);

            if status == 0
                println("Sucesso!")
            else
                println("GC falhou.")
            end

            println("Tempo (seg): $tempo")
            println("Número de iterações: $iter")

            # grava linha em resultados
            push!(resultados, (matrizesA[i], n, status, iter, gsupn, tempo))

        catch
            println("ERRO ao minimizar quadrática com matriz $(matrizesA[i])!")
        end

    end

    # ordena resultados por nome da matriz (coluna 1)
    sort!(resultados, 1)

    # salva resultados em TXT
    txt = open("result_gc.txt", "w")
    write(txt, @sprintf("%s", resultados))
    close(txt)
end
