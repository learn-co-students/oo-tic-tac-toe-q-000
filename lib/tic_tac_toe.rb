class TicTacToe

def initialize
  @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
end

def display_board 
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

WIN_COMBINATIONS = [
  [0, 1, 2], #top row
  [3, 4, 5], #middle row
  [6, 7, 8], #bottom row
  [0, 3, 6], #first column
  [1, 4, 7], #second column
  [2, 5, 8], #third column
  [0, 4, 8], #first diagonal
  [6, 4, 2]  #second diagonal
]

def move(location, character = 'X')
    location = location.to_i - 1
    @board[location] = character
end

def position_taken?(position)
  if @board[position] == " " || @board[position] == "" || @board[position] == nil
    return false
  else
    return true
  end
end

def valid_move?(position)
  position = position.to_i 
  if position.between?(1,9) && !position_taken?(position - 1)
     return true
  else 
     return false
  end
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  if valid_move?(input)
    move(input, current_player)
  else
  input = gets.strip
  end
  display_board
end

def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

def turn_count
  counter = 0
  @board.each do |element|
  if element != " " 
    counter+=1 
  end
end
  counter
end

def won?
   TicTacToe::WIN_COMBINATIONS.detect do |numbers|
     if numbers.all? { |position| @board[position] == "X"  }
      return numbers
     elsif numbers.all? { |position| @board[position] == "O"  }
      return numbers
     else
      false
     end
  end
end

def full?
  @board.all? { |position| position == "X" || position == "O" }
end

def draw?
if won?
  return false
else
  @board.all? do |position|
      position == "X" || position == "O"
   end
 end 
end

def over?
  if won? || full? || draw?
    return true
  end
end

def winner
  if won?
    if @board[won?[0]] == "X"
      return "X"
      else 
      return "O"
    end
    else draw?
        return nil
    end
  end

def play
until over?
  turn
end
if draw?
  puts "Cats Game!"
else 
  puts "Congratulations #{winner}!"
end
end

end













