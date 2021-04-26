---
layout: archive
title: "Julia para Otimização - Exemplo 13"
permalink: /juliaopt_ex13/
author_profile: true
---

[<< voltar para "Julia para Otimização"](/juliaopt/)

## Objetivo: tratar erros de execução.

Ao rodar vários testes em sequência, qualquer erro encerra a execução. Pode ser útil tratar erros de modo que a execução continue. Assim como C ou Fortran, Julia possui o bloco protegido **try-catch**.

Por exemplo, o laço a seguir gera um erro ao tentar avaliar $\text{log}(-1)$:
~~~
julia> I=[1,2,-1,3,4]
julia> for i in I
          println("log($i) = "*string(log(i)))
       end
log(1) = 0.0
log(2) = 0.6931471805599453
ERROR: DomainError with -1.0:
log will only return a complex result if called with a complex argument. Try log(Complex(x)).
Stacktrace:
 [1] throw_complex_domainerror(::Symbol, ::Float64) at ./math.jl:33
 [2] log(::Float64) at ./special/log.jl:285
 [3] log(::Int64) at ./special/log.jl:395
 [4] top-level scope at ./REPL[10]:2
~~~

Observe que a execução para quando $i=-1$. Podemos tratar este erro e continuar a execução:
~~~
julia> for i in I
          try
             println("log($i) = "*string(log(i)))
          catch err
             println("Erro ao calcular log($i).")
             println("Descrição do erro: "*string(err))
          end
       end
log(1) = 0.0
log(2) = 0.6931471805599453
Erro ao calcular log(-1).
Descrição do erro: DomainError(-1.0, "log will only return a complex result if called with a complex argument. Try log(Complex(x)).")
log(3) = 1.0986122886681098
log(4) = 1.3862943611198906
~~~

Veja que ao atingir $i=-1$, o erro de execução foi identificado e o bloco **catch** foi acionado. Evidentemente, você pode inserir quaisquer comandos no bloco catch, por exemplo, comandos para encerrar estruturas atribuídas pelo método. A estrutura **err** é opcional; ela guarda informações do erro, como uma descrição resumida e o tipo da exceção.

Tratar de erros pode ser útil quando executamos longos testes sobre vários problemas (por exemplo, da CUTEst), e queremos descartar aqueles em que o método apresenta um erro desconhecido, preservando o fluxo de execução.

Também pode ser útil identificar quando o usuário pressiona CTRL+C, encerrando a execução *(não funciona quando rodamos códigos fora do ambiente Julia)*. Deste modo, alguma decisão pode ser tomada, por exemplo, gravar resultados parciais dos testes. O código a seguir é um exemplo de como isso pode ser feito.
~~~
julia> try
          for i in 1:100000
             println(i)
          end
       catch err
          println()
          println("Ops! Algum erro ocorreu...")

          if err isa InterruptException
             println("Ah! CTRL+C foi pressionado!!!")
          end
       end
~~~

Se pressionarmos CTRL+C **durante a execução do for**, a saída será algo do tipo
~~~
...
20787
20788
20789
^C20790
Ops! Algum erro ocorreu...
Ah! CTRL+C foi pressionado!!!
~~~
