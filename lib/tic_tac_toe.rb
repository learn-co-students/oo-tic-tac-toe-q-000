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
   [0,1,2],
   [3,4,5],
   [6,7,8],
   [0,3,6],
   [1,4,7],
   [2,5,8],
   [0,4,8],
   [6,4,2]
 ]

def play
  until over?
    turn
end

  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cats Game!"
  end
end

def move(position, token = "X")
  @board[position.to_i-1] = token
end

def valid_move?(position)
  if position.to_i.between?(1,9) && !position_taken?(position.to_i-1) 
    true
  else
    false
  end
end

def position_taken?(position)
  if @board[position] == " " || @board[position] == "" || @board[position] == nil
    false
  else
    true
  end
end

def won?
  WIN_COMBINATIONS.detect do |win_combo|
    @board[win_combo[0]] == "X"  && @board[win_combo[1]] == "X" && @board[win_combo[2]] == "X" || @board[win_combo[0]] == "O"  && @board[win_combo[1]] == "O" && @board[win_combo[2]] == "O"
  end
end
 
def full?
  @board.all?{|token| token == "X" || token == "O"}
end
 
def draw?
  full? && !won?
end
 
def over?
  won? || full? || draw?
end

def current_player
  turn_count % 2 == 0 ? "X" : "O"
end
 
def turn_count
  @board.count{|token| token == "X" || token == "O"}
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  if valid_move?(input)
    move(input, current_player)
    display_board
  elsif
    turn
  end
end
 
def winner
  if winning_combo = won?
  @board[winning_combo.first]
  end
end

end


