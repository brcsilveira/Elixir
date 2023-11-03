defmodule Exemplo do
def quantos_iguais(x,y,z) do
    cond do
        x == y && x == z -> 3
        x != y && x != z -> 0
        true -> 2
        end
    end
end