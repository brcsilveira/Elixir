defmodule Menor_tres do
  def verifica_menor(a,b,c) do
    cond do
      a < b && a < c -> a
      b < a && b < c -> b
      c < a && c < b -> c
      c == a && c == b -> c
    end
  end
end
