---
layout: archive
title: "Julia para Otimização"
permalink: /juliaopt_ex9/
author_profile: true
---

# Exercício 9

**Objetivo:** gravar arquivos de texto, tabelar resultados.

Para gravar arquivos de texto, o Julia dispõe de comandos nativos semelhantes ao C:
- `open`: abre um arquivo
- `write`: grava um texto no *buffer* (memória)
- `flush`: descarrega os textos do *buffer* no arquivo (grava em disco)
- `close`: fecha o arquivo, descarregando todo o *buffer*

O exemplo a seguir abre o arquivo "saida.txt" em modo **escrita** (opção "w"), grava o texto "Alo mundo!" e o fecha. Caso o arquivo "saida.txt" não exista, ele é criado. Caso exista, todo o conteúdo será substituído.

~~~
julia> arq = open("saida.txt", "w")
julia> write(arq, "Alô mundo!")
julia> close(arq)
~~~

Quando estamos executando um algoritmo sobre vários problemas, é comum abrir um arquivo em modo **inserção** (ou *append*). Assim, toda nova gravação será feita no fim do arquivo, e o conteúdo antigo não é perdido. Para tanto, basta usar a opção "a" no comando `open`:

~~~
julia> arq = open("saida.txt", "a")
julia> write(arq, "Uma nova linha, sem excluir o conteúdo anterior.")
julia> close(arq)
~~~

Podemos precisar descarregar o *buffer* durante um processo, por exemplo, quando queremos gravar imediatamente a saída de um algoritmo em uma tabela. Assim, se algum erro acontece, não perdemos as saídas já calculadas. Isso é feito com o comando `flush`:

~~~
julia> arq = open("saida.txt", "a")
julia> write(arq, "linha 1...")
julia> flush(arq)
julia> write(arq, "linha 2...")
julia> flush(arq)
julia> close(arq)
~~~

O pacote `Printf` permite que gravemos dados formatados. Podemos utilizar o comando `@sprintf` (não esqueça o @) dentro de um `write`. A sintaxe é igual a do C, você pode utilizar todos os identificadores, tais como **\n, \t, %d, %f, %lf, %e** etc. Exemplo:

~~~
julia> using Printf
julia> n = 10
julia> x = 13.5696
julia> arq = open("saida.txt", "a");
julia> write(arq, @sprintf("O valor da variável x é %8.3lf\nO valor da variável n é %d", x, n));
julia> flush(arq);
julia> close(arq);
~~~

## Tabelando resultados - exemplo completo

O exemplo a seguir executa o método do gradiente com interpolação quadrática em problemas da CUTEst.

No [Exercício 4](/juliaopt_ex4/) foi sugerida a implementação do método do gradiente com busca linear por interpolação quadrática. O método a seguir emprega tal estratégia baseada na implementação do método do gradiente espectral projetado (do inglês, SPG), em Fortran, desenvolvido por Birgin, Martinez e Raydan, e disponível em <www.ime.usp.br/~egbirgin/tango/codes.php>. Trata-se de uma estratégia com mais detalhes do que visto em aula. Ela costuma funcionar muito bem na prática. Baixe o código no *link* abaixo e veja detalhes na função `buscalinear`:

- [**gradiente_interp.jl** - Método do gradiente com busca linear Armijo + interpolação quadrática + salvaguardas](/files/julia/gradiente_interp.jl)

A fim de aplicar o método acima em vários problemas de forma automatizada, baixe o código a seguir:

- [**testesSIF.jl** - Testes automatizados com problemas da CUTEst](/files/julia/testesSIF.jl)

Este código executa o método do gradiente a partir sobre um diretório com arquivos `.SIF` (os arquivos da CUTEst). Você pode lembrar como carregar esse arquivos no Julia revendo o [Exercício 8](/juliaopt_ex8/).

O arquivo ZIP a seguir contém problemas sem restrições selecionados da CUTEst. Descompacte-o para a pasta `sif` dentro do mesmo diretório que os códigos anteriores e execute `testesSIF()`.

- [**cutest_irrestrito.zip** - Problemas irrestritos selecionados da CUTEst](/files/julia/cutest_irrestrito.zip)

*Fonte: bitbucket.org/optrove/sif*

### Exercício 1

Teste o método de gradiente com interpolação quadrática nos problemas irrestritos selecionados, como explicado acima.

### Exercício 2

Implemente o método do gradiente espectral projetado **a partir do código [`gradiente_interp.jl`](/files/julia/gradiente_interp.jl)**. No arquivo [**`testesSIF.jl`**](/files/julia/testesSIF.jl) há instruções para inserir sua implementação. Rode `testesSIF` sobre os [**problemas irrestritos**](/files/julia/cutest_irrestrito.zip).

Veja um [**exemplo da saída gerada**](/files/julia/resultados.txt) pela rotina `testesSIF`, com dois métodos (`gradiente_interp.jl` e SPG).

### Exercício 3

Usando o mesmo código `testesSIF.jl`, teste sua implementação do gradiente espectral projetado para os problemas com restrições de caixa (variáveis com limitantes) selecionados da CUTEst:

- [**cutest_caixa.zip** - Problemas com restrições de caixa selecionados da CUTEst](/files/julia/cutest_caixa.zip)

*Fonte: bitbucket.org/optrove/sif*

Lembre-se que neste caso o método do gradiente puro não pode ser aplicado (a rotina `testesSIF` cuida disso).
