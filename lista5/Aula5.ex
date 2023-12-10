defmodule Aula5 do
  #Exercício 1
  def membro([],_x), do: false
  def membro([h|t],x) do
    cond do
      h == x -> true
      true   -> membro(t,x)
    end
  end
  #Exercicio 2
  def quantas_vezes([],_x), do: 0
  def quantas_vezes([h|t],x) do
    cond do
      h == x -> 1 + quantas_vezes(t,x)
      true   -> quantas_vezes(t,x)
    end
  end
  #Exercicio 3
  def membro2(l,x), do: quantas_vezes(l,x) > 0
  #Exercicio 4
  def unicos(l), do: unicos_(l,l)
  defp unicos_([],_l), do: []
  defp unicos_([h|t], l) do
    cond do
      quantas_vezes(l,h) == 1 -> [h|unicos_(t,l)]
      true -> unicos_(t,l)
    end
  end
  #Exercicio 5
  def quick_sort([]), do: []
  def quick_sort([h|t]) do
    quick_sort(menores(h,t)) ++ [h] ++ quick_sort(maiores(h,t))
  end
  def menores(_x,[]) do
    []
  end
  def menores(x,[h|t]) do
    cond do
      h <= x -> [h|menores(x,t)]
      true -> menores(x,t)
    end
  end
def maiores(_x,[]) do
  []
end
def maiores(x,[h|t]) do
  cond do
  h > x -> [h|maiores(x,t)]
  true -> maiores(x,t)
  end
end
end
