defmodule InsertionSort do
  def insertion_sort([]) do
   []
  end
  def insertion_sort([h|t]) do
   ins(h,insertion_sort(t))
  end
  def ins(x,[]) do
    [x]
  end
  def ins(x,[h|t]) do
    cond do
      x <= h -> [x |[h|t]]
      true -> [h|ins(x,t)]
    end
  end
  def menor(lista) do
    case insertion_sort(lista) do
      [menor | _resto] -> menor
      _ -> nil
    end
  end
  def maior(lista) do #CORRIGIR
    case insertion_sort(lista) do
      [maior | _resto] -> maior
      _ -> nil
    end
  end
end
