###################################################
# METODO DO GRADIENTE COM BUSCA LINEAR ARMIJO + INTERPOLAÇÃO QUADRÁTICA + SALVAGUARDAS
# Veja
#   leonardosecchin.github.io/files/otim1/4.1.Metodos_descida_gerais.pdf
#
# Aqui, a busca linear segue o proposto na implementação de referência do SPG:
#   www.ime.usp.br/~egbirgin/tango/codes.php
#
# Autor: Leonardo D. Secchin
# Data : 06/03/2021
#
# Exemplos de uso:
#   gradiente_interp(nlp);
#   gradiente_interp(nlp, x0=[1;1]);
#   gradiente_interp(nlp, eps=1e-8);
#   x, f, gsupn, iter, status = gradiente_interp(nlp, x0=[1;1], eps=1e-8, maxiter=2000, saidas=true);
# onde 'nlp' é a estrutura MathOptNLPModel do problema.
###################################################

using Printf, LinearAlgebra, NLPModels

# FUNÇÃO PRINCIPAL
function gradiente_interp(nlp; x0=nothing, eps=1.0e-6, maxiter=10000, saidas=true)

    # DADOS DE ENTRADA
    # nlp     : estrutura MathOptNLPModel do problema
    # x0      : ponto inicial (opcional)
    # eps     : precisão para convergencia (opcional, padrão=1.0e-6)
    # maxiter : número máximo de iterações (opcional, padrão=1000)
    # saidas  : mensagens na tela?

    # DADOS DE SAÍDA
    # x       : último iterando
    # f       : f(x)
    # gsupn   : norma do supremo do gradiente de f
    # iter    : número de iterações
    # status  : 0=sucesso, 1=falha

    iter   = 0
    status = 1

    # parâmetro busca linear inexata (Armijo)
    eta = 1e-4

    # define ponto inicial caso não fornecido
    if x0 == nothing
        # captura ponto inicial da estrutura nlp
        if nlp.meta.x0 != nothing
            x0 = nlp.meta.x0
        else
            # caso não exista, seta x0=origem
            x0 = zeros(Float64,nlp.meta.nvar)
        end
    end

    # f, gradiente e norma
    x     = float(x0)
    f     = obj(nlp, x)
    g     = grad(nlp, x)
    gsupn = norm(g, Inf)

    # imprimi cabeçalho saídas
    if saidas
        @printf("\nit     \tf         |grad|\n==========================")
        @printf("\n%d\t%8.2e  %8.2e", iter, f, gsupn)
    end

    while gsupn > eps && iter < maxiter
        # direção
        d = -g

        # retorna novo iterando após busca linear (Armijo + interpolação quadrática)
        x, f = buscalinear(nlp, x, f, f, g, d, eta)

        # atualiza dados do iterando
        g     = grad(nlp, x)
        gsupn = norm(g, Inf)

        iter += 1

        # imprimi iteração corrente
        if saidas
            if mod(iter,20) == 0
                @printf("\n\nit     \tf         |grad|\n==========================")
            end
            @printf("\n%d\t%8.2e  %8.2e", iter, f, gsupn)
        end
    end

    # status de sucesso
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

    return x, f, gsupn, iter, status
end


# BUSCA LINEAR COM INTERPOLAÇÃO QUADRÁTICA E SALVAGUARDAS
#
# Código implementado como no SPG disponível em
#   www.ime.usp.br/~egbirgin/tango/codes.php
#
# Aqui, a interpolação quadrática é tentada sucessivas vezes nos pontos x+t*d.
# Salvaguardas são empregadas, isto é, caso o passo da
# interpolação seja próximo de 0 ou 1, usa backtracking (divide por 2).
# Essa estratégia une a aceleração da interpolação quadrática
# com um melhor controle de passos extremos.
#
# Ao calcular o passo da interpolação no ponto x+t*d, aparece um t^2.
# Em
#   leonardosecchin.github.io/files/otim1/4.1.Metodos_descida_gerais.pdf
# só calculamos a interpolação referente ao ponto x+d. Você pode
# refazer as contas dessa aula e verificar que aparece o t^2 quando o ponto
# de referência é x+t*d.
#
# A variável "fmax" neste código será igual à "f". No SPG, "fmax" receberá o
# máximo dos últimos valores de f, enquanto "f" receberá o valor de f no ponto
# corrente.
function buscalinear(nlp, x, f, fmax, g, d, eta)

    # calcula g' * d
    gtd = g' * d

    # passo inicial
    t = 1.0

    xnew = x + d
    fnew = obj(nlp, xnew)

    # enquanto Armijo não é satisfeito, atualiza t...
    while fnew > fmax + t*eta*gtd
        # se t for próximo de 0, usa backtracking
        if t <= 0.1
            t /= 2.0
        else
            # passo da interpolação quadrática
            tquad = - 0.5*gtd*(t^2) / (fnew - f - gtd)

            # se tquad for próximo de 1, usa backtracking
            if (tquad < 0.1) || (tquad > 0.9)
                tquad = t / 2.0
            end

            t = tquad
        end

        # nova tentativa
        xnew = x + t*d
        fnew = obj(nlp, xnew)
    end

    # retorna novo iterando
    return xnew, fnew
end
