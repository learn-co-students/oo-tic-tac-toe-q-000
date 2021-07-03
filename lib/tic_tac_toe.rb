class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end 


WIN_COMBINATIONS = [
  [0,1,2], # Top Row
  [3,4,5], # Middle Row
  [6,7,8], # Bottom Row 
  [0,3,6], # First Column
  [1,4,7], # Second Column
  [2,5,8], # Third Column 
  [0,4,8], # First Diagonal 
  [6,4,2]  # Second Diagonal
]

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def move(input, player = current_player)
  @board[(input.to_i-1)] = player
end

def position_taken?(location)
 !(@board[location].nil?) && !(@board[location] == " ")
end

def valid_move?(position)
  position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
end


def turn
  puts "Please enter 1-9:"
  input = gets.strip
  if valid_move?(input)
    move(input)
    display_board
  else
    turn
  end
end

def turn_count
  @board.count{|token| token == "X" || token == "O"}
end

def current_player
  if turn_count % 2 == 0 
     "X"
  else "O"
  end
end 

def won? 
WIN_COMBINATIONS.each do |combination| 
  pos1 = @board[combination[0]]
  pos2 = @board[combination[1]]
  pos3 = @board[combination[2]]

 if (((pos1 == pos2) && (pos2 == pos3)) && (position_taken?(combination[0])))
  return combination
else
  false
end 
end
return false  
end

def full?
  outcome = false 
  @board.each do |value| 
    if (value == "O" || value == "X")
      outcome = true 
    else return false
    end
  end
  return outcome 
end

def draw?
  if (won? == false && full? == true) 
    true
  else 
    false
  end
end 


#takes in a board and returns 
def over?
  if (won? || draw?)
    true
  else 
    false
  end
end 

def winner
  if won? == false 
    nil 
  else 
    return @board[won?[0]]
  end
end

def play
  until over? 
    turn
  end 
if won?
  return puts "Congratulations #{winner}!"
elsif draw?
  return puts "Cats Game!" 
end
end
end



