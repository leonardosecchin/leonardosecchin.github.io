###################################################
# METODO DO GRADIENTE, COMO DESCRITO NO SLIDE 29 DE
#   https://leonardosecchin.github.io/files/otim1/4.1.Metodos_descida_gerais.pdf
# Autor: Leonardo D. Secchin
# Data : 30/01/2021
#
# Exemplos de uso:
#   gradiente(nlp)
#   gradiente(nlp, x0=[1;1])
#   gradiente(nlp, eps=1e-8)
#   x, f, gradnorm, iter, status = gradiente(nlp, x0=[1;1], eps=1e-8, maxiter=2000)
# onde 'nlp' é a estrutura MathOptNLPModel do problema.
###################################################

# carrega pacotes necessários
using JuMP, NLPModels, NLPModelsJuMP, Printf


# FUNÇÃO PRINCIPAL
function gradiente(nlp; x0=nothing, eps=1.0e-6, maxiter=1000)

    # DADOS DE ENTRADA
    # nlp     : estrutura MathOptNLPModel do problema
    # x0      : ponto inicial (opcional)
    # eps     : precisão para convergencia (opcional, padrão=1.0e-6)
    # maxiter : número máximo de iterações (opcional, padrão=1000)

    # DADOS DE SAÍDA
    # x       : último iterando
    # f       : f(x)
    # gradnorm: norma do infinito do gradiente de f
    # iter    : número de iterações
    # status  : 0=sucesso, 1=falha

    iter   = 0
    status = 1

    # parâmetro busca linear inexata (Armijo)
    eta = 0.5

    # define ponto inicial caso não fornecido
    if x0 == nothing
        # captura ponto inicial da estrutura nlp
        if nlp.meta.x0 == nothing
            x0 = nlp.meta.x0
        else
            # caso não exista, seta x0=origem
            x0 = zeros(Float64,nlp.meta.nvar)
        end
    end

    # f, gradiente e norma
    x        = float(x0)
    f        = obj(nlp, x)
    gradf    = grad(nlp, x)
    gradnorm = norm(gradf, Inf)

    # imprimi cabeçalho saídas
    @printf("\nit     \tf         |grad|\n==========================")
    @printf("\n%d\t%8.2e  %8.2e", iter, f, gradnorm)

    while gradnorm > eps && iter < maxiter
        # direção descida
        d = -gradf

        # retorna novo iterando após busca linear (Armijo)
        x, f = armijo(nlp, x, f, gradf, d, eta)

        # atualiza dados do iterando
        gradf    = grad(nlp, x)
        gradnorm = norm(gradf, Inf)
        iter += 1

        # imprimi iteração corrente
        if mod(iter,20) == 0
            @printf("\n\nit     \tf         |grad|\n==========================")
        end
        @printf("\n%d\t%8.2e  %8.2e", iter, f, gradnorm)
    end

    # status de sucesso
    if gradnorm <= eps
        status = 0
    end

    # saída
    println("\n\n*******************************")
    if status == 0
        println("PROBLEMA RESOLVIDO COM SUCESSO!")
    else
        println("FALHA NA RESOLUÇÃO.")
    end
    println("*******************************\n")

    return x, f, gradnorm, iter, status
end


# BUSCA LINEAR
function armijo(nlp, x, f, gradf, d, eta)

    # calcula gradf' * d
    gtd = gradf' * d;

    # passo inicial
    t = 1

    # Armijo com backtracking
    xnew = x + t*d
    fnew = obj(nlp, xnew)

    while t > 1e-20 && fnew > f + t*eta*gtd
        # divide t por 10
        t /= 10.0

        # nova tentativa
        xnew = x + t*d
        fnew = obj(nlp, xnew)
    end

    # avisa se ocorreu um passo muito pequeno
    if t <= 1e-20
        println("AVISO: passo muito pequeno!")
    end

    # retorna novo iterando
    return xnew, fnew
end
