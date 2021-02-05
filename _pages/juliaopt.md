---
layout: archive
title: "Julia para Otimização"
permalink: /juliaopt/
author_profile: true
---

Nesta página você encontrará exercícios simples para iniciar a escrita e resolução de problemas de otimização em Julia. Não é um tutorial completo sobre, e poderá ser expandido ao longo do curso. Evidentemente, há muito material na internet que você pode acessar.


# Pré-requisitos

- Antes de fazer os exercícios, leia atentamente o [tutorial de instalação](/julia/) do Julia. **Sugiro se familiarizar com as dicas descritas na seção "Dicas" deste link.**

Pacotes utilizados nos exercícios (alguns necessitam de instalação):
- Escrita dos modelos de otimização: `JuMP`. Documentação completa [aqui](https://jump.dev/JuMP.jl/stable/)
- Modelos de otimização com derivadas automáticas: `NLPModels`, `NLPModelsJuMP`. Como avaliar funções e suas derivadas, veja [este link](https://github.com/JuliaSmoothOptimizers/NLPModels.jl)
- Rotinas de álgebra linear: `LinearAlgebra`
- Armazenamento de matrizes esparsas: `SparseArrays`
- Comando de impressão na tela estilo C: `Printf`
- Plotagem de gráficos: `Plots`


# Exercício 1

**Objetivo:** escrever um modelo simples de otimização irrestrita.

Vamos escrever o problema de duas variáveis

$$
\begin{equation*}
\min_x x_1^2 + x_2^2
\end{equation*}
$$

Carregando pacotes necessários:
~~~
julia> using JuMP, NLPModels, NLPModelsJuMP
~~~

Iniciando o modelo de nome `P`:
~~~
julia> P = Model()
~~~

Criando as variáveis $x_1$ e $x_2$ no modelo `P`:
~~~
julia> @variable(P, x[1:2])
~~~

Definindo a função objetivo em `P` e o sentido de otimização "minimizar":
~~~
julia> @NLobjective(P, Min, x[1]^2 + x[2]^2)
~~~
*Obs: caso a FO for linear, use o comando `@objective`*

Exibindo o modelo `P` construído:
~~~
julia> println(P)
~~~

Transformando o modelo `P` para o formato *NLPModels*:
~~~
julia> nlp = MathOptNLPModel(P)
~~~

O modelo `nlp` está pronto para ser resolvido pelos métodos! A estrutura `nlp` fornece as derivadas de 1a e 2a ordens aos métodos sem a necessidade de calculá-las.


# Exercício 2

**Objetivo:** escrever um modelo de otimização a partir de variáveis do ambiente.

Vamos escrever o modelo

$$
\begin{align*}
\min_x & \, \sum_{i=1}^m (x_i-5)^2 + \sum_{i=1}^{m-1} (x_{i+1} - x_i)^3\\
\text{s.a.} \ & 1\leq x_i\leq 4, \quad i=1,\ldots,m
\end{align*}
$$

onde $m\geq 2$ é uma variável definida no ambiente do Julia. <!--Vamos fixar ainda o ponto inicial $x^0=(1,\ldots,1)$.-->

Definindo um valor para `m` (pode ser qualquer):
~~~
julia> m = 10
~~~

Carregando pacotes necessários:
~~~
julia> using JuMP, NLPModels, NLPModelsJuMP
~~~

Iniciando o modelo:
~~~
julia> P = Model()
~~~

Criando as variáveis $x_1,\ldots,x_m$:
~~~
julia> @variable(P, 1 <= x[1:m] <= 4)
~~~

Definindo a função objetivo:
~~~
julia> @NLobjective(P, Min, sum((x[i]-1)^2 for i in 1:m) + sum((x[i+1]-x[i])^3 for i in 1:m-1) )
~~~

Exibindo o modelo construído (opcional):
~~~
julia> println(P)
~~~

Transformando para o formato *NLPModels*:
~~~
julia> nlp = MathOptNLPModel(P)
~~~

## Outros comandos (antes de usar *MathOptNLPModel*)

- você pode mudar os limitantes de uma variável após ela ser inserida em `P`. Por exemplo, `set_lower_bound(x[5], 2)` faz $x_{5}\geq 2$, enquanto que `set_upper_bound(x[5], 3)` faz $x_5\leq 3$.

- você pode dizer a um método o valor inicial de uma variável. Por exemplo, para setar o valor inicial de $x_1$ como $3.5$, execute `set_start_value(x[1], 3.5)`. Após, verifique isso lendo o valor de $x_1$: `start_value(x[1])`.

- Você pode setar valores iniciais na criação das variáveis. Por exemplo, `@variable(P, 1 <= x[1:m] <= 4, start=1)` criará as $m$ variáveis, todas com valor inicial $1$.



# Exercício 3

**Objetivo:** carregar e executar códigos salvos em arquivos.

Os códigos em Julia, assim como Matlab/Octave, podem ser escritos em arquivos. A extensão padrão é `.jl`.

Para este exercício, salve o arquivo `juliaoptex3.jl` ([link](/files/julia/juliaoptex3.jl)) no diretório que desejar.

Execute o Julia do diretório que escolheu. Se preferir, você pode navegar entre diretórios através de comandos do terminal Linux (veja "Dicas" [aqui](/julia/)), teclando `;` (ponto e vírgula) para abrir um "ambiente de *shell*".

Importe o arquivo para o Julia:
~~~
julia> include("juliaoptex3.jl");
~~~
*Obs.: caso não esteja no diretório do arquivo, você pode incluí-lo passando seu caminho. Por exemplo, `include("dir/juliaoptex3.jl");`.*

No arquivo `juliaoptex3.jl` há duas funções definidas e a variável `a` setada. Você pode executar:
~~~
julia> a
~~~
~~~
julia> msg(123)
~~~
~~~
julia> soma(5,8)
~~~

Você pode definir várias funções, variáveis e objetos em um ou mais arquivos. Você deverá incluir cada arquivo que criar. **Abra o arquivo `juliaoptex3.jl` e veja como ele foi feito.**



# Exercício 4

**Objetivo:** implementar um método simples de gradiente.

Salve o arquivo [gradiente.jl](/files/julia/gradiente.jl). Ele contém uma implementação simples do método do gradiente descrito no slide 29 [deste link](/files/otim1/4.1.Metodos_descida_gerais.pdf). Sugiro que reveja o método e acompanhe o código.

Após estudar e ler as instruções de execução no código, faça:
- Resolva o problema do Exercício 1 partindo do ponto inicial $x_0=(1,1)$;
- Resolva o problema do Exercício 2 ignorando os limitantes das variáveis;
- Modifique o código para implementar a interpolação quadrática, como descrito nos slides 11 a 13 [deste link](/files/otim1/4.1.Metodos_descida_gerais.pdf). Compare os métodos.



# Exercício 5

**Objetivo:** construir gráficos.

Vamos plotar em uma só figura o histórico de $f$ e $\|\nabla f\|_\infty$ para o problema do Exemplo 1. Você precisará do pacote `Plots`.

Salve o arquivo [gradiente2.jl](/files/julia/gradiente2.jl). É a mesma implementação do Exemplo 4, mas com retorno do histórico de execução.

## Método 1 - Gerando gráficos pela linha de comandos do Julia

Carregando `gradiente2.jl` (supondo que esteja no diretório do arquivo):
~~~
julia> include("gradiente2.jl")
~~~

Todos os pacotes necessários ja serão carregados. **Construa a estrutura `nlp` como no Exemplo 1.**

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
julia> using IJulia;
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
- [https://docs.juliaplots.org/latest/](https://docs.juliaplots.org/latest/)
- [Um tutorial](https://sites.google.com/view/oficinadejuliapetmecanicaufes/gr%C3%A1ficos/gr%C3%A1ficos-bidimensionais?authuser=0)




# Exercício 6

**Objetivo:** escrever um modelo de otimização com restrições.

Considere o problema com restrições

$$
\begin{align*}
\min_x \, & (x_1-2)^2 + (x_2-1)^2\\
\text{s.a. } & x_1 + x_2 - 2\leq 0\\
&x_1^2-x_2\leq 0
\end{align*}
$$

*Este problema pode ser encontrado no livro de Karas e Ribeiro, ou no slide 2 [deste link](/files/otim1/5.Otimizacao_com_restricoes-KKT.pdf).*

Siga as instruções do Exemplo 1 para criar o modelo, variáveis e função objetivo.

**Antes de criar a estrutura `MathOptNLPModel`**, você deve adicionar as restrições ao modelo `P`.

Adicionando a restrição linear:
~~~
julia> @constraint(P, x[1] + x[2] - 2 <= 0)
~~~

Adicionando a restrição não linear:
~~~
julia> @NLconstraint(P, x[1]^2 - x[2] <= 0)
~~~

Exibindo o modelo construído e transformando-o para *NLPModels*:
~~~
julia> println(P)
~~~
~~~
julia> nlp = MathOptNLPModel(P)
~~~



# Exercício 7

**Objetivo:** resolver modelos de otimização restrita e irrestrita por métodos disponíveis.

Em breve.


# Exercício 8

**Objetivo:** acessar bibliotecas de problemas-teste usadas na literatura.

Bibliotecas de problemas para testes estão disponíveis, e são comumente utilizadas na pesquisa. A seguir, listo duas das principais fontes de problemas: arquivos `.SIF` (CUTEst) e `.nl`.

## CUTEst - Constrained and Unconstrained Testing Environment with safe threads

Esta é a principal bilbioteca para testes com problemas gerais. Ela reúne mais de 1300 problemas, entre lineares e não lineares, restritos e irrestritos. Cada problema é composto por um arquivo `.SIF`. A coleção completa dos problemas pode ser obtida pelo repositório https://bitbucket.org/optrove/sif. No GNU/linux, basta executar o seguinte comando de dentro da pasta que deseja guardar os problemas:

~~~
git clone https://bitbucket.org/optrove/sif ./mastsif
~~~

Isso criará a pasta `mastsif` contendo os arquivos `.SIF`.

*ALERTA: a biblioteca completa tem mais de 2Gb!*

**Outras (sub-)bibliotecas menores (cerca de 230Mb):**

- Problemas convexos de Maros & Meszaros:
  ~~~
  git clone https://bitbucket.org/optrove/maros-meszaros ./marosmeszaros
  ~~~
- Problemas lineares (PL's) da Netlib: descompacte o arquivo [deste link](ftp://ftp.numerical.rl.ac.uk/pub/cutest/netlib.tar.gz).

### *INTERFACE* JULIA PARA ARQUIVOS .SIF

No Julia, é possível ler arquivos `.SIF` com o pacote `CUTEst`. A [página oficial](https://github.com/JuliaSmoothOptimizers/CUTEst.jl) do pacote traz instruções de uso. As características de cada problema podem ser encontradas [neste link](http://www.cuter.rl.ac.uk/Problems/mastsif.shtml).

Como exemplo, vamos ler o problema irrestrito `SPARSQUR`. A estrutura `NLPmodels` (a mesma dos exemplos anteriores) é criada diretamente do arquivo `.SIF`:

~~~
julia> using CUTEst
julia> nlp = CUTEstModel("[diretorio dos arquivos SIF]/SPARSQUR");
~~~

Podemos assim resolver o modelo com nossa implementação do gradiente (veja Exemplo 4):

~~~
julia> include("[diretorio]/gradiente.jl");
julia> gradiente(nlp);
~~~

Para ler outro problema da CUTEst, é necessário finalizar a instância ativa:

~~~
julia> finalize(nlp);
julia> nlp = CUTEstModel("[diretorio dos arquivos SIF]/[outro problema]");
~~~

Isso é útil quando queremos resolver vários problemas em série.

## Problemas no formato aberto .nl

É comum que modelos de otimização sejam disponibilizados em um formato livre com extensão `.nl`. No Julia, há dois pacotes para manipulação desse tipo de arquivo:
- **`AmplNLReader`:** Lê arquivos `.nl` ([link oficial](https://github.com/JuliaSmoothOptimizers/AmplNLReader.jl))
- **`AmplNLWriter`:** Escreve arquivos `.nl` a partir de estruturas `JuMP` ([link oficial](https://github.com/jump-dev/AmplNLWriter.jl))

Exemplos:

--- EM BREVE ---

## A linguagem de modelagem AMPL

Uma linguagem de modelagem muito utilizada é o [AMPL](https://ampl.com/). Na verdade, AMPL é um ambiente de otimização, traz consigo alguns resolvedores. No entanto, o AMPL **não é *software* livre**. É necessária uma licença do *software* para usufruir de todas as funcionalidades. Uma versão demonstração limitada está disponível no [site do desenvolvedor](https://ampl.com/).

É possível exportar os modelos AMPL para o formato livre `.nl`. Veja a [documentação](https://ampl.com/resources/the-ampl-book/chapter-downloads/) oficial.

## Outras fontes

O pacote `OptimizationProblems` contém alguns problemas irrestritos, muitos deles presentes na CUTEst. Os problemas vêm na estrutura `JuMP`, e você precisará convertê-los para `NLPmodels` a fim de usufruir de derivadas automáticas (veja Exemplo 1). Acesse a [página oficial](https://github.com/JuliaSmoothOptimizers/OptimizationProblems.jl) do pacote para instruções de uso.




# Exercício 9

**Objetivo:** gravar arquivos de texto, tabelar resultados.

Em breve.
