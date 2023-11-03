defmodule Triangulos do
  def verifica_triangulo(a,b,c) do
    cond do
      (a + b) > c && (b + c) > a && (a + c) > b -> true
      true -> false #(a + b) < c || (b + c) < a || (a + c) < b
    end
  end
end
