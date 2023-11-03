defmodule Exercicio do
def quantos_iguais(x,y,z) do
    cond do
        x == y && x == z -> 3               # usando a tres_iguais vista em aula
        x == y || x == z || y == z -> 2
        x != y && x != z && y != z -> 0     # usando a todos_diferentes
        end
    end
end
