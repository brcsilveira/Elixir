defmodule Exemplo do
 def quatroigual(x,y,z,a) do
    cond do
      x == y && x == z && x == a -> true
      true -> false
    end
  end
end
