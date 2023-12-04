defmodule Area do
  def area({:quadrado, lado}), do: lado * lado
  def area({:retangulo, base, altura}), do: base * altura
  def area({:circulo, raio}), do: :math.pi() * :math.pow(raio,2)
  end
