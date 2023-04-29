###################################################
# METODO DO GRADIENTE COM BUSCA LINEAR ARMIJO + INTERPOLAÇÃO QUADRÁTICA + SALVAGUARDAS
#
# Autor: Leonardo D. Secchin
# Data : 25/05/2022, atualizado em 28/04/2023
###################################################

using Printf, LinearAlgebra, NLPModels

# FUNÇÃO PRINCIPAL
"""
`x, f, gsupn, iter, nf, status = gradiente(nlp, [opções])`

Método do gradiente com busca linear inexata (Armijo + interpolação quadrática + salvaguardas), como descrito em

`https://leonardosecchin.github.io/files/otim1/4.3.Convergencia_metodos_descida.pdf`

`nlp` é a estrutura `MathOptNLPModel` do problema.

# Saídas

- `x`     : solução encontrada (ou histórico de todos os iterandos gerados)
- `f`     : valor da função objetivo no último iterando
- `gsupn` : norma do infinito do gradiente da função objetivo no último iterando
- `iter`  : número de iterações realizadas
- `nf`    : número de avaliações da função objetivo
- `status`: 0 para sucesso, 1 para falha

# Opções

- `x0`     : ponto inicial (caso não fornecido, `x0 = nlp.meta.x0` ou `x0 = zeros(nlp.meta.nvar)` caso `nlp.meta.x0` não esteja disponível)
- `eps`    : precisão para convergencia (padrão = 1.0e-6)
- `maxiter`: número máximo de iterações (padrão = 1000)
- `saidas` : mensagens na tela? (padrão = true)
- `interp` : usa interpolação quadrática? (padrão = true)
- `salvax` : retorna histórico de x (padrão = false)

# Exemplos

`julia> using CUTEst`\\
`julia> nlp = CUTEstModel("TRIGON1")`\\
`julia> gradiente(nlp);`\\
`julia> x, f, gsupn, iter, nf, status = gradiente(nlp, x0=ones(10), eps=1e-8, interp=false);`
"""
function gradiente(nlp; x0=nothing, eps=1.0e-6, maxiter=10000, saidas=true, interp=true, salvax=false)

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

    histx = x

    # contador de avaliações de f
    nf = 1

    # imprimi cabeçalho saídas
    if saidas
        @printf("\nit     \tf         |grad|\n==========================")
        @printf("\n%d\t%8.2e  %8.2e", iter, f, gsupn)
    end

    while gsupn > eps && iter < maxiter
        # direção
        d = -g

        # retorna novo iterando após busca linear (Armijo + interpolação quadrática)
        x, f, ~, lsnf = buscalinear(nlp, x, f, g, d, eta, interp)

        nf += lsnf

        # atualiza dados do iterando
        g     = grad(nlp, x)
        gsupn = norm(g, Inf)

        if salvax
            histx = [histx x]
        else
            histx = x
        end

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

    return histx, f, gsupn, iter, nf, status
end


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
