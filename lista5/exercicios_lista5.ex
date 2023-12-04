defmodule ExerciciosLista5 do
  def soma_tuplas({{a, b}, {c, d}}) do
    {{x, y}, {q, z}} = {{a, b}, {c, d}}
    x + q + y + z
  end

  def shift({{x, y}, z}) do
    {x, {y, z}}
  end

  def min_e_max(x,y,z) do
    cond do
      x <= y && x <= z -> x
      y <= x && y <= z -> y
      z <= x && z <= y -> z
    end
    cond do
      x >= y && x >= z -> x
      y >= x && y >= z -> y
      z >= x && z >= y -> z
    end
    {menor, maior} =
  end
end
