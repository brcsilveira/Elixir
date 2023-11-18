defmodule Exemplo do
  def quadrado_lista([]) do
   []
  end
  def quadrado_lista([head|tail]) do
   [head*head | quadrado_lista(tail)]
  end
  end
