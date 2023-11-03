defmodule Exercicio do
  def elevado_quatro(x) do
    Exercicio.elevado_dois(x) * Exercicio.elevado_dois(x)
  end
  def elevado_dois(x) do
    x * x
  end
end
