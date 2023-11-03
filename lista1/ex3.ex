defmodule Exemplo do
  def todos_diferente(a,b,c) do
    cond do
      a != b && a != c -> true
      true -> false
    end
  end
end
