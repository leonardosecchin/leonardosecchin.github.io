###################################################
# Ilustra a necessidade da condição do ângulo
# Autor: Leonardo D. Secchin
# Data : 05/04/2026
# Execute "teste()"
###################################################

using LinearAlgebra
using Plots
using Printf

function eval_f(x)
    return 0.5*x'*x
end

function eval_gradf(x)
    return x
end

# rotaciona v pelo ângulo θ no sentido anti-horário
function rotate_vec(v, θ)
    s, c = sincos(θ)
    return [c*v[1] + s*v[2]; -s*v[1] + c*v[2]]
end

function teste(; x0 = [1.0;1.0], niter = 100, tam = 500, A = 1.0)
    # inicializa figura
    fig = plot(size=(tam,tam), aspect_ratio=:equal)

    # minimizador
    fig = scatter!([0.0], [0.0], legend=false, markersize=4)

    x = deepcopy(x0)
    f = eval_f(x)
    d = similar(x)
    newx = similar(x)

    println("iter |        f |        t |    ∇f'*d |     ângulo")
    println("--------------------------------------------------")

    for k in 1:niter
        angulo = π/2 - A/k
        d .= rotate_vec(-eval_gradf(x), angulo)
        ∇ftd = eval_gradf(x)'*d

        t = 1.0
        newx .= x .+ d
        newf = eval_f(newx)
        while newf >= f
            t /= 2
            newx .= x .+ t*d
            newf = eval_f(newx)
            if t <= eps()
                break
            end
        end
        x .= newx
        f = newf

        if mod(k,20) == 0
            println("\niter |        f |        t |    ∇f'*d |     ângulo")
            println("--------------------------------------------------")
        end
        @printf("%4d | %8.2e | %8.2e | %8.2e | %.6lf\n", k, f, t, ∇ftd, 180*angulo/π)

        # plota x atual
        fig = scatter!([x[1]], [x[2]], legend=false, color=:black, lw=0, markersize=2)
    end

    # plota "círculo limite"
    r = sqrt(2*f)
    fig = plot!(t -> r*sin(t), t -> r*cos(t), 0, 2π, legend=false, lw=1, color=:red)

    display(fig)
end
