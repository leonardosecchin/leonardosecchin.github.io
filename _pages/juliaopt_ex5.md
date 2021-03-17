---
layout: archive
title: "Julia para Otimização - Exercício 5"
permalink: /juliaopt_ex5/
author_profile: true
---

## Objetivo: construir gráficos.

Vamos plotar em uma só figura o histórico de $f$ e $\|\nabla f\|_\infty$ para o problema do [Exercício 1](/juliaopt_ex1). Você precisará do pacote `Plots`.

Salve o arquivo [gradiente2.jl](/files/julia/gradiente2.jl). É a mesma implementação do [Exercício 4](/juliaopt_ex4), mas com retorno do histórico de execução.

## Método 1 - Gerando gráficos pela linha de comandos do Julia

Carregando `gradiente2.jl` (supondo que esteja no diretório do arquivo):
~~~
julia> include("gradiente2.jl")
~~~

Todos os pacotes necessários ja serão carregados. **Construa a estrutura `nlp` como no [Exercício 1](/juliaopt_ex1).**

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
<!--1. *você pode querer tentar gerar figuras diretamente para códigos Latex com o pacote [PGFPlots](https://github.com/JuliaTeX/PGFPlots.jl) (atenção: esse pacote possui várias dependências, e pode levar muito tempo para instalar...).*-->


## Método 2 - Saída através do navegador (*notebooks*)

É possível executar comandos Julia através do navegador de internet. Para tanto, você precisará instalar o pacote `IJulia`. A partir da linha de comandos do Julia, podemos entrar no **Jupyter**, uma espécie de ambiente gráfico que funciona pelo navegador:

~~~
julia> using IJulia
julia> notebook()
~~~

Isso abrirá uma página com o Jupyter, e você poderá navegar entre as pastas do seu computador.

Um *notebook* é um "caderno" de comandos em série. Salve o *notebook* [grafico.ipynb](/files/julia/grafico.ipynb), que contém todos os comandos para este exercício.

Dentro do Jupyter, abra `grafico.ipynb`. Você pode executar os comandos em sequência clicando no botão "Run", ou teclando Ctrl+Enter em cada linha. **Ao executar uma linha, aparecerá "[*]". Isso siginifca que o Julia está processando. Quando o Julia terminar o processamento da linha, aparecerá um número referente à ordem de execução**.

Este método garante que o gráfico será mostrado na tela do navegador.

Estude o *notebook* e mude-o como quiser. Você pode retirar o `;` (ponto e vírgula) no final de cada linha para ver a saída do Julia (assim como no ambiente de comandos do Julia).


## Configurando gráficos

O comando `plot` aceita personalização. Por exemplo, para mudar título e texto do eixo $x$:

~~~
julia> fig = plot(histf,label="f", title="Função objetivo", xlabel="iter");
~~~

As opções são separadas por vírgula. Eis algumas delas:

- **Texto do título:** `title="Texto"`
- **Tamanho da fonte do título:** `titlefont=font(40)`
- **Texto dos eixos**: `xlabel="x"`, `ylabel="y"`
- **Tamanho da fonte dos eixos:** `xguidefont=font(30)`, `yguidefont=font(20)` ou `guidefont=font(20)`
- **Texto da legenda:** `label="f"`
- **Tamanho da fonte da legenda:** `legendfont=font(12)`
- **Marcas nos eixos:** `xtick=(0:0.5:10, ["\$ $(i) \$" for i in 0:0.5:10])`, `ytick=-1:0.5:1`
- **Tamanho da fonte das marcas:** `xtickfont=font(15)`, `ytickfont=font(20)` ou `tickfont=font(10)`
- **Limites nos eixos:** `xlims=(0,10)`, `ylims=(-1,1)`
- **Tamanho da imagem em pixels:** `size=(500,400)`
- **Espessura da linha do gráfico em pixels:** `lw=5`
- **Estilo da linha do gráfico:** `ls=:dot/:dash/:auto/:dashdot/:dashdotdot/:solid`
- **Cor da linha do gráfico:** `color="black/red/blue/yellow/cyan/orange..."` ou `color=RGB(.1, .3, 1)`
- **Escala logarítmica no eixo $y$:** `yscale=:log10`
- **Ocultar legenda:** `leg=false`
- **Preencher área abaixo do gráfico:** `fill=(0,:orange,0.5)` (altura referência $y=0$, cor laranja, 50% de opacidade)
- **Margens:** `bottom_margin=5mm`, `left_margin=10mm`, `top_margin=15mm`
- **Forçar mesma proporção entre eixos:** `aspect_ratio=:equal`

É possível trabalhar plots aninhados (*subplots*) ou até mesmo fazer figuras animadas. Mais exemplos e configurações:
- <https://docs.juliaplots.org/latest/>
- [Um tutorial](https://sites.google.com/view/oficinadejuliapetmecanicaufes/gr%C3%A1ficos/gr%C3%A1ficos-bidimensionais?authuser=0)
