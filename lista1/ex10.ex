defmodule Sinal do
  def verifica_sinal(n) do
    cond do
      n < 0 -> -1
      n == 0 -> 0
      n > 0 -> 1
    end
  end
end
