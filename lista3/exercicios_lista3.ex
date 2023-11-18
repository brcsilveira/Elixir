defmodule TerceiraLista do
  def vazia([]) do
    []
  end

  #Exercício 1
  def mult_dois_lista([head | tail]) do
    [head * 2 | mult_dois_lista(tail)]
  end

  #Exercício 2
  def tamanho([]), do: 0
  def tamanho([_ | tail]) do
     1 + tamanho(tail)
  end

  #Exercício 3
  def produto([]), do: 1
  def produto([head|tail]) do
    head * produto(tail)
  end

  #Exercício 4

  #Exercício 5: Observar mais atentamente depois, pedir ajuda para entender
  def insere_final(elemento, []), do: [elemento]
  def insere_final(elemento, [head | tail]) do
    [head | insere_final(elemento, tail)]
  end

  #Exercício 6
  def neg_lista(lista) do
    Enum.map(lista, &(!&1))
    #Enum.map é usado para percorrer todos os elementos da lista. &(!&1) é uma função anônima que nega (!) cada elemento da lista (&1).
  end

end
