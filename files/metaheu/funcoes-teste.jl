###################################################
# FUNÇÕES DE TESTE
#
# Autor: Leonardo D. Secchin
# Data : 09/05/2023
# leonardosecchin.github.io/metaheuristicas/
#
# Exemplos de uso:
#   f["sphere"](ones(10))
#
#   funcao = "quartic"
#   f[funcao]([1.0;2.0;3.0])
###################################################

using Random, Distributions

f = Dict();

l = Dict();
u = Dict();

f["sphere"] = x::Vector -> x'*x;
l["sphere"] = -5.12;
u["sphere"] =  5.12;

f["rosenbrock"] = x::Vector -> sum( 100.0*(x[i+1] - x[i]^2)^2 + (1.0 - x[i])^2 for i = 1:(length(x)-1) );
l["rosenbrock"] = -2.048;
u["rosenbrock"] =  2.048;

f["step"] = x::Vector -> sum( floor.(x) );
l["step"] = -5.12;
u["step"] =  5.12;

f["quartic"] = x::Vector -> sum(i*x[i]^4 + rand(Normal()) for i = 1:length(x));
l["quartic"] = -1.28;
u["quartic"] =  1.28;

f["rastrigin"] = x::Vector -> sum(x[i]^2 - 10.0*cos(2.0*pi*x[i]) + 10.0 for i = 1:length(x));
l["rastrigin"] = -5.12;
u["rastrigin"] =  5.12;

f["ackley"] = x::Vector -> -20.0*exp(-0.2*sqrt(x'*x/length(x))) - exp(sum(cos(2.0*pi*x[i]) for i = 1:length(x))/length(x)) + 20.0 + exp(1.0);
l["ackley"] = -32768;
u["ackley"] =  32768;

f["ellipsoid"] = x::Vector -> sum( sum(x[1:i])^2 for i = 1:length(x));
l["ellipsoid"] = -65536;
u["ellipsoid"] =  65536;

f["griewangk"] = x::Vector -> x'*x/4000.0 - prod(cos(x[i]/sqrt(i)) for i = 1:length(x)) + 1.0;
l["griewangk"] = -400;
u["griewangk"] =  400;
