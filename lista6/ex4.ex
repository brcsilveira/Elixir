defmodule Exercicio4 do
  def soma_lista_tuplas([{a,b},{c,d},{e,f}]) do
    [x,y,z] = [{a,b},{c,d},{e,f}]
    {a,b} = x
    {c,d} = y
    {e,f} = z
    a + b + c + d + e + f
  end
end
