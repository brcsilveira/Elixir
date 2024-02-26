defmodule ES do
  def get_n_numbers(0), do: []
  def get_n_numbers(n) do
   {v,_resto} = IO.gets("Digite um número: ") |> Integer.parse
   [v | get_n_numbers(n-1)]
  end
  end
  {repeticoes, _} = IO.gets("Para quantos números você deseja calcular a média? ")
  |> Integer.parse
  soma = ES.get_n_numbers(repeticoes)
   |> Enum.reduce(0,fn (x,y) -> x+y end)
  IO.puts("Média: #{soma/repeticoes}")
