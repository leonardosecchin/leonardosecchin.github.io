using JuMP, NLPModels, NLPModelsJuMP

P = Model()

@variable(P, x[1:2], start=1)

@NLobjective(P, Min, x[1]^2 + x[2]^2)

nlp = MathOptNLPModel(P)