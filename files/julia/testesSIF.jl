###################################################
# TESTES COM ARQUIVOS DA CUTEst
# Este executa métodos para cada problema da CUTEst
# e tabela saídas em "resultados.txt".
#
# Autor: Leonardo D. Secchin
# Data : mai 2022
#
# Uso:
#   testesSIF()
###################################################

using CUTEst, Printf

# carrega método do gradiente com busca linear por Armijo + interpolação quadrática + salvaguardas
include("gradiente_interp.jl")

# carrega método do gradiente espectral projetado (SPG)
# include("spg.jl")  #***** IMPLEMENTE SPG E INCLUA O ARQUIVO AQUI  *****


function testesSIF(; sifpath=pwd()*"/sif")

    # máximo de iterações para os métodos
    maxit = 10000

    # abre arquivo de saída em modo inserção
    arq = open("resultados.txt", "a")

    # seleciona problemas irrestritos
    sif = CUTEst.select(contype="unc", max_var=2000, min_var=50, only_free_var=true);

    try

    # escreve cabeçalho no arquivo de saída
    write(arq, "\n\n        Prob |      n | método |    it |         f |     grad | st |\n"*
                   "====================================================================\n")
    flush(arq)

    compilar = true

    for i in 1:length(sif)

        # No primeiro SIF encontrado, executa métodos com 1 iteração
        # somente para Julia compilar os códigos. Nenhuma saida é tabelada.
        # Assim, o tempo do primeiro problema não é afetado por tempos de
        # compilação.
        if compilar
            nlp = CUTEstModel(sif[i]);
            gradiente_interp(nlp, maxiter=1, saidas=false);
#             spg(nlp, maxiter=1, saidas=false); #***** IMPLEMENTE SPG E DESCOMENTE ESTA LINHA  *****
            compilar = false
            finalize(nlp)
        end

        println("==============\nCarregando o problema "*sif[i]*"...")

        # carrega o problema para estrutura NLPModels
        nlp = CUTEstModel(sif[i]);

        # pula problema caso o sentido de otimização não seja "minimização"
        if nlp.meta.minimize == true

            # escreve dados do problema no arquivo de saída
            write(arq, "-------------|--------|--------|-------|-----------|----------|----|\n")
            write(arq, @sprintf("%12s | %6d", sif[i], nlp.meta.nvar))
            flush(arq)

            # variável para impressão de resultados com vários métodos
            primeiro_res = true

            # conta variáveis que possuem limitante inferior ou superior
            boundedvars = count((nlp.meta.lvar .> -Inf) .| (nlp.meta.uvar .< Inf))

            ###############################################
            # APLICA MÉTODO DO GRADIENTE
            # se o problema for irrestrito.
            ###############################################
            if (nlp.meta.ncon == 0) & (boundedvars == 0)

                println("Resolvendo "*sif[i]*" pelo método do gradiente...")

                # aplica gradiente a partir do ponto inicial fornecido no problema
                ~, gra_f, gra_g, gra_it, gra_st = gradiente_interp(nlp, x0=nlp.meta.x0, maxiter=maxit, saidas=false);

                # escreve resultado no arquivo de saida
                write(arq, @sprintf(" |   grad | %5d | %9.2e | %8.2e | %2d |\n",
                        gra_it, gra_f, gra_g, gra_st))
                flush(arq)

                primeiro_res = false

            end

            ###############################################
            # APLICA MÉTODO DO GRAD. ESPECTRAL PROJ. (SPG)
            # se o problema for irrestrito ou só tiver
            # restrições de caixa.
            ###############################################
#             if nlp.meta.ncon == 0
#
#                 #**********************************************************
#                 #***** IMPLEMENTE SPG E DESCOMENTE AS LINHAS A SEGUIR *****
#                 #**********************************************************
#
#                 println("Resolvendo "*sif[i]*" pelo método do gradiente espectral projetado...")
#
#                 # aplica SPG a partir do ponto inicial fornecido no problema
#                 ~, spg_f, spg_g, spg_it, spg_st = spg(nlp, x0=nlp.meta.x0, maxiter=maxit, saidas=false);
#
#                 # escreve resultado no arquivo de saida
#                 # se já há linha de método anterior, tabula adequadamente
#                 if !primeiro_res
#                     write(arq, "             |       ")
#                 end
#
#                 write(arq, @sprintf(" |    spg | %5d | %9.2e | %8.2e | %2d |\n",
#                         spg_it, spg_f, spg_g, spg_st))
#                 flush(arq)
#
#                 primeiro_res = false
#
#             end

            # OBS:
            # Você pode inserir outros métodos a serem executados
            # em sequência. Adapte o bloco acima.

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
                    "  Isso pode ter sido causado por\n"*
                    "  1. um CTRL+C acionado no meio do processo.\n"*
                    "     Assim, o problema SIF não foi finalizado, e a estrutura nlp foi perdida.\n"*
                    "     Re-inclua testesSIF.jl e tente novamente. Caso não dê certo, finalize o\n"*
                    "     Julia e recarregue os scripts;\n"*
                    "  2. uso de espaços no caminho do diretório sif. Aparentemente o pacote\n"*
                    "     CUTEst.jl não lida bem com espaços. Certifique-se de que diretórios\n"*
                    "     e arquivos não possuam espaços.\n"*
                    "============================================");
            println("Erro:\n");
            println(err);
            println("\nObs: você pode descomentar o bloco try-catch para visualizar a saída completa do erro.")
        end
    end
end
