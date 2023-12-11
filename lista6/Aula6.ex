defmodule Aula6 do
  #Exercicio 1
  def soma_tuplas({{x, y},{z,w}}), do: x+y+z+w
  #Exercicio 2
  def shift({{x,y},z}), do: {x,{y,z}}
  #Exercicio 3
  def min_e_max(x,y,z), do: {mini(x,mini(y,z)), maxi(x,maxi(y,z))}
  def mini(a, b) do
    cond do
      a < b -> a
      true -> b
    end
  end
  def maxi(a, b) do
    cond do
      a > b -> a
      true -> b
    end
  end
  #Exercicio 4
  def soma_lista_tuplas([]), do: 0
  def soma_lista_tuplas([{x,y}|t]), do: x + y + soma_lista_tuplas(t)
  #Exercicio 5
  def zipp([],_y), do: []
  def zipp(_x,[]), do: []
  def zipp([h1|t1],[h2|t2]), do: [{h1,h2} | zipp(t1,t2)]
  #Exercicio 6
  def zip_tres([], _y, _z), do: []
  def zip_tres(_x, [], _z), do: []
  def zip_tres(_x, _y, []), do: []
  def zip_tres([h1|t1],[h2|t2],[h3|t3]), do: [{h1,h2,h3} | zip_tres(t1,t2,t3)]
  #Exercicio 7
  def unzip(l), do: {unzip_esq(l), unzip_dir(l)}
  defp unzip_esq([]), do: []
  defp unzip_esq([{x,_y}|t]), do: [x,unzip_esq(t)]
  defp unzip_dir([]), do: []
  defp unzip_dir([{_x,y}|t]), do: [y,unzip_dir(t)]
end
