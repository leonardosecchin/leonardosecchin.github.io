######################################################
# EXEMPLO SIMPLES DE USO DO PACOTE FLUX
# para treinamento de uma rede neural pequena para
# o problema de classificação de caracteres numéricos
# da MNIST.
#
# (adaptado do exemplo do "model-zoo" https://github.com/FluxML/model-zoo/blob/master/vision/mlp_mnist/mlp_mnist.jl)
#
# Autor: Leonardo D. Secchin
# Data : 31/08/2021
# leonardosecchin.github.io/topicospo/
#
# Execução:
#   treinar()
# ou
#   treinar(ninter = 30, eta = 1e-2, batchsize = 256, nepochs = 15)
######################################################

using Plots, Statistics

# carrega Flux
using Flux

# exporta estruturas internas do Flux para ambiente do usuário
# (assim não precisa escrever Flux.ESTRUTURA)
using Flux.Data: DataLoader
using Flux: onehotbatch, onecold, @epochs
using Flux.Losses: mse

# carrega pacote contendo base de dados MNIST
using MLDatasets


##########################
# CARREGA DATASET MNIST
##########################
function carrega_dados(batchsize)
#     ENV["DATADEPS_ALWAYS_ACCEPT"] = "true"

    # carrega MNIST
    #   (xtrain,ytrain): pares entrada-saída para treino da rede
    #   (xtest,ytest)  : pares entrada-saída para teste da rede treinada
    xtrain, ytrain = MLDatasets.MNIST.traindata(Float32)
    xtest,  ytest  = MLDatasets.MNIST.testdata(Float32)

    # Reorganiza imagens para estrutura Flux
    xtrain = Flux.flatten(xtrain)
    xtest = Flux.flatten(xtest)

    # Codifica as saídas (labels '0' a '9') em vetores de 0's e 1's de tamanho 10 (one-hot-encode)
    #   Para visualizar o resultado, execute por exemplo  onehotbatch([1 2 3], 0:9)
    ytrain, ytest = onehotbatch(ytrain, 0:9), onehotbatch(ytest, 0:9)

    # Divide os dados de treinamento em mini-lotes de tamanho batchsize
    #   shuffle=true diz que os dados são embaralhados antes de cada época
    #   (veja pgs 8 e 13 de https://leonardosecchin.github.io/files/topicospo/ML_4-sg.pdf)
    #   DataLoader é uma estrutura própria do pacote Flux.jl. Execute ?DataLoader para detalhes.
    train_loader = DataLoader((xtrain, ytrain), batchsize=batchsize, shuffle=true)

    # Divide os dados de teste em mini-lotes
    test_loader = DataLoader((xtest, ytest), batchsize=batchsize)

    # retorna os dados de treino e teste
    return train_loader, test_loader
end

##########################
# MONTA A REDE NEURAL
##########################
function constroi_rede(ninter)
    # Chain e Dense são funções do pacote Flux para criação da rede neural
    #
    #   Dense(n[l-1],n[l], ativação) cria uma camada tradicional (como vista em aula)
    #   com n[l-1] neurônios entrando, n[l] saindo, e onde o fluxo é guiado por
    #   a[l] = a.(W[l] * a[l-1] .+ bias[l])
    #   Pode-se indicar diferentes funções de ativação: sigmoid, relu ...
    #   Veja ?Dense e a ajuda do Flux para mais detalhes
    #
    #   Chain agrega as camadas em um único objeto

    # Abaixo, uma rede com a seguinte estrutura é criada:
    #   camada de entrada com 784=28*28 neurônios
    #   ninter neurônios na segunda camada, todos com ativação sigmoid
    #   camada de saída com 10 neurônios, todos com ativação sigmoid
    #
    # Pesos e vieses são iniciados randomicamente
    return Chain(
 	        Dense(784, ninter, sigmoid),
            Dense(ninter, 10, sigmoid)
            )
end

##########################
# AVALIA RISCO EMPÍRICO (feedforward) (sobre todos os dados de treinamento)
#
# Algumas funções de perda implementadas no Flux:
#   mse (+ usada aula) : (ŷ .- y) .^ 2
#   msle               : log.(ŷ .+ ϵ) .- log.(y .+ ϵ)) .^ 2
#   crossentropy       : -sum(y .* log.(ŷ .+ ϵ))
#   binarycrossentropy : -y * log(ŷ + ϵ) - (1 - y) * log(1 - ŷ + ϵ)
#
# Legenda
#   y = a[L] é o rótulo do dado de entrada
#   ŷ é a resposta da rede
#
# Muitas outras funções estão disponíveis. Veja
# https://fluxml.ai/Flux.jl/stable/models/losses
#
# Obs: é possível implementar sua própria função de perda.
# Veja exemplos do model-zoo.
##########################
function loss(data_loader, rede)
    acc = 0
    ls = 0.0f0
    num = 0

    # percorre todos os dados em data_loader
    for (x, y) in data_loader
        # pares entrada-saída do treinamento
        x, y = cpu(x), cpu(y)

        # respostas da rede (feedforward)
        yy = rede(x)

        # soma perda dos dados calculados
        ls  += mse(yy, y, agg=sum)

        # calcula taxa de acerto (número de respostas corretas)
        # Aqui, "onecold" decodifica o dado do vetor de 0's e 1's para rótulo de '0' a '9'
        acc += sum(onecold(cpu(yy)) .== onecold(cpu(y)))

        # conta dados de treinamento calculados
        num += size(x, 2)
    end

    # retorna média das perdas (risco empírico) e percentual de acertos
    return ls/num, acc/num
end


##########################
# FUNÇÃO PRINCIPAL
##########################
function treinar(; ninter = 32, eta = 4e-1, batchsize = 256, nepochs = 20)

    # PARÂMETROS
    # ninter    : número de neurônios na camada intermediária
    # eta       : taxa de aprendizagem
    # batchsize : tamanho do mini-lote
    # nepochs   : número de épocas

    # carrega base de dados MNIST e cria mini-lotes
    train_loader, test_loader = carrega_dados(batchsize)

    # constrói rede
    # Obs: "cpu" refere-se à execução em CPU normal.
    # Flux suporta processamento por GPU, veja documentação/exemplos.
    rede = constroi_rede(ninter) |> cpu

    # variáveis da rede a serem otimizadas
    wb = Flux.params(rede)


    ##############################################
    ######### Algoritmo para treinamento #########
    ##############################################
    # Descent(η = 0.1)              : gradiente estocástico básico (SGD)
    # Momentum(η = 0.01, ρ = 0.9)   : SGD com momento
    # RMSProp(η = 0.001, ρ = 0.9)
    # ADAM(η = 0.001, β::Tuple = (0.9, 0.999))
    # ADAGrad(η = 0.1)
    # ADADelta(ρ = 0.9)
    #
    # *** Não citados em aula: ***
    # Nesterov(η = 0.001, ρ = 0.9)  : método acelerado de Nesterov
    # RADAM(η = 0.001, β::Tuple = (0.9, 0.999)): Rectified ADAM
    # AdaMax(η = 0.001, β::Tuple = (0.9, 0.999))
    # AMSGrad(η = 0.001, β::Tuple = (0.9, 0.999))
    # NADAM(η = 0.001, β::Tuple = (0.9, 0.999))
    # ADAMW(η = 0.001, β::Tuple = (0.9, 0.999), decay = 0)
    # OADAM(η = 0.0001, β::Tuple = (0.5, 0.9))
    # AdaBelief(η = 0.001, β::Tuple = (0.9, 0.999))
    #
    # Legenda
    #   η: taxa de aprendizagem fixa (SGD) ou "de referência" (veja Adagrad, pg 16 de https://leonardosecchin.github.io/files/topicospo/ML_4-sg.pdf)
    #   ρ: balanço do momento (β da pg 20 de https://leonardosecchin.github.io/files/topicospo/ML_4-sg.pdf)
    #   β: parâmetros de momento (não visto com detalhes em aula)
    # consulte https://fluxml.ai/Flux.jl/stable/training/optimisers/ para detalhes

    opt = Descent(eta)
#     opt = ADAM(eta)

    # medidas para montagem de gráficos
    train_loss_hist = []
    train_acc_hist  = []
    test_loss_hist  = []
    test_acc_hist   = []


    ###############################
    ######### Treinamento #########
    ###############################

    println("Treinando a rede neural...")

    # loop épocas
    for epoch in 1:nepochs

        # percorre os mini-lotes de treinamento (época)
        for (x, y) in train_loader

            # dados de treinamento do mini-lote
            x, y = cpu(x), cpu(y)

            # computa gradiente no ponto wb corrente
            # (backpropagation nos dados do mini-lote atual)
            g = gradient(() -> mse(rede(x), y), wb)

            # realiza uma iteração do método, atualizando pesos e vieses da rede
            Flux.Optimise.update!(opt, wb, g)

        end

        # calcula risco empírico sobre todos os dados de treinamento
        train_loss, train_acc = loss(train_loader, rede)

        # Calcula risco empírico nos dados de teste
        # (somente para impressão na tela).
        # Poderia ser usado para parar prematuramente (dados de validação).
        test_loss,  test_acc  = loss(test_loader, rede)

        # imprimi dados da época
        println()
        println("Época: $epoch")
        println("  Dados treinamento:  risco empir = $train_loss ,  % acertos = $train_acc")
        println("  Dados teste      :  risco empir = $test_loss ,  % acertos = $test_acc")

        # guarda medidas para montagem de gráficos
        append!(train_loss_hist, train_loss)
        append!(train_acc_hist, train_acc)
        append!(test_loss_hist, test_loss)
        append!(test_acc_hist, test_acc)
    end

    # Plota gráficos
    fig_loss = plot(title="Perda", xlabel="épocas", ylabel="", fontfamily="Computer Modern")
    fig_loss = plot!(1:length(train_loss_hist), train_loss_hist, lw=1, label="Dados treinamento (risco empírico)")
    fig_loss = plot!(1:length(test_loss_hist), test_loss_hist, lw=1, label="Dados teste")
    savefig(fig_loss, "fig_loss.pdf")

    fig_acc = plot(title="% acerto", xlabel="épocas", ylabel="% acerto", fontfamily="Computer Modern", legend=:bottomright)
    fig_acc = plot!(1:length(train_acc_hist), train_acc_hist, lw=1, label="Dados treinamento")
    fig_acc = plot!(1:length(test_acc_hist), test_acc_hist, lw=1, label="Dados teste")
    savefig(fig_acc, "fig_acc.pdf")
end
