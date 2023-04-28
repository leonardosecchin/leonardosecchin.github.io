###################################################
# BUSCA LINEAR COM INTERPOLAÇÃO QUADRÁTICA E SALVAGUARDAS
#
# Autor: Leonardo D. Secchin
# Data : 09/06/2022, atualizado em 28/04/2023
###################################################

using LinearAlgebra, NLPModels

# BUSCA LINEAR COM ARMIJO + BACKTRACKING + INTERPOLAÇÃO QUADRÁTICA
# Adapte esta função para que Armijo modificado seja utilizado
# (note que fmax já está no cabeçalho).
function buscalinear(nlp, x, f, g, d, eta, interp)

    # calcula g' * d
    gtd = g' * d

    # passo inicial
    t = 1.0

    # primeira tentativa
    xnew = x + d
    fnew = obj(nlp, xnew)

    # contador de avaliações de f
    lsnf = 1

    # enquanto Armijo não é satisfeito, atualiza t...
    while fnew > f + t*eta*gtd

        if interp
            # passo da interpolação quadrática
            tquad = - 0.5*gtd*(t^2) / (fnew - f - t*gtd)

            # salvaguardas
            if (tquad < 0.1*t) || (tquad > 0.9*t)
                # backtracking
                t = t / 2.0
            else
                # aceita o passo da interpolação quadrática
                t = tquad
            end
        else
            t = t / 2.0
        end

        # novo ponto
        xnew = x + t*d
        fnew = obj(nlp, xnew)

        lsnf += 1
    end

    # retorna novo iterando
    return xnew, fnew, t, lsnf
end
