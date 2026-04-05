###################################################
# Autor: Leonardo D. Secchin
# Data : 05/04/2026
# Execute "ordem_conv()"
###################################################

using Printf
using DataFrames
using Plots

linear(e, k; r=0.5) = r^k * e
superlinear(e, k) = begin
    ek = e
    for i = 1:k
        ek /= k + 2
    end
    return ek
end
quadratica(e, k; c=1.0) = begin
    ek = e
    for i = 1:k
        ek = c * ek^2
    end
    return ek
end

function ordem_conv(; maxit = 9, e = 0.9)
    d = DataFrame("Linear" => Float64[], "Superlinear" => Float64[], "Quadrática" => Float64[])
    for k = 0:maxit
        push!(d, (linear(e,k), superlinear(e,k), quadratica(e,k)))
    end
    fig = plot(0:maxit, d[:,1], label="Linear", yscale=:log10)
    fig = plot!(0:maxit, d[:,2], label="Superlinear", yscale=:log10)
    fig = plot!(0:maxit, d[:,3], label="Quadrática", yscale=:log10)
    Plots.savefig(fig, "ordem_conv.pdf")
    display(d)
end