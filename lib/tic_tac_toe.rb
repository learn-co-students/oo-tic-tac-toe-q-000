class TicTacToe

  def initialize(board = "nil")
    @board = Array.new(9, " ")
  end


WIN_COMBINATIONS = [
 [0,1,2], #top row win
 [3,4,5], #middle row win
 [6,7,8], #bottom row win
 [0,3,6], #left column win
 [1,4,7], #middle column win
 [2,5,8], #right column win
 [0,4,8], #diagonal \ win
 [2,4,6] #diagonal / win
]

def display_board
puts  " #{@board[0]} | #{@board[1]} | #{@board[2]} "
puts  "-----------"
puts  " #{@board[3]} | #{@board[4]} | #{@board[5]} "
puts  "-----------"
puts  " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def move(input, character = "X")
  @board[input.to_i - 1] = character
end

def position_taken?(input)
  !(@board[input].nil? || @board[input] == " ")
end

def valid_move?(input)
  if input.to_i.between?(1, 9) && @board[input.to_i - 1] == " "
     return true
   else
      return false
end
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
if valid_move?(input)
  move(input, character = current_player)
  display_board
else
  turn
end
  end




def turn_count
    counter = 0
    @board.each do |current_move|
  if current_move == 'X' || current_move == 'O'
    counter += 1
    end
  end
  counter
end

def current_player
  turn_count
  if turn_count % 2 == 0
    return "X"
  else
    return "O"
  end
end


def won?
  (WIN_COMBINATIONS).any? do |win_combination|
  if @board[win_combination[0]] == "X" && @board[win_combination[1]] == "X" && @board[win_combination[2]] == "X" ||
      @board[win_combination[0]] == "O" && @board[win_combination[1]] == "O" && @board[win_combination[2]] == "O"
  return win_combination
  else
  false
end
end
end


def full?
  @board.all? do |index|
   index == "X" || index == "O"
end
end


def draw?
full? && !won?
end


def over?
won? || draw?
full?
end



def winner
if win_combination = won?
return @board[win_combination.first]

end
end


def play
  until over?
    turn
end
  if won?
   puts "Congratulations #{winner}!"
else
   draw?
  puts "Cats Game!"
end
end



end
