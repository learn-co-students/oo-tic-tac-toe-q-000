class TicTacToe

def initialize (board = nil)
@board = board || Array.new(9, " ")
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

def display_board
puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
puts "-----------"
puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
puts "-----------"
puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end


def move(position, character)
  input = position.to_i - 1
  @board[input] = character
end

def position_taken?(position)  
  if @board[position] == "X" || @board[position] == "O" 
    return true
  else
    false
  end
end

def valid_move?(position)
  position = position.to_i - 1
  if position.between?(0,8) && !position_taken?(position)
    return true
  else
    return false
  end
end

def turn
  puts "Please make a selection between 1-9"
  position = gets.chomp
  if valid_move?(position)
    move(position, current_player)
    display_board
  else
    puts "Please make a valid input"
    turn
  end
end

def current_player
if turn_count % 2 == 0
  return "X"
else
  "O"
end
end

def turn_count
@board.count{|token| token == "X" || token == "O"}
end



def won?
WIN_COMBINATIONS.detect do |win_combination|
    
  $position_1 = @board[win_combination[0]] 
  $position_2 = @board[win_combination[1]] 
  $position_3 = @board[win_combination[2]] 

  if $position_1 == "X" && $position_2 == "X" && $position_3 == "X" || 
    $position_1 == "O" && $position_2 == "O" && $position_3 == "O" 

    return win_combination # return the win_combination indexes that won.
  
  else
    false
end
end
end


def full?
@board.each do |i|
  if i == "" || i == " " || i == nil
    return false
  else
    true
  end
end
end

def draw?
if !won? && full?
  return true
else
  false
end
end

def over?
if won? || draw? || full?
  return true
else
  false
end
end

def winner
if won? && $position_1 == "X"
  return "X"
elsif won? && $position_1 == "O"
  return "O"
else 
  nil
end
end

def play
  until over?
    turn
  end
  if won?
  puts "Congratulations" + " " + winner + "!"
else
  puts "Cats Game!"
  end
end

end