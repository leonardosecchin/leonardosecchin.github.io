#####################################
# Plota instâncias da TSPLIB
#
# tsp é uma instância da TSPLIB.
# Por exemplo, para carregar a instância "berlin52", execute
#    using TSPLIB
#    tsp = readTSPLIB(:berlin52)
#
# sol é uma permutação das cidades 1, 2, ..., tsp.dimension
#
# Plotar a solução ordenada 1,2,... :
#    tspplot(tsp, 1:tsp.dimension)
#
# Autor: Leonardo D. Secchin, 23/03/23
#####################################

using Plots

function tspplot(tsp, sol)
    # número de cidades
    n = tsp.dimension

    # tamanho da imagem
    xmin = minimum(tsp.nodes[:,1])
    xmax = maximum(tsp.nodes[:,1])
    ymin = minimum(tsp.nodes[:,2])
    ymax = maximum(tsp.nodes[:,2])

    # adiciona 5% de folga nas lateriais
    folga = 0.05*max( xmax-xmin, ymax-ymin )

    fig = plot(title=tsp.name, xlims=(xmin-folga,xmax+folga), ylims=(ymin-folga,ymax+folga), aspect_ratio=:equal, leg=false)

    # plota cidades
    for i = 1:n
        fig = scatter!([tsp.nodes[i,1]], [tsp.nodes[i,2]], color="red", mark=:o, markersize=3)
    end

    # plota solução
    for i = 1:(n-1)
        fig = plot!( [tsp.nodes[sol[i],1], tsp.nodes[sol[i+1],1]], [tsp.nodes[sol[i],2], tsp.nodes[sol[i+1],2]], color="black", lw=0.5)
    end
    # plot o segmento entre a última cidade e a primeira
    fig = plot!( [tsp.nodes[sol[n],1], tsp.nodes[sol[1],1]], [tsp.nodes[sol[n],2], tsp.nodes[sol[1],2]], color="black", lw=0.5)

    display(fig)
end