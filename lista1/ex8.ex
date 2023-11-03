defmodule Palindromo do
  def isPalidromo(string) do
    reverseWord = string
    |> String.reverse()      # inverte a palavra
    string == reverseWord
  end
end
