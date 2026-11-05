# Exemplo resolvido com WORHP

using JuMP, AmplNLWriter

P = Model(() -> AmplNLWriter.Optimizer("worhp_ampl"))

@variable(P, x[1:2])

@NLobjective(P, Min, (x[1] - 2.0)^2 + (x[2] - 1.0)^2)

@constraint(P, x[1] + x[2] - 2 <= 0)

@NLconstraint(P, x[1]^2 - x[2] <= 0)

optimize!(P)