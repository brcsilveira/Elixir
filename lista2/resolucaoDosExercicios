defmodule Aula3 do
  def vendas(0), do: 33
  def vendas(1), do: 22
  def vendas(2), do: 18
  def vendas(3), do: 0
  def vendas(4), do: 66
  def vendas(_n), do: 22

  # Exercício 1
  def maxi(x, y) when x >= y, do: x
  def maxi(x, y) when x < y, do: y

  # Exercício 2
  def maior_venda(0), do: vendas(0)
  def maior_venda(n), do: maxi(vendas(n), maior_venda(n - 1))

  # Exercício 3
  def semana_max_venda(0), do: 0
  def semana_max_venda(n) do
  cond do
      maior_venda(n) == vendas(n) -> n
      true -> semana_max_venda(n - 1)
    end
  end

  # Exercício 4
  def zero_vendas(n) when n < 0, do: -1
  def zero_vendas(n) do
  cond do
    vendas(n) == 0 -> n
    true -> zero_vendas(n - 1)
    end
  end

  # Exercício 5
  def acha_semana(_s, n) when n < 0, do: -1
  def acha_semana(s, n) do
    cond do
        vendas(n) == s -> n
       true -> acha_semana(s, n - 1)
    end
  end

# Exercício 6: chamado o acha_semana com zero
  def zero_vendas2(n), do: acha_semana(0, n)

# Exercício 7
# refazendo com intervalo de m até n
  def maior_venda_2(m, n) when m == n, do: vendas(n)
  def maior_venda_2(m, n), do: maxi(vendas(n), maior_venda_2(m, n - 1))

  def semana_max_venda_2(m, n) when m == n, do: m
  def semana_max_venda_2(m, n) do
  cond do
      maior_venda_2(m, n) == vendas(n) -> n
      true -> semana_max_venda_2(m, n - 1)
    end
  end


  def zero_vendas_2(m, n) when m > n, do: -1
  def zero_vendas_2(m, n) do
  cond do
      vendas(n) == 0 -> n
      true -> zero_vendas_2(m, n - 1)
    end
  end

  def acha_semana_2(_s, m, n) when m > n, do: -1
  def acha_semana_2(s, m, n) do
    cond do
        vendas(n) == s -> n
        true -> acha_semana_2(s, m, n - 1)
    end
  end

  def zero_vendas_acha_semana_2(m, n), do: acha_semana_2(0, m, n)

  # Exercício 8
  def produto(m, n) when m == n, do: m
  def produto(m, n), do: m * produto(m + 1, n)

  # Exercício 9
  def potencia(_x, 0), do: 1
  def potencia(x, y), do: x * potencia(x, y - 1)

  # Exercício 10
  def fib(0), do: 0
  def fib(1), do: 1
  def fib(n), do: fib(n - 1) + fib(n - 2)
end
