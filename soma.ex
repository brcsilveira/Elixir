defmodule Soma do
def soma(x,y) do
 x+y
end
end
lista = [1,2,3,4,5,6,7]
resultado = Enum.reduce(lista,0,&Soma.soma/2)
IO.puts resultado