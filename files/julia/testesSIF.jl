###################################################
# TESTES COM ARQUIVOS DA CUTEst
# Este executa métodos para cada problema da CUTEst
# e tabela saídas em "resultados.txt".
#
# Autor: Leonardo D. Secchin
# Data : 28/04/2023
#
# Uso:
#   testesSIF()
###################################################

using CUTEst, Printf

# carrega método do gradiente
include("gradiente.jl")

# carrega método do gradiente espectral projetado (SPG)
# include("spg.jl")  #***** IMPLEMENTE SPG E INCLUA O ARQUIVO AQUI  *****

nlp = []

function testesSIF()

    # máximo de iterações para os métodos
    maxit = 10000

    # abre arquivo de saída em modo inserção
    arq = open("resultados.txt", "a")

    # seleciona problemas irrestritos com número de variáveis entre 10 e 50
    sif = CUTEst.select(contype="unc", max_var=50, min_var=10, only_free_var=true);

    try

    # Executa os métodos com 1 iteração no primeiro problema somente para
    # Julia compilar os códigos. Nenhuma saida é tabelada.
    # Assim, o tempo do primeiro problema não é afetado por tempos de
    # compilação.
    nlp = CUTEstModel(sif[1]);
    gradiente(nlp, maxiter=1, saidas=false);
    finalize(nlp)

    # escreve cabeçalho no arquivo de saída
    write(arq, "\n\n        Prob |      n | método |    it |         f |     grad | st |\n"*
                   "====================================================================\n")
    flush(arq)

    for i in 1:length(sif)

        println("==============\nCarregando o problema "*sif[i]*"...")

        # carrega o problema para estrutura NLPModels
        nlp = CUTEstModel(sif[i]);

        # pula problema caso o sentido de otimização não seja "minimização"
        if nlp.meta.minimize == true

            # escreve dados do problema no arquivo de saída
            write(arq, "-------------|--------|--------|-------|-----------|----------|----|\n")
            write(arq, @sprintf("%12s | %6d", sif[i], nlp.meta.nvar))
            flush(arq)

            ###############################################
            # APLICA MÉTODO DO GRADIENTE
            ###############################################
            println("Resolvendo "*sif[i]*" pelo método do gradiente...")

            # aplica gradiente a partir do ponto inicial fornecido no problema
            ~, gra_f, gra_g, gra_it, gra_st = gradiente_interp(nlp, x0=nlp.meta.x0, maxiter=maxit, saidas=false);

            # escreve resultado no arquivo de saida
            write(arq, @sprintf(" |   grad | %5d | %9.2e | %8.2e | %2d |\n",
                    gra_it, gra_f, gra_g, gra_st))
            flush(arq)

        end

        # fecha SIF atual
        finalize(nlp);

    end

    close(arq);

    # tratamento de erros
    catch err
        close(arq);

        if err isa InterruptException
            println("\nCTRL+C pressionado. Tentando finalizar nlp...");
            finalize(nlp);
        else
            println("============================================\n"*
                    "  Um erro ocorreu :(\n"*
                    "  Isso pode ter sido causado por um CTRL+C acionado no meio do processo.\n"*
                    "  Assim, o problema não foi finalizado, e a estrutura nlp foi perdida.\n"*
                    "  Re-inclua testesSIF.jl e tente novamente. Caso não dê certo, finalize o\n"*
                    "  Julia e recarregue os scripts;\n"*
                    "============================================");
            println("Erro:\n");
            println(err);
            println("\nObs: você pode descomentar o bloco try-catch para visualizar a saída completa do erro.")
        end
    end
end
