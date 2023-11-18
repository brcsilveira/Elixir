defmodule TerceiraLista do
  def vazia([]) do
    []
  end

  #Exercício 1
  def mult_dois_lista([head | tail]) do
    [head * 2 | mult_dois_lista(tail)]
  end

  #Exercício 2
  def tamanho([]), do: 0
  def tamanho([_ | tail]) do
     1 + tamanho(tail)
  end

  #Exercício 3
  def produto([]), do: 1
  def produto([head|tail]) do
    head * produto(tail)
  end
end
