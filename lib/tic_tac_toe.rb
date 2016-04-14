WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " " ," ", " ", " "]
  end
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  def move(location, token="x")
    @board[location-1] = token
  end
  def position_taken?(position)
    @board[position] == "X" || @board[position] == "O"
  end
  def valid_move?(position)
    position = position.to_i - 1
    position.between?(0,8) && !(@board[position] == "X" || @board[position] == "O")
  end
  def turn
  end
end
