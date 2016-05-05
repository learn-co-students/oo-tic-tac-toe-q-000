
class TicTacToe
  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end

  #  rspec spec/01_tic_tac_toe_spec.rb


WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # bottom row
  [0,3,6],  # left column
  [1,4,7],  # Middle column
  [2,5,8],  # right column
  [0,4,8],  # lt to rt cross
  [6,4,2]   # rt to lt
]
#DISPLAY_BOARD
def display_board
   puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
   puts "-----------"
   puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
   puts "-----------"
   puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

#MOVE
def move(board, position, character = "X") #used to be def move(board, position, character = "X")
  board [position.to_i - 1] = character
end



end
