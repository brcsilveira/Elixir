defmodule Minesweeper do
  # PRIMEIRA PARTE - FUNÇÕES PARA MANIPULAR OS TABULEIROS DO JOGO (MATRIZES)

  # A ideia das próximas funções é permitir que a gente acesse uma lista usando um indice,
  # como se fosse um vetor

  # get_arr/2 (get array):  recebe uma lista (vetor) e uma posicao (p) e devolve o elemento
  # na posição p do vetor. O vetor começa na posição 0 (zero). Não é necessário tratar erros.

  def get_arr([h|_t], 0), do: h
  def get_arr([_h|t], n), do: get_arr(t, n-1)

  # update_arr/3 (update array): recebe uma lista(vetor), uma posição (p) e um novo valor (v)e devolve um novo vetor com o valor v na posição p. O vetor começa na posição 0 (zero)

  def update_arr([_h|t],0,v), do: [v|t]
  def update_arr([h|t],n,v), do: [h|update_arr(t, n-1, v)]

  # O tabuleiro do jogo é representado como uma matriz. Uma matriz, nada mais é do que um vetor de vetores.
  # Dessa forma, usando as operações anteriores, podemos criar funções para acessar os tabuleiros, como
  # se  fossem matrizes:

  # get_pos/3 (get position): recebe um tabuleiro (matriz), uma linha (l) e uma coluna (c) (não precisa validar).
  # Devolve o elemento na posicao tabuleiro[l,c]. Usar get_arr/2 na implementação

  def get_pos(tab,l,c), do: get_arr(get_arr(tab, l), c)

  # update_pos/4 (update position): recebe um tabuleiro, uma linha, uma coluna e um novo valor. Devolve
  # o tabuleiro modificado com o novo valor na posiçao linha x coluna. Usar update_arr/3 e get_arr/2 na implementação

  def update_pos(tab,l,c,v), do: update_arr(tab, l, update_arr(get_arr(tab, l), c, v))

  # SEGUNDA PARTE: LÓGICA DO JOGO

  #-- is_mine/3: recebe um tabuleiro com o mapeamento das minas, uma linha, uma coluna. Devolve true caso a posição contenha
  # uma mina e false caso contrário. Usar get_pos/3 na implementação
  #
  # Exemplo de tabuleiro de minas:
  #
  # _mines_board = [[false, false, false, false, false, false, false, false, false], [false, false, false, false, false, false, false, false, false],[false, false, false, false, false, false, false, false, false], [false, false, false, false, false, false, false, false, false], [false, false, false, false, true , false, false, false, false], [false, false, false, false, false, true, false, false, false], [false, false, false, false, false, false, false, false, false], [false, false, false, false, false, false, false, false, false], [false, false, false, false, false, false, false, false, false]]
  # esse tabuleiro possuí minas nas posições 4x4 e 5x5

  def is_mine(tab,l,c), do: get_pos(tab,l,c)

  # is_valid_pos/3 recebe o tamanho do tabuleiro (ex, em um tabuleiro 9x9, o tamanho é 9),
  # uma linha e uma coluna, e diz se essa posição é válida no tabuleiro. Por exemplo, em um tabuleiro
  # de tamanho 9, as posições 1x3,0x8 e 8x8 são exemplos de posições válidas. Exemplos de posições
  # inválidas seriam 9x0, 10x10 e -1x8

  # false = posição inválida; true = posição válida
  def is_valid_pos(tamanho,l,c), do: l >= 0 and l < tamanho and c >= 0 and c < tamanho

  # valid_moves/3: Dado o tamanho do tabuleiro e uma posição atual (linha e coluna), retorna uma lista
  # com todas as posições adjacentes à posição atual
  # Exemplo: Dada a posição linha 3, coluna 3, as posições adjacentes são: [{2,2},{2,3},{2,4},{3,2},{3,4},{4,2},{4,3},{4,4}]
  #   ...   ...      ...    ...   ...
  #   ...  (2,2)    (2,3)  (2,4)  ...
  #   ...  (3,2)    (3,3)  (3,4)  ...
  #   ...  (4,2)    (4,3)  (4,4)  ...
  #   ...   ...      ...    ...   ...

  #  Dada a posição (0,0) que é um canto, as posições adjacentes são: [(0,1),(1,0),(1,1)]

  #  (0,0)  (0,1) ...
  #  (1,0)  (1,1) ...
  #   ...    ...  ..
  # Uma maneira de resolver seria gerar todas as 8 posições adjacentes e depois filtrar as válidas usando is_valid_pos

  def valid_moves(tam, l, c) do
    [{l-1, c-1}, {l-1, c},{l-1, c+1},{l, c-1},{l, c+1},{l+1, c-1},{l+1, c},{l+1, c+1}]
    |> Enum.filter(fn {l, c} -> is_valid_pos(tam, l, c) end)
  end

  # conta_minas_adj/3: recebe um tabuleiro com o mapeamento das minas e uma  uma posicao  (linha e coluna), e conta quantas minas
  # existem nas posições adjacentes

  # Exemplo para testar "conta_minas_adj":
  # [[false, false, false, false, false, false, false, false, false], [false, false, false, false, false, false, false, false, false],[false, false, false, false, false, false, false, false, false], [false, false, false, false, false, false, false, false, false], [false, false, false, false, true , false, false, false, false], [false, false, false, false, false, true, false, false, false], [false, false, false, false, false, false, false, false, false], [false, false, false, false, false, false, false, false, false], [false, false, false, false, false, false, false, false, false]]

  def conta_minas_adj(tab, l, c) do
    valid_moves(length(tab), l, c)
    |> Enum.reduce(0, fn {l, c}, acc ->
      if is_mine(tab, l, c) do
        acc + 1
      else
        acc
      end
    end)
  end

  # abre_jogada/4: é a função principal do jogo!!
  # recebe uma posição a ser aberta (linha e coluna), o mapa de minas e o tabuleiro do jogo. Devolve como
  # resposta o tabuleiro do jogo modificado com essa jogada.
  # Essa função é recursiva, pois no caso da entrada ser uma posição sem minas adjacentes, o algoritmo deve
  # seguir abrindo todas as posições adjacentes até que se encontre posições adjacentes à minas.
  # Vamos analisar os casos:
  # - Se a posição a ser aberta é uma mina, o tabuleiro não é modificado e encerra
  # - Se a posição a ser aberta já foi aberta, o tabuleiro não é modificado e encerra
  # - Se a posição a ser aberta é adjacente a uma ou mais minas, devolver o tabuleiro modificado com o número de
  # minas adjacentes na posição aberta
  # - Se a posição a ser aberta não possui minas adjacentes, abrimos ela com zero (0) e recursivamente abrimos
  # as outras posições adjacentes a ela

  # minas_board = [[false, false, false],[false, true,  false],[false, false, true]]
  # game_board = [["-", "-", "-"],["-", "-", "-"],["-", "-", "-"]]

  def abre_jogada(l, c, minas, tab) do
    cond do
      is_mine(minas, l, c) -> tab
      get_pos(tab, l, c) != "-" -> tab
      conta_minas_adj(minas, l, c) > 0 -> update_pos(tab, l, c, conta_minas_adj(minas, l, c))
      true -> valid_moves(length(tab), l, c)
      |> Enum.reduce(update_pos(tab, l, c, 0), fn {l, c}, acc -> abre_jogada(l, c, minas, acc) end)
    end
  end

# abre_posicao/4, que recebe um tabueiro de jogos, o mapa de minas, uma linha e uma coluna
# Essa função verifica:
# - Se a posição {l,c} já está aberta (contém um número), então essa posição não deve ser modificada
# - Se a posição {l,c} contém uma mina no mapa de minas, então marcar  com "*" no tabuleiro
# - Se a posição {l,c} está fechada (contém "-"), escrever o número de minas adjascentes a esssa posição no tabuleiro (usar conta_minas)

  def abre_posicao(tab,minas,l,c) do
    cond do
      get_pos(tab, l, c) != "-" -> tab
      is_mine(minas, l, c) -> update_pos(tab, l, c, "*")
      true -> update_pos(tab, l, c, conta_minas_adj(minas, l, c))
    end
  end

# abre_tabuleiro/2: recebe o mapa de Minas e o tabuleiro do jogo, e abre todo o tabuleiro do jogo, mostrando
# onde estão as minas e os números nas posições adjecentes às minas.Essa função é usada para mostrar
# todo o tabuleiro no caso de vitória ou derrota. Para implementar esta função, usar a função abre_posicao/4

# Exemplo: Minesweeper.abre_tabuleiro([[true,false,false,false],[true,false,false,false],[true,false,false,false],[true,false,false,false]],[["-","-","-","-"],["-","-","-","-"],["-","-","-","-"],["-","-","-","-"]])
# Funciona: Minesweeper.abre_tabuleiro([[true,false,false],[true,false,false],[true,false,false]],[["-","-","-"],["-","-","-"],["-","-","-"]])

  def abre_tabuleiro(_minas,tab,l,_c) when l < 0, do: tab
  def abre_tabuleiro(minas,tab,l,c) when c < 0, do: abre_tabuleiro(minas,tab,l-1,length(minas)-1)
  def abre_tabuleiro(minas,tab,l,c), do: abre_tabuleiro(minas, abre_posicao(tab,minas,l,c),l,c-1)
  def abre_tabuleiro(minas,tab) do
    qtd_linhas_e_colunas = length(tab) - 1 # -1 pois o index começa em 0 e considerando que o tabuleiro é quadrado
    abre_tabuleiro(minas,tab,qtd_linhas_e_colunas,qtd_linhas_e_colunas)
  end

# board_to_string/1: -- Recebe o tabuleiro do jogo e devolve uma string que é a representação visual desse tabuleiro.
# Essa função é aplicada no tabuleiro antes de fazer o print dele na tela. Usar a sua imaginação para fazer um
# tabuleiro legal. Olhar os exemplos no .pdf com a especificação do trabalho. Não esquecer de usar \n para quebra de linhas.
# Você pode quebrar essa função em mais de uma: print_header, print_linhas, etc...

  # Função para contar os indices do cabeçalho do tabuleiro e auxiliar a função print_header
  def aux_print_header(contador_colunas) do
    Range.new(0, contador_colunas-1)
    |> Enum.map(fn x -> Integer.to_string(x) end)
    |> Enum.join("   ")
  end
  def print_header(contador_colunas) do
    IO.puts("   " <> aux_print_header(contador_colunas))
  end

  # Função para contar os indices das linhas do tabuleiro e auxiliar a função print_linhas, o get_arr é usado para pegar os valores das celulas
  def aux_print_linhas(linha, contador_colunas) do
    Range.new(0, contador_colunas-1)
    |> Enum.map(fn x -> get_arr(linha, x) end)
    |> Enum.join("   ")
  end
  def print_linhas(vetor_linha, linha, contador_colunas) do
    IO.puts Integer.to_string(linha) <> "  " <> aux_print_linhas(vetor_linha, contador_colunas)
    IO.puts ""
  end

  def board_to_string(tab) do
    qtd_colunas = length(tab)
    print_header(qtd_colunas)
    Enum.reduce(tab, 0, fn (linha, i) ->
      print_linhas(linha, i, qtd_colunas)
      i+1
    end)
    IO.puts ""
  end
# gera_lista/2: recebe um inteiro n, um valor v, e gera uma lista contendo n vezes o valor v

  def gera_lista(0,_v), do: []
  def gera_lista(n,v), do: [v|gera_lista(n-1,v)]

# -- gera_tabuleiro/1: recebe o tamanho do tabuleiro de jogo e gera um tabuleiro  novo, todo fechado (todas as posições
# contém "-"). Usar gera_lista

  def gera_tabuleiro(n) do
    gera_lista(n, gera_lista(n, "-"))
  end

# -- gera_mapa_de_minas/1: recebe o tamanho do tabuleiro e gera um mapa de minas zero, onde todas as posições contém false

  def gera_mapa_de_minas(n) do
    gera_lista(n, gera_lista(n, false))
  end

# conta_fechadas/1: recebe um tabueleiro de jogo e conta quantas posições fechadas existem no tabuleiro (posições com "-")

  def conta_fechadas(tab) do
    tab
    |> Enum.reduce(0, fn linha, acc -> acc + Enum.count(linha, fn x -> x == "-" end) end)
  end

# -- conta_minas/1: Recebe o tabuleiro de Minas (MBoard) e conta quantas minas existem no jogo

  def conta_minas(minas) do
    minas
    |> Enum.reduce(0, fn linha, acc -> acc + Enum.count(linha, fn x -> x == true end) end)
  end

# end_game?/2: recebe o tabuleiro de minas, o tauleiro do jogo, e diz se o jogo acabou.
# O jogo acabou quando o número de casas fechadas é igual ao numero de minas
  def end_game(minas,tab) do
    conta_fechadas(tab) == conta_minas(minas)
  end

#### fim do módulo
end

###################################################################
###################################################################

# A seguir está o motor do jogo!
# Somente descomentar essas linhas quando as funções do módulo anterior estiverem
# todas implementadas

defmodule Motor do
  def main() do
   v = IO.gets("Digite o tamanho do tabuleiro: \n")
   {size,_} = Integer.parse(v)
   minas = gen_mines_board(size)
   IO.inspect minas
   tabuleiro = Minesweeper.gera_tabuleiro(size)
   game_loop(minas,tabuleiro)
  end
  def game_loop(minas,tabuleiro) do
    IO.puts Minesweeper.board_to_string(tabuleiro)
    v = IO.gets("Digite uma linha: \n")
    {linha,_} = Integer.parse(v)
    v = IO.gets("Digite uma coluna: \n")
    {coluna,_} = Integer.parse(v)
    if (Minesweeper.is_mine(minas,linha,coluna)) do
      IO.puts "VOCÊ PERDEU!!!!!!!!!!!!!!!!"
      IO.puts Minesweeper.board_to_string(Minesweeper.abre_tabuleiro(minas,tabuleiro))
      IO.puts "TENTE NOVAMENTE!!!!!!!!!!!!"
    else
      novo_tabuleiro = Minesweeper.abre_jogada(linha,coluna,minas,tabuleiro)
      if (Minesweeper.end_game(minas,novo_tabuleiro)) do
          IO.puts "VOCÊ VENCEU!!!!!!!!!!!!!!"
          IO.puts Minesweeper.board_to_string(Minesweeper.abre_tabuleiro(minas,novo_tabuleiro))
          IO.puts "PARABÉNS!!!!!!!!!!!!!!!!!"
      else
          game_loop(minas,novo_tabuleiro)
      end
    end
  end
  def gen_mines_board(size) do
    add_mines(ceil(size*size*0.15), size, Minesweeper.gera_mapa_de_minas(size))
  end
  def add_mines(0,_size,mines), do: mines
  def add_mines(n,size,mines) do
    linha = :rand.uniform(size-1)
    coluna = :rand.uniform(size-1)
    if Minesweeper.is_mine(mines,linha,coluna) do
      add_mines(n,size,mines)
    else
      add_mines(n-1,size,Minesweeper.update_pos(mines,linha,coluna,true))
    end
  end
end

Motor.main()
IEx.configure(inspect: [charlists: :as_lists]) # Tive de adicionar esse comando para que o IEx imprima as strings como listas de caracteres
