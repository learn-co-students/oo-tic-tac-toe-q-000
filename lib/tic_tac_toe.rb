class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,3,6], # Left column
    [1,4,7], # Middle column
    [2,5,8], # Right column
    [0,4,8], # Top-left to bottom-right diagonal
    [6,4,2]  # Top-right to bottom-left diagonal
   ]

  def board
    @board
  end

  def move(board, location, char="X")
    @board[location.to_i-1] = char
  end

=begin
  def current_player
    turn_count(@board).even? ? "X" : "O"
  end

  def turn_count
    @board.count{|token| char == "X" || char == "O"}
  end
=end

end
