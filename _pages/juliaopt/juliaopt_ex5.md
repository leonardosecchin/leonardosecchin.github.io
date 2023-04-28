---
layout: archive
title: "Julia para Otimização - Exemplo 5"
permalink: /juliaopt_ex5/
author_profile: true
---

[<< voltar para "Julia para Otimização"](/juliaopt/)

## Objetivo: construir gráficos.

Vamos plotar em uma só figura o histórico de $f$ e $\|\nabla f\|_\infty$ para o problema do [Exemplo 1](/juliaopt_ex1). Você precisará do pacote `Plots`.

Salve o arquivo [gradiente2.jl](/files/julia/gradiente2.jl). É a mesma implementação do [Exemplo 4](/juliaopt_ex4), mas com retorno do histórico de execução.

## Método 1 - Gerando gráficos pela linha de comandos do Julia

Carregando `gradiente2.jl` (supondo que esteja no diretório do arquivo):
~~~
julia> include("gradiente2.jl")
~~~

Todos os pacotes necessários ja serão carregados. **Construa a estrutura `nlp` como no [Exemplo 1](/juliaopt_ex1).**

Executando o método a partir do ponto $x_0=(1,1)$ e guardando a saída:
~~~
julia> x, f, gradnorm, iter, status, histf, histgradnorm = gradiente2(nlp, x0=[1;1]);
~~~

Os vetores `histf` e `histgradnorm` contêm o histórico de $f$ e $\|\nabla f\|_\infty$. Você pode imprimi-los na tela se quiser.

Iniciando a figura com o gráfico de $f$:
~~~
julia> fig = plot(histf, label="f");
~~~

Agregando o gráfico de $\|\nabla f\|_\infty$ e configurando títulos:
~~~
julia> fig = plot!(histgradnorm, title="FO e gradiente", xlabel="iter", label="|∇f|");
~~~

*Obs.: você pode agregar quantos plots quiser à mesma figura executando sucessivos `plot!`. Ao executar `plot` (sem exclamação) novamente, Julia limpará a figura.*

Salvando a figura em vários formatos:
~~~
julia> savefig(fig, "figura.png");
julia> savefig(fig, "figura.pdf");
julia> savefig(fig, "figura.svg");
~~~

Observações:

1. *o formato PNG é tipo foto. Já PDF e SVG são formatos vetoriais. PDF pode ser incorporado em textos Latex sem deformação, e SVG pode ser editado utilizando programas como CorelDraw e [Inkscape](https://inkscape.org/).*
1. *este método é preferível quando rodamos vários testes automatizados e queremos salvar figuras ao longo do processo.*
1. *em alguns computadores, a figura é mostrada em janela separada ao executar o comando `plot` sem ponto e vírgula no fim.*


## Método 2 - Saída através do navegador (*notebooks*)

É possível executar comandos Julia através do navegador de internet. Para tanto, você precisará instalar o pacote `IJulia`. A partir da linha de comandos do Julia, podemos entrar no **Jupyter**, uma espécie de ambiente gráfico que funciona pelo navegador:

~~~
julia> using IJulia
julia> notebook()
~~~

Isso abrirá uma página com o Jupyter, e você poderá navegar entre as pastas do seu computador.

Um *notebook* é um "caderno" de comandos em série. Salve o *notebook* [grafico.ipynb](/files/julia/grafico.ipynb), que contém todos os comandos para este exemplo.

Dentro do Jupyter, abra `grafico.ipynb`. Você pode executar os comandos em sequência clicando no botão "Run", ou teclando Ctrl+Enter em cada linha. **Ao executar uma linha, aparecerá "[*]". Isso siginifca que o Julia está processando. Quando o Julia terminar o processamento da linha, aparecerá um número referente à ordem de execução**.

Neste método, o gráfico será mostrado na tela do navegador.

Estude o *notebook* e mude-o como quiser. Você pode retirar o `;` (ponto e vírgula) no final de cada linha para ver a saída do Julia (assim como no ambiente de comandos do Julia).


## Configurando gráficos

O comando `plot` aceita personalização. Por exemplo, para mudar título e texto do eixo $x$:

~~~
julia> fig = plot(histf, label="f", title="Função objetivo", xlabel="iter");
~~~

As opções são separadas por vírgula. Eis algumas delas:

*Textos:*
- **Texto do título:** `title="Texto do título"`
- **Texto dos eixos**: `xlabel="x"`, `ylabel="y"`
- **Texto da legenda:** `label="f"`

*Eixos:*
- **Marcas nos eixos:** `xtick=(0:0.5:10, ["\$ $(i) \$" for i in 0:0.5:10])`, `ytick=-1:0.5:1`
- **Limites nos eixos:** `xlims=(0,10)`, `ylims=(-1,1)`
- **Escala dos eixos:** `xscale/yscale=:identity :log10`
- **Forçar mesma proporção entre eixos:** `aspect_ratio=:equal`

*Fontes:*
- **Tamanho da fonte do título:** `titlefont=font(40)`
- **Tamanho da fonte dos eixos:** `xguidefont=font(30)`, `yguidefont=font(20)` ou `guidefont=font(20)`
- **Tamanho da fonte das marcas:** `xtickfont=font(15)`, `ytickfont=font(20)` ou `tickfont=font(10)`
- **Tamanho da fonte da legenda:** `legendfont=font(12)`
- **Mudar tudo para fonte padrão do Latex:** `fontfamily="Computer Modern"`

*Linhas dos gráficos:*
- **Espessura da linha do gráfico em pixels:** `lw=3`
- **Estilo da linha do gráfico:** `ls=:solid` (padrão) `:dot :dash :auto :dashdot :dashdotdot`
- **Cor da linha do gráfico:** `color=:black :red :blue :yellow :cyan :orange...` ou `color=RGB(.1, .3, 1)`
- **Marcas no gráfico:** `markershape=:none` (padrão) `:auto :circle :rect :star5 :diamond :hexagon :cross :xcross :utriangle :dtriangle :rtriangle :ltriangle :pentagon :heptagon :octagon :star4 :star6 :star7 :star8 :vline :hline :+ :x`
- **Tamanho das marcas do gráfico em pixels:** `markersize=4`

*Outras configurações da legenda:*
- **Posição da legenda:** `legend=:right :left :top :bottom :inside :best :topright :topleft :bottomleft :bottomright`
- **Ocultar legenda:** `leg=false`
- **Cor do fundo da legenda:** `background_color_legend=:[COR]` ou `background_color_legend=:transparent` (fundo transparente)

*Imagem:*
- **Tamanho da imagem em pixels:** `size=(500,400)`
- **Preencher área abaixo do gráfico:** `fill=(0,:orange,0.5)` (altura referência $y=0$, cor laranja, 50% de opacidade)
<!-- - **Margens:** `bottom_margin=5mm`, `left_margin=10mm`, `top_margin=15mm` -->

Há muitas outras opções de personalização. Por exemplo, é possível trabalhar plots aninhados (*subplots*) ou até mesmo fazer figuras animadas. Veja mais exemplos e configurações em
- <https://docs.juliaplots.org/stable/> ou ainda <https://docs.juliaplots.org/stable/generated/supported/>
- [Um tutorial](https://sites.google.com/view/oficinadejuliapetmecanicaufes/gr%C3%A1ficos/gr%C3%A1ficos-bidimensionais?authuser=0)


## Outros comandos interessantes

É possível plotar pontos para funções discretas com o comando `scatter`. Também, o comando `annotate` imprimi textos nas coordenadas indicadas.

Como exemplo, o trecho a seguir
~~~
julia> using Plots, LaTeXStrings
julia> x = -1:0.1:1
julia> y(x) = x^2
julia> fig = plot(x, y, label=L"f(x)=x^2");
julia> fig = scatter!(x, y, label="", fill=(0,:orange,0.5));
julia> fig = annotate!(0, 0.6, L"\textrm{área}=\int_{-1}^1 x^2 \, dx");
julia> savefig(fig, "ex5.png");
~~~
produz a figura abaixo. Note que utilizamos o pacote `LaTeXStrings`, que traduz comandos Latex.

![Exemplo 5](/files/julia/ex5.png)
