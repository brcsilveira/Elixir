defmodule Semana3 do
  def maxi(a, b) do
    cond do
      a >= b -> a
      a <= b -> b
    end
  end
  def vendas(0), do: 33
  def vendas(1), do: 22
  def vendas(2), do: 18
  def vendas(3), do: 0
  def vendas(4), do: 66
  def vendas(_n), do: 22
  def venda_total(0) do
    vendas(0)
  end
  def venda_total(n) do
    vendas(n) + venda_total(n-1)
  end
  def maior_venda(n) do
    Maxi(vendas(n), maior_venda(n-1))
  end
end
