###################################################
# TESTES COM ARQUIVOS DA CUTEst
# Este script lê o diretório indicado e executa
# comandos para cada arquivo .SIF encontrado.
#
# Autor: Leonardo D. Secchin
# Data : mar 2021
###################################################

using CUTEst, Printf

# inclui arquivo do método do gradiente
include("gradiente.jl")

function testesSIF(; sifpath="sif")

    # tenta finalizar nlp caso esteja alocada
    if @isdefined(nlp)
        try
            finalize(nlp);
        catch
        end
    end

    # "sif" no diretório atual é o caminho padrão para os arquivos SIF
    sifdir = readdir(sifpath, join=true)

    for i in 1:length(sifdir)

        # Verifica se o arquivo i tem extensão .SIF
        if uppercase(sifdir[i][max(end-3,1):end]) == ".SIF"

            println("Lendo arquivo "*basename(sifdir[i])*"...")
            
            probname = basename(sifdir[i])[1:end-3]
            
            # carrega arquivo SIF para estrutura NLPModels
            nlp = CUTEstModel(sifdir[i]);
            
            # aplica gradiente se o problema for irrestrito
            if nlp.meta.ncon == 0
                gradiente(nlp);
            end
            
            # fecha SIF atual
            finalize(nlp);

        end
    end
end