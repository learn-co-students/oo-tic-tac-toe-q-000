class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
[0,1,2], #top row
[3,4,5], #middle row
[6,7,8], # bottom row
[0,3,6], #first column
[1,4,7], #second column
[2,5,8], #third column
[0,4,8], #first diagonal
[2,4,6], #second diagonal
]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, char = "X")
    @board[position.to_i - 1] = char
  end

  def input_to_index
    user_input = gets.strip.to_i - 1
  end

  def position_taken?(position)
  !(@board[position].nil? || @board[position] == " ")
end

# code your #valid_move? method here
def valid_move?(position)
  position = position.to_i - 1
 if position_taken?(position) == false && position.to_i.between?(0, 8)
  return true
elsif position_taken?(position) == true
  return false
else 
  return false
end
end

def turn
  puts "Please enter 1-9:"
  position = gets.strip
  if valid_move?(position) == true
    move(position, current_player)
    else 
    until valid_move?(position) == true
    puts "Invalid move.  Please select an unoccupied position on the board."
    position = gets.strip
   end
  end
  display_board
end

def turn_count
  @board.count{|token| token == "X" || token == "O"}
end

def current_player
  turn_count % 2 == 0 ? "X" : "O"
  end

def won?
 WIN_COMBINATIONS.detect do |wins|
    @board[wins[0]] == @board[wins[1]] &&
    @board[wins[1]] == @board[wins[2]] &&
    position_taken?(wins[0])
  end
end

def full?
  @board.none? {|p| p == nil || p == "" || p == " "} ? true : false
end

def draw?
  !won? && full? ?  true : false
end

def over?
  won? || full? || draw? ? true : false
end

def winner
  if winning_combo = won?
    @board[winning_combo.first]
  end
end

def play
  until over?
      turn
  end
      if won?
      puts "Congratulations #{winner}!"
      elsif draw? == true
      puts "Cats Game!"
      end
end
end