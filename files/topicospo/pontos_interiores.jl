###################################################
# METODO DE PONTOS INTERIORES PRIMAL DUAL AFIM
# ESCALA PARA PL's NA FORMA PADRÃO
#
# min c^t x
# s.a. Ax = b
#       x >= 0
#
# Autor: Leonardo D. Secchin
# Data : 24/06/2021
# leonardosecchin.github.io/topicospo/
#
# Entrada:
#    -- Obrigatórios --
#    A,b,c:   dados do problema (esparsos ou não)
#
#    -- Opcionais --
#    maxit : número máximo de iterações (padrão = 100)
#    eps   : precisao para parada com sucesso (padrão = 1e-8)
#    tau   : ajuste de passos (padrão = 0.99995)
#    epsz  : epsilon para z inicial (padrão = 30)
#    saidas: imprimi saídas na tela? true(padrão) ou false
#
# Saida:
#    x:       solução ou último iterando
#    f:       valor final da FO
#    iter:    número de iterações executadas
#    status:
#       0 = sucesso
#       1 = problema ilimitado ou inviável
#       2 = maxit atingido
#       3 = A tem posto numericamente deficiente
#       4 = erro em Cholesky de ADA' (ADA' numericamente singular?)
#       9 = outro erro
#
# Para testar o método nos problemas pré-selecionados, execute
#   testar()
# ou
#   testar(saidas=true)
# Esta função fará o download dos problemas automaticamente.
#
# Exemplos de uso da função principal:
#   pdafimescala(A,b,c)
#   x, f, iter, status = ptoint(A,b,c, maxit=100, eps=1e-8, tau=0.99995, epsz=30, saidas=true)
###################################################

# pacotes para manipulação matricial
using LinearAlgebra, SparseArrays

# pacotes impressão e gravação de resultados
using Printf, DataFrames

# pacote para download de matrizes de https://sparse.tamu.edu
using MatrixDepot


################################
# MÉTODO PRIMAL DUAL AFIM ESCALA
################################

function pdafimescala(A,b,c; maxit=100, eps=1e-8, tau=0.99995, epsz=30, saidas=true)

    # Lê dimensões
    m,n = size(A)

    # Verifica se as dimensões dos dados são compatíveis
    if (length(b) != m) | (length(c) != n) | (m > n)
        error("Dados com dimensões incompatíveis!")
    end

    # Certifica-se que b e c são matrizes coluna
    if size(b)[1] == 1; b = Vector(b'[:,1]); end
    if size(c)[1] == 1; c = Vector(c'[:,1]); end

    #####################
    # Inicialização
    #####################

    status = 9
    iter   = 0
    viab   = Inf
    KKT    = Inf

    # Realoca A em estrutura esparsa, caso não esteja
    A = sparse(A)

    # c e b são vetores cheios
    c = Vector(c[:,1])
    b = Vector(b[:,1])

    # Guarda normas 1 de b e c para teste de convergência
    normb = norm(b,1)
    normc = norm(c,1)

    # Tenta fatorar A*A' por Cholesky.
    # Caso falhe, é porque A não tem posto completo. Neste caso retorna erro.
    # Caso tenha sucesso, capturamos a permutação p obtida por AMD.
    # "Symmetric" garante que internamente a matriz seja tratada como simétrica perfeita.
    # check=true faz cholesky retornar erro caso G*G' != P'(A*A')P
    C = []

    try
        C  = cholesky(Symmetric(sparse(A*A')), check=true, perm=nothing)
    catch
        println("A tem posto numericamente deficiente. Não se pode continuar!")
        status = 3

        return NaN,NaN,iter,viab,KKT,status
    end

    pAMD = C.p  # permutação de AMD

    # A permutação usada internamente por cholesky é gravada em C.p.
    # Assim, temos
    #   G*G' = (A*A')[C.p,C.p]
    # Dado um vetor v,
    #   v[C.p]
    # retorna P'*v. Para retornar P*v, precisamos da permutação
    # inversa de C.p:
    invpAMD = Vector(1:m)
    invpAMD[pAMD] = Vector(1:m)


    #####################
    # Ponto inicial
    #####################

    # Calcula A'(AA')^-1 b
    xbar = A'*((A*A')\b)

    # x, y, z iniciais
    x = max.( xbar , maximum( [ -minimum(xbar); 100; 0.01*normb/norm(A,1) ] ) )
    y = zeros(m,1)
    z = abs.(c) + epsz * (c .>= 0)
    z[(c .> -epsz) .& (c .< 0)] .= epsz

    # x, y, z, resíduos e direções são vetores cheios ao longo do processo
    x = Vector(x[:,1])
    y = Vector(y[:,1])
    z = Vector(z[:,1])

    # avalia FO primal f(x)=c^t x no ponto inicial
    f = dot(c,x)

    # Limite para critério de inviabilidade
    M = 1e+6 * norm([x;z],1)

    # inicia passos = Inf para correta impressão da 1a iteração
    alphap = Inf
    alphad = Inf

    # LOOP PRINCIPAL
    while iter < maxit

        # Calcula resíduos
        rp = b - A*x
        rd = c - A'*y - z
        rc = -x.*z  # =-XZe=-(x1z1, ... ,xnzn)

        #####################
        # Critério de parada
        #####################

        # Teste de convergência KKT
        KKTp = norm(rp,1)/(1 + normb)  # viabilidade primal relativa
        KKTd = norm(rd,1)/(1 + normc)  # viabilidade dual relativa
        fd   = dot(b,y)
        KKTc = abs(f - fd)/(1 + abs(f) + abs(fd))  # brecha de dualidade relativa

        KKT  = maximum([KKTp KKTd KKTc])  # medida de otimalidade (viab primal + dual + dualidade)

        viab = norm(rp,1)  # viabilidade primal absoluta

        # imprimi dados da iteração na tela
        if saidas
            if mod(iter,10) == 0
                @printf("\nit     \tf         viab      alphamax  KKT")
                @printf("\n===========================================================\n")
            end
            @printf("%d\t%8.2e  %8.2e  %8.2e  %8.2e\n",
                    iter, f, viab, max(alphap,alphad), KKT)
        end

        # Parar com sucesso?
        if KKT < eps
            println("\n--- SOLUÇÃO ENCONTRADA! ---")
            status = 0

            # retorno da função principal
            return x,f,iter,viab,KKT,status
        end

        # Teste de ilimitabilidade ou inviabilidade: parar com insucesso?
        # TEOREMA: se P é inviável ou ilimitado então |x|->Inf ou |z|->Inf
        # Assim, um critério para "suspeitar" que P não tem solução é |(x,z)| >> 1
        if norm([x,z],1) > M
            println("\n--- Problema provavelmente inviável ou ilimitado ---")
            status = 1
            f = NaN

            # retorno da função principal
            return x,f,iter,viab,KKT,status
        end

        # D = Z^{-1} X  (D será um vetor aqui, pois só precisamos armazenar a diagonal)
        D = x./z

        #####################
        # Direção Newtoniana
        #####################

        # Decomposição de Cholesky de ADA'.
        # spdiagm(0 => D) é a matriz diagonal esparsa. "0=>D" indica diagonal principal = D.
        AD = sparse(A*spdiagm(0 => D))

        # Usa a permutação pAMD calculada no inicio do método
        try
            C  = cholesky(Symmetric(sparse(AD*A')), check=true, perm=pAMD)
        catch
            println("Cholesky de ADA' falhou!")
            status = 4

            # retorno da função principal
            return x,f,iter,viab,KKT,status
        end

        # G será o fator de Cholesky triangular INFERIOR
        # Portanto temos GG' = P'(ADA')P.
        G  = sparse(C.L)

        # (ADA') dy = rp + AD(rd - X^-1 rc)
        #        dx = D(A'dy - rd + X^-1 rc)
        #        dz = X^-1 (rc - Zdx)
        # Temos GG' = P'(ADA')P. Resolvemos então
        #  (i) GG'h = P'(ADA')(Ph) = P'(rp + AD(rd - X^-1 rc))
        # (ii)   dy = Ph
        rcx = rc./x                    # rcx = X^-1 rc
        r   = rd - rcx                 # r  = rd - X^-1 rc
        s   = G\(rp + AD*r)[pAMD]      # Gs = P'(rp + AD(rd - X^-1 tc))
        tdy = G'\s                     # G' tdy = s
        dy  = tdy[invpAMD]             # dy = P tdy
        dx  = AD'*dy - D.*r
        dz  = rcx - (dx.*z)./x

        #####################
        # Tamanhos de passo (<= 1)
        #####################
        xdx = x./dx  # =(x1/dx1, ... ,xn/dxn)
        zdz = z./dz  # =(z1/dz1, ... ,zn/dzn)
        alphap = minimum( [ 1 ; -tau * xdx[dx .< 0] ] )  # .< testa < em cada coordenada
        alphad = minimum( [ 1 ; -tau * zdz[dz .< 0] ] )

        #####################
        # Atualização do ponto corrente
        #####################
        x = x + alphap*dx
        y = y + alphad*dy
        z = z + alphad*dz

        # Recalcula FO primal
        f = dot(c,x)

        iter += 1

    end

    # Neste ponto, maxit foi atingido... retorna último x obtido
    println("\n--- Número máximo de iterações atingido ---")
    status = 2

    return x,f,iter,viab,KKT,status
end
################################
################################


# Função para testes com problemas da NETLIB
# http://www.netlib.org/lp/data/index.html
function testar(; saidas=false)

    # PARAMETROS SUGERIDOS
    maxit = 100
    eps   = 1e-8
    tau   = 0.99995
    epsz  = 30

    # Problemas na forma padrão selecionados da NETLIB
    #   Fonte dos arquivos: grupo "LPnetlib" - https://sparse.tamu.edu/LPnetlib
    netlib = [
        "LPnetlib/lp_adlittle",
        "LPnetlib/lp_afiro",
        "LPnetlib/lp_agg",
        "LPnetlib/lp_agg2",
        "LPnetlib/lp_agg3",
        "LPnetlib/lp_bandm",
        "LPnetlib/lp_beaconfd",
        "LPnetlib/lp_blend",
        "LPnetlib/lp_bnl2",
        "LPnetlib/lp_d2q06c",
        "LPnetlib/lp_e226",
        "LPnetlib/lp_fffff800",
        "LPnetlib/lp_osa_60",
        "LPnetlib/lp_israel",
        "LPnetlib/lp_lotfi",
        "LPnetlib/lp_maros_r7",
        "LPnetlib/lp_osa_07",
        "LPnetlib/lp_osa_14",
        "LPnetlib/lp_osa_30",
        "LPnetlib/lp_sc50a",
        "LPnetlib/lp_sc105",
        "LPnetlib/lp_sc205",
        "LPnetlib/lp_sc50b",
        "LPnetlib/lp_scagr25",
        "LPnetlib/lp_scagr7",
        "LPnetlib/lp_scfxm1",
        "LPnetlib/lp_scfxm2",
        "LPnetlib/lp_scfxm3",
        "LPnetlib/lp_scrs8",
        "LPnetlib/lp_scsd1",
        "LPnetlib/lp_scsd6",
        "LPnetlib/lp_scsd8",
        "LPnetlib/lp_sctap1",
        "LPnetlib/lp_sctap2",
        "LPnetlib/lp_sctap3",
        "LPnetlib/lp_share1b",
        "LPnetlib/lp_share2b",
        "LPnetlib/lp_woodw",
        "LPnetlib/lp_stocfor1",
        "LPnetlib/lp_stocfor2",
        "LPnetlib/lp_stocfor3",
        "LPnetlib/lp_truss",
        "LPnetlib/lpi_itest2", #inviável
        "LPnetlib/lpi_itest6", #inviável
        "LPnetlib/lpi_bgindy", #inviável
        "LPnetlib/lpi_bgprtr", #inviável
        "LPnetlib/lpi_klein1", #inviável
        "LPnetlib/lpi_klein2", #inviável
        "LPnetlib/lpi_klein3"  #inviável
    ];

    # cabeçalho tabela com resultados
    resultados = DataFrame(Prob=[],n=[],m=[],st=[],it=[],f=[],viab=[],KKT=[],tempo=[])

    # executa pontos interiores em cada problema
    for p in netlib

        # lê problema (e baixa caso não tenha sido baixado)
        PL = mdopen(p);
        nomeprob = p[10:end]

        # PL é uma estutura com as seguintes propriedades:
        # PL.A, PL.b : sistema Ax=b
        # PL.c       : coeficiente função objetivo
        # PL.n, PL,m : número de variáveis e restrições
        # PL.nnz     : número de não zeros em A

        PLstatus = -1
        PLiter   = -1
        PLviab   = -1
        PLKKT    = -1
        PLf      = NaN
        PLtempo  = -1

        try
            println("\n==================")
            println("Prob: "*p)
            println("n="*string(PL.n)*", m="*string(PL.m))
            println("nnz em A: "*string(PL.nnz))
            println("==================")

            # aplica pontos interiores com reordenamento AMD
            PLtempo = @elapsed ~, PLf, PLiter, PLviab, PLKKT, PLstatus =
                pdafimescala(PL.A, PL.b, PL.c, maxit=maxit, eps=eps, tau=tau, epsz=epsz, saidas=saidas);

            print("Tempo (seg): ")
            println(PLtempo)

            # grava linha em resultados
            push!(resultados, (nomeprob, PL.n, PL.m, PLstatus, PLiter, PLf, PLviab, PLKKT, PLtempo))

        catch
            println("ERRO ao resolver $(nomeprob)!")
        end

    end

    # ordena resultados por nome do problema (coluna 1)
    sort!(resultados, 1)

    # salva resultados em TXT
    txt = open("resultados.txt", "w")
    write(txt, @sprintf("%s", resultados))
    close(txt)

    # Você pode salvar o resultado em planilhas.
    # Veja https://leonardosecchin.github.io/juliaopt_ex11/
end
