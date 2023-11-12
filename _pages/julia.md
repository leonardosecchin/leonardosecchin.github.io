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
- Julia é *software* livre, pode ser instalado e utilizado sem custo, respeitando as condições da licença do MIT;

- A comunidade acadêmica cada vez mais usa Julia, pelo menos os pesquisadores de otimização não linear. Isso torna vivo o desenvolvimento de novos códigos/interfaces para métodos e bibliotecas;

- Ao mesmo tempo que Julia oferece uma linguagem amigável como o Matlab/Octave, ao contrário destes, Julia compila os códigos (Matlab/Octave são linguagens interpretadas). Isso faz uma enorme diferença no desempenho. No Julia, laços podem ser feitos sem grandes problemas, enquanto que no Matlab eles devem ser evitados sempre que possível pois tornam a execução muito lenta;

- Julia possui um sistema de pacotes similar ao de distruibuições GNU/Linux como o Ubuntu e o Mint. Portanto, a instalação de um novo pacote é feita diretamente da internet dentro do Julia, sem complicações. O sistema de pacotes do Julia também atualiza os pacotes com as últimas versões dos desenvolvedores, como no Ubuntu ou Mint;

- Julia possui desempenho geral muitas vezes similar à linguagens de baixo nível como C e Fortran, e superior ao Matlab e sobretudo ao Octave. Ou seja, Julia combina a facilidade do Matlab e o desempenho de linguagens de baixo nível.

Para saber mais sobre o Julia, consulte o [Wikipedia](https://en.wikipedia.org/wiki/Julia_(programming_language)).


# Instalando o Julia em sua máquina


## Método 1: Loja de aplicativos (versões novas do GNU/Linux Ubuntu)

É possível encontrar o Julia na loja de aplicativos do Ubuntu (*Ubuntu Software*). As versões recentes do Ubuntu trazem versões atualizadas do Julia. Dentro da loja, procure por "Julia", escolha a fonte "Snap Store" e certifique-se que a versão selecionada é a estável (atualize a lista de softwares da loja antes). Caso não encontre versões atualizadas, recomenda-se outros métodos. O Julia pode estar dispoinível em lojas de aplicativos de outras distrubuições Linux.

Atualizações do Julia são gerenciadas pelo próprio sistema operacional.


## Método 2: Gerenciador Juliaup

`Juliaup` é um instalador do Julia com gerenciamento de versões. Funciona em Mac, Windows e Linux. Acesse [este link](https://github.com/JuliaLang/juliaup) para detalhes.

Este método é interessante para usuários do Windows. Em versões recentes do Windows, é encontrado na loja de aplicativos do sistema. Veja [este link](https://apps.microsoft.com/detail/9NJNWW8PVKMN?rtc=1&hl=pt-br&gl=BR).

Atualizações do Julia são gerenciadas pelo `Juliaup`.


## Método 3: Pacotes pré-compilados

**ATENÇÃO: neste método, não há atualização automática do Julia.**

1. Baixe a última **versão estável** para seu sistema em <https://julialang.org/downloads>
1. Siga as instruções de instalação

Após a instalação, o Julia estará pronto para uso. Você pode executá-lo via terminal:
~~~
julia
~~~

**Para auxiliá-lo na instalação do Julia pré-compilado + pré-requisitos + pacotes utilizados nas disciplinas de otimização, baixe [ESTE SCRIPT](/files/julia/instalar_julia) e siga as instruções contidas nele (testado no Ubuntu 22.04)**


## Método 4: Compilar do código fonte

É possível compilar o Julia a partir de seu código fonte, disponível em <https://github.com/JuliaLang/julia.git>.

<!-- **ATENÇÃO: este método é mais complicado e só é indicado caso queira instalar versões do Julia ainda em teste! Na maioria das vezes, não será será o seu caso!** -->

<!-- **Versões de teste trazem as últimas atualizações do Julia, que ainda não receberam o certificado de estabilidade. Por isso, podem apresentar mal funcionamento. Caso pretenda usar versões estáveis do Julia, recomenda-se os métodos anteriores.** -->

<!--1. Clone o repositório Git <https://github.com/JuliaLang/julia> executando no terminal, a partir de sua pasta de preferência (por exemplo, sua pasta pessoal),
~~~
git clone https://github.com/JuliaLang/julia.git
~~~

1. Entre no diretório criado:
~~~
cd julia
~~~

1. Neste repositório há versões do Julia ainda em teste. Aponte a versão desejada executando
~~~
git checkout v1.x.x
~~~

1. Instale pré-requisitos no seu sistema. Para usuários do Ubuntu ou Mint, execute
~~~
sudo apt update
sudo apt install gfortran g++ libopenblas-dev
~~~
Isso instalará os pacotes `gfortran`, `g++` e `libopenblas-dev` no seu sistema. Os pacotes `gfortran` e `g++` são compiladores das linguagens Fortran e C++, e `libopenblas-dev` é uma implementação das rotinas de álgebra linear de alto desempenho BLAS, necessárias para alguns pacotes do Julia.

*Obs: para cada comando `sudo` será requerida a senha do usuário. Você pode instalar os pacotes em seu sistema a partir do usuário administrador `root` se preferir.*

1. Compile o Julia executando
~~~
make
~~~
*Obs: caso seu sistema não possua os pacotes necessários instalados, a compilação será interrompida com um aviso da falta do pacote de sistema. Nesse caso, instale o pacote requerido e volte a executar make. Repita o processo até sanar todos os erros.*

Se a compilação terminou sem erros, sua instalação do Julia estará pronta para uso. Você pode executá-lo de dentro do diretório `julia`:
~~~
./julia
~~~

Você também pode criar um atalho no seu `.bashrc` para que, executando `julia` de qualquer pasta, entre no Julia que acabou de instalar. Para tanto, edite o arquivo `.bashrc` (peça para exibir arquivos ocultos no seu gerenciador de arquivos) inserindo a linha
~~~
alias julia="[DIRETORIO DA INSTALACAO JULIA]/./julia"
~~~

Para desinstalar o Julia neste método, simplesmente apague os diretórios `julia` e `.julia`.-->


## Julia com ambiente gráfico

Existem plataformas (IDEs) gráficas que se integram ao Julia. Exemplos são o [Visual Studio](https://code.visualstudio.com/) e o [Juno](https://junolab.org/).

É possível ainda utilizar seu navegador de internet como saída gráfica através do [Jupyter ou JupyterLab](https://jupyter.org/).

Uma alternativa interessante é o pacote [Pluto](https://plutojl.org/). Este pacote abre um ambiente gráfico no navegador de internet com recursos interessantes. Para utilizá-lo, instale o pacote ``Pluto.jl`` no seu Julia (veja seção abaixo) e execute ``using Pluto; Pluto.run()`` do terminal do Julia.

De qualquer forma, assim como no Matlab/Octave, a principal via de utilização do Julia é a linha de comandos. Portanto é essencial familiarizar-se com seus comandos.


# Iniciando o uso do Julia

O Julia "padrão", sem interface gráfica, é executado pelo terminal de comandos do sistema. Para usuários Windows, recomendo usar um terminal de comandos melhor que o `cmd`. Por exemplo, *Powershell* (já presente no Windows 10) ou [cmder](https://cmder.net/).

- No terminal do sistema, execute `julia` (ou `./julia` do diretório da instalação). Isso entrará no ambiante Julia. Se tudo der certo, você verá o logotipo do Julia, a versão instalada e uma linha pronta para receber comandos:
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


## Instalando/atualizando pacotes

As ferramentas de otimização e muitas outras vêm na forma de pacotes. Primeiro você deve instalar os pacotes dentro do Julia:

- No ambiente Julia, digite `]` (colchete direito). Isso abrirá o "ambiente de pacotes":
~~~
(@v1.x) pkg>
~~~

- Para adicionar pacotes, use `add [pacote]`. Por exemplo, para adicionar o pacote `JuMP` (pacote para modelagem de problemas de otimização) execute:
~~~
(@v1.x) pkg> add JuMP
~~~

  **Observações:**
  - Julia diferencia maiúsculas de minúsculas. Assim, `add jump` não irá funcionar!
  - A instalação de um pacote é feita uma única vez, ficando para sempre disponível.

- Após instalar seus pacotes, você pode voltar ao ambiente de comandos Julia teclando "backspace".

O Julia gerencia pacotes de maneira similar à distrubuições GNU/Linux como Ubuntu e Mint. Você pode atualizar os pacotes instalados executando
~~~
julia: ]up
~~~


## Usando pacotes instalados

Assim como no Matlab, um pacote Julia precisa ser carregado para uso sempre que o Julia for aberto. Dentro do ambiente Julia, execute
~~~
julia> using JuMP
~~~

Isso carregará o pacote `JuMP` na memória e suas funções internas ficarão disponíveis para uso.

**Importante: nas versões até 1.5.x, o Julia compilará o pacote na primeira vez em que for carregado. Isso leva um tempo, mas é feito uma única vez. A partir da versão 1.6.x, a compilação é feita no momento da instalação do pacote.**


# Dicas

- O terminal de comandos do Julia comporta-se como o GNU/Linux. Você pode começar a digitar um comando e teclar `TAB --> TAB` que verá as terminações possíveis. Isso dá agilidade e ajuda a lembrar dos comandos.

- O Julia possui ajuda para comandos dentro de seu ambiente. Para alternar para o "ambiente de ajuda", digite `?` (sinal de interrogação). A linha de comandos tornará
~~~
help?>
~~~
Basta digitar o comando e teclar "Enter". A funcionalidade `TAB --> TAB` também está disponível no ambiente de ajuda.

- É possível alternar entre o terminal do Julia e o terminal do GNU/Linux teclando `;` (ponto e vírgula). Isso é interessante quando precisamos executar comandos à nível de terminal do GNU/Linux sem perder os objetos do Julia na memória. Por exemplo, você pode editar um arquivo de texto com o editor `nano`:
~~~
julia> ;
shell> nano arquivo.txt
~~~

- É possível navegar entre diretórios sem sair do ambiente Julia. Alguns comandos:
  - `pwd()`: imprimi o diretório atual
  - `cd("[diretorio]")`: muda de diretório. Aceita diretórios relativos, tais como `../dir1` (`dir1` no diretório pai), ou `dir1/dir2` (subdiretórios na pasta atual).
  - O comando `cd("[TAB --> TAB]` funciona e é útil para listar os diretórios da pasta atual e autocompletar nomes parcialmente digitados.
  - Obs.: se preferir, você pode também navegar entre diretórios a partir do terminal do GNU/Linux (teclando ponto e vírgula).

- Para sair do Julia, execute `exit()` ou tecle **Ctrl+d**. Isso apagará da memória todos os objetos criados.


# Uso do Julia em otimização - primeiros passos

[Neste link](/juliaopt/) você encontra dicas e exemplos para os primeiros passos na escrita e resolução de problemas de otimização com o Julia.


# Links úteis sobre Julia

- Sítio oficial da linguagem: <https://julialang.org>
- Julia no GitHub: <https://github.com/JuliaLang/julia>
- Lista de pacotes: <https://julialang.org/packages>
- Documentação oficial (em inglês): <https://docs.julialang.org>
- *ThinkJulia* - Uma documentação completa em português: <https://juliaintro.github.io/JuliaIntroBR.jl>
<!--- [Tutorial, Prof. Leandro Martínez (Unicamp)](http://m3g.iqm.unicamp.br/main/didatico/simulacoes/tutorial-Julia.pdf)-->
