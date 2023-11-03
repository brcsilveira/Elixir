defmodule Exemplo do
def maior_de_idade(idade) do
 idade >= 18
end
def tresigual(x,y,z) do
 x == y && x == z
end
def quadrado(x) do
 x * x
end
def menor(x,y) do
 cond do
 x >= y -> y
 y > x -> x
 end
end
end