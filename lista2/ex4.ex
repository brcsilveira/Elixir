defmodule Vendas do
  def vendas(0), do: 33
  def vendas(1), do: 22
  def vendas(2), do: 18
  def vendas(3), do: 0
  def vendas(4), do: 66
  def vendas(_n), do: 22

  def zero_vendas(n) do
    if vendas(n) == 0 do
      zero_vendas(n-1) + 1
    end
    cond do
      zero_vendas(0) == 0 -> -1
    end
  end
end
