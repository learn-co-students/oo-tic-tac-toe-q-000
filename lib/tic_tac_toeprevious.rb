class TicTacToe 
def initialize
  @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
end

WIN_COMBINATIONS=[[0, 1, 2],[3, 4, 5],[6, 7, 8],[0, 3, 6],[1, 4, 7],[2, 5, 8], [0, 4, 8], [6, 4, 2]]

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "  
end

def move(location, current_player)
  @board[location - 1] = current_player
end

def position_taken?(position)
  if @board[position] == "   " || @board[position] == " "
    return false
  else 
    return true
  end
end

def valid_move?(position)
  if position.to_i.between?(1, 9) && position_taken?(position.to_i - 1) == false
    return true
  end
end

def turn 
  x=0
  until x != 0
  puts "Please enter a number 1-9:"
  input=gets.chomp
  if valid_move?(input)
    move(input.to_i, current_player)
    x+=1
  end
end
end

def turn_count
  x=0
  @board.each do |slot|
    if slot == "X" || slot == "O"
      x+=1
    end
  end
  return x 
end

def current_player 
  if turn_count % 2 == 0
    return "X"
  else
    return "O"
  end
end

def won?
  WIN_COMBINATIONS.each do |array|
    board_elements=[]
    if @board[array[0]] != " "
    board_elements << @board[array[0]]
    board_elements << @board[array[1]]
    board_elements << @board[array[2]]
  end
if board_elements[0] == board_elements[1] && board_elements[1] == board_elements[2] && board_elements[2]
  return board_elements
end
end
return false
end

def full?
  @board.each do |slot|
  if slot != "X" && slot != "O"
    return false
  end
end
end

def draw?
  if won? == false && full? 
    return true
  else return false
  end 
end

def over?
  if draw? || won? || full?
    return true
  else
    return false
  end
end

def winner
  if won? && won?[0] != " "
    return won?[1]
end
return nil 
end


def play 
  draw?
  until over?
    turn
  end
  draw?
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cats Game!"
  end
end

end