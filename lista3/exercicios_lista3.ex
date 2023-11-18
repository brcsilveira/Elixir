defmodule TerceiraLista do
  def vazia([]) do
    []
  end

  def mult_dois_lista([head | tail]) do
    [head * 2 | mult_dois_lista(tail)]
  end

  def tamanho([]), do: 0
  def tamanho([_ | tail]), do: 1 + tamanho(tail)
end
