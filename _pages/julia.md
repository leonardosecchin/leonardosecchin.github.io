---
layout: archive
title: "A linguagem de programação Julia"
permalink: /julia/
author_profile: true
---

Julia é uma linguagem de programação de alto nível surgida em 2012, que implementa várias ferramentas para uso geral em matemática aplicada. É muito parecida com o Matlab. Em particular, Julia possui várias ferramentas para otimização, tais como:

- Escrita de modelos gerais de otimização de forma amigável, sem a necessidade de implementar derivadas à mão;

- Interfaces de fácil uso para métodos sofisticados de otimização implementados em C/C++/Fortran;

- Interfaces de fácil uso para as principais bibliotecas de problemas-teste usadas na literatura;

- Escrita fácil e rápida de códigos, como no Matlab/Octave;

- Ferramentas diversas para manipulação eficiente de matrizes (esparsas, inclusive), bem como rotinas usuais de Álgebra Linear (parecido com o Matlab). Em particular, Julia trabalha com Hessianas esparsas.

Dentre as vantagens do Julia sobre o Matlab, destacam-se:
- Julia é *software* livre, pode ser instalado e utilizado sem custo (respeitando as condições da licença do MIT);

- A comunidade acadêmica cada vez mais usa Julia (pelo menos os pesquisadores de otimização não linear). Isso torna vivo o desenvolvimento de novos códigos/interfaces para métodos e bibliotecas;

- Ao mesmo tempo que Julia oferece uma linguagem amigável como o Matlab/Octave, ao contrário destes, Julia compila os códigos (Matlab/Octave são linguagens interpretadas). Isso faz uma enorme diferença no desempenho. No Julia, laços podem ser feitos sem grandes problemas, enquanto que no Matlab eles devem ser evitados sempre que possível pois tornam a execução muito lenta;

- Julia possui um sistema de pacotes similar ao de distruibuições GNU/Linux como o Ubuntu e o Mint. Portanto, a instalação de um novo pacote é feita diretamente da internet dentro do Julia, sem complicações. O sistema de pacotes do Julia também atualiza os pacotes com as últimas versões dos desenvolvedores (como no Ubuntu ou Mint);

- Julia possui desempenho geral muitas vezes similar à linguagens de baixo nível como C e Fortran, e superior ao Matlab e sobretudo ao Octave. Ou seja, Julia combina a facilidade do Matlab e o desempenho de linguagens de baixo nível.

Para saber mais sobre o Julia, consulte o [Wikipedia](https://en.wikipedia.org/wiki/Julia_(programming_language)).


# Passo a passo para instalação do Julia em sua máquina

## Método 1: Pacotes pré-compilados (mais fácil)

1. Baixe a última **versão estável** para seu sistema em [https://julialang.org/downloads](https://julialang.org/downloads)
1. Siga as instruções de instalação

Após a instalação, o Julia estará pronto para uso. Você pode executá-lo via terminal:
~~~
julia
~~~

## Método 2: Compilar do código-fonte (para *experts* no GNU/Linux)

1. Clone o repositório Git [https://github.com/JuliaLang/julia](https://github.com/JuliaLang/julia) executando no terminal, a partir de sua pasta de preferência (por exemplo, sua pasta pessoal),
~~~
git clone https://github.com/JuliaLang/julia.git
~~~

1. Entre no diretório criado:
~~~
cd julia
~~~

1. Neste repositório há versões do Julia ainda em teste. Recomendo instalar a última **versão estável**. Para isso, acesse [https://julialang.org/downloads](https://julialang.org/downloads) e veja qual a versão corrente na seção "releases" no lado direito. No momento da escrita deste tutorial, a última versão estável é a 1.5.3. Aponte a versão executando
~~~
git checkout v1.5.3
~~~

1. Compile o Julia executando
~~~
make
~~~

Após o término, sua instalação do Julia estará pronta para uso. Você pode executá-lo de dentro do diretório `julia`:
~~~
./julia
~~~

Você também pode criar um atalho no seu `.bashrc` ou `.profile`. Para desinstalar o Julia neste método, simplesmente apague os diretórios `julia` e `.julia`.


## Recomendações

Não aconselho usar o Julia do repositório do GNU/Linux, a versão geralmente é defasada. Além disso, alguns pacotes podem não funcionar.


# Iniciando o uso do Julia

Julia é executado pelo terminal de comandos (para usuários Windows, recomendo instalar um terminal de comandos melhor que o disponível junto ao Windows).

- No terminal, execute `julia` (ou `./julia` do diretório da instalação). Isso entrará no ambiante Julia. Se tudo der certo, você verá o logotipo do Julia, a versão instalada e uma linha pronta para receber comandos:
~~~
julia>
~~~

- Neste estágio, você pode executar comandos no Julia. Por exemplo, multiplicar duas matrizes:
~~~
julia> A=[1 2; 3 4]  
 2×2 Array{Int64,2}:  
 1  2  
 3  4
~~~
~~~
julia> B=[5 6; 7 8]  
2×2 Array{Int64,2}:  
 5  6  
 7  8
~~~
~~~
julia> A*B  
2×2 Array{Int64,2}:  
 19  22  
 43  50
~~~

**Observação: o Julia compilará códigos na primeira vez em que os comandos forem executados. Nas rodadas seguintes a execução é rápida.**


## Instalação de pacotes

As ferramentas de otimização de nosso interesse vêm na forma de pacotes. Primeiro você deve instalar os pacotes dentro do Julia:

- No ambiente Julia, digite `]` (colchete direito). Isso abrirá o "ambiente de pacotes":
~~~
(@v1.x) pkg>
~~~

- Antes de começar a adicionar pacotes, recomendo atualizar a lista deles ao menos uma vez:
~~~
(@v1.x) pkg> up
~~~
Isso também irá atualizar as versões dos pacotes existentes, e pode ser feito sempre que desejar.

- Para adicionar pacotes, use `add [pacote]`. Por exemplo, para adicionar o pacote `JuMP` (pacote para modelagem de problemas de otimização), execute:
~~~
(@v1.x) pkg> add JuMP
~~~

  **Observações:**
  - Julia diferencia maiúsculas de minúsculas. Assim, `add jump` não irá funcionar!
  - A instalação de um pacote é feita uma única vez, ele ficará para sempre disponível.

- Após instalar seus pacotes, você pode voltar ao ambiente de comandos Julia teclando "backspace".


## Usando pacotes instalados

Assim como no Matlab, um pacote Julia precisa ser carregado para uso, sempre que o Julia é aberto. Dentro do ambiente Julia, execute
~~~
julia> using JuMP
~~~

Isso carregará o pacote `JuMP` na memória e suas funções internas ficarão disponíveis para uso.

**Importante: o Julia compilará o pacote na primeira vez em que for carregado. Isso leva um tempo, mas é feito uma única vez.**


<!--## Ambiente gráfico para Julia

Existem plataformas (IDEs) gráficas que se integram ao Julia. Uma delas é o [Juno](https://junolab.org/).-->


# Dicas

- O terminal de comandos do Julia comporta-se como o Linux. Você pode começar a digitar um comando e teclar `TAB --> TAB` que verá as terminações possíveis. Isso dá agilidade e ajuda a lembrar dos comandos.

- O Julia possui ajuda para comandos dentro de seu ambiente. Para alternar para o "ambiente de ajuda", digite `?` (sinal de interrogação). A Linha de comandos tornará
~~~
help?>
~~~
Basta digitar o comando e teclar Enter. A função `TAB --> TAB` funciona no ambiente de ajuda também.

- É possível alternar entre o terminal do Julia e o terminal do Linux (caso esteja usando Linux) teclando `;` (ponto e vírgula). Isso é bom para navegar entre diretórios sem sair do Julia (e assim não perder os objetos na memória), bem como executar comandos a nível de Linux (*shell*) caso queira. Comandos úteis do terminal Linux para diretórios:
  - `pwd`: imprimi o diretório atual
  - `cd [diretorio]`: muda de diretório. Aceita diretórios relativos, tais como `../dir1` (`dir1` no diretório pai), ou `dir1/dir2` (subdiretórios na pasta atual).
  - O comando `cd [TAB --> TAB]` funciona e é útil para listar os diretórios da pasta atual e autocompletar nomes parcialmente digitados.

- Para excluir objetos da memória na mesma sessão do Julia, basta setá-los como `nothing`. Por exemplo, se `P` foi definido e quer limpá-lo, execute
~~~
julia> P = nothing
~~~

- Para sair do Julia, execute `exit()` ou tecle **Ctrl+d**. Isso apagará da memória todos os objetos criados.


# Uso do Julia em otimização - primeiros passos

[Neste link](/juliaopt/) você encontra dicas e exercícios para os primeiros passos na escrita e resolução de problemas de otimização com o Julia.


# Links úteis sobre Julia

- Sítio oficial da linguagem: <https://julialang.org>
- Julia no GitHub: <https://github.com/JuliaLang/julia>
- Lista de pacotes: <https://julialang.org/packages>
- Documentação oficial: <https://docs.julialang.org>
- *ThinkJulia* - Documentação completa em português: <https://juliaintro.github.io/JuliaIntroBR.jl>
<!--- [Tutorial, Prof. Leandro Martínez (Unicamp)](http://m3g.iqm.unicamp.br/main/didatico/simulacoes/tutorial-Julia.pdf)-->
