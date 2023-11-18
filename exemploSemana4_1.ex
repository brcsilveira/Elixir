defmodule Exemplo do
  def soma_lista([]) do
   0
  end
  def soma_lista([head|tail]) do
   head + soma_lista(tail)
  end
  end
