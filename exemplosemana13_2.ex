{n1,_resto} = IO.gets("Digite um número: ") |> Integer.parse
{n2,_resto} = IO.gets("Digite outro número: ") |> Integer.parse
IO.puts "Média dos dois números: #{(n1+n2)/2}"
