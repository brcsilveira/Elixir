defmodule Aula2 do
def quatro_iguais(a,b,c,d) do
  a == b && b == c && c == d
end
def quantos_iguais(a,b,c) do
  cond do
    a == b && b == c -> 3
    a == b || b == c || c == a -> 2
    true -> 0
  end
end
def todos_diferentes(a,b,c) do
  a != b && b != c && a != c
end
# 4 - Resp: falta uma comparação
def tres_iguais(a,b,c) do
  a == b && b == c
end
def quantos_iguais_2(a,b,c) do
  cond do
    tres_iguais(a,b,c) -> 3
    todos_diferentes(a,b,c) -> 0
    true -> 2
  end
end
def elevado_dois(n) do
  n * n
end
def elevado_quatro(n) do
  elevado_dois(elevado_dois(n))
end
def palindromo?(s) do
  String.reverse(s) == s
end
def verifica_triangulo(a,b,c) do
   a + b > c || b + c > a || a + c > b
end
def sinal(n) when n < 0 do
  -1
end
def sinal(0) do
  0
end
def sinal(n) when n > 0 do
  1
end
def menor(x,y) when x >= y do
  y
  end
  def menor(x,y) when y > x do
  x
end
def menor_tres(a,b,c) do
  menor(menor(a,b),c)
end
end
