defmodule Multiplicapordois do
  def vezes_dois([]) do
    []
   end
  def vezes_dois([head|tail]) do
    [head*2 | vezes_dois(tail)]
   end
end
