---
layout: archive
title: "Julia para Otimização - Exemplo 9"
permalink: /juliaopt_ex9/
author_profile: true
---

[<< voltar para "Julia para Otimização"](/juliaopt/)

## Objetivo: gravar arquivos de texto, tabelar resultados.

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

## Tabelando resultados

No [Exemplo 4](/juliaopt_ex4/) foi disponibilizada uma implementação do método do gradiente. O exemplo a seguir executa o método do gradiente em problemas da [CUTEst](/juliaopt_ex8/).

- Baixe o arquivo [**gradiente.jl**](/files/julia/gradiente.jl) contendo a implementação do método do gradiente

A fim de aplicar o método acima em vários problemas de forma automatizada, baixe o código a seguir:

- [**testesSIF.jl** - Testes automatizados com problemas da CUTEst](/files/julia/testesSIF.jl)

Este código executa o método do gradiente sobre problemas selecionados da CUTEst. Você pode lembrar como carregar tais problemas revendo o [Exemplo 8](/juliaopt_ex8/).

### Exercício

Teste o método de gradiente nos problemas irrestritos selecionados, como explicado acima.
