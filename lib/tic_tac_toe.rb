
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
def move(location, character = "X")
  @board[location.to_i - 1] = character
end

#position_taken
def position_taken?(position)
   if @board[position] == " "|| @board[position] == "" || @board[position] == nil
    false
  elsif @board[position] == "X" || @board[position] == "O"
    true
  end
end

#Valid_move
def valid_move?(position)
  position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
end

#TURN
def turn              #get input
  puts "Please enter 1-9:"
  input = gets
  if valid_move?(input) #validate the move #used to be
    move(input)
    else
turn
  end
  display_board
end

#TURN_COUNT
def turn_count  #defines the #turn_count method
  counter = 0  #sets counter or count of turns to 0
  @board.each do |position| #implementing iterator #each to loop over the elements of the board array
    if position == "X" || position == "O"
      counter += 1
    end
  end
  counter
end

#CURRENT_PLAYER
def current_player

  if turn_count.odd?
    "O"
  else turn_count.even?
    "X"
  end
end

#WONwin
def won?
  WIN_COMBINATIONS.each do| position |
    if @board[position[0]] == "X" && @board[position[1]] == "X" && @board[position[2]] == "X" || @board[position[0]] == "O" && @board[position[1]] == "O" && @board[position[2]] == "O"
      return position
    end
  end
  false
end

#FULL
def full?
  @board.all? {|position| position == "X" || position == "O"} #all board is full with x or o
 # return true if every element in the board contains either an "X" or an "O"
end

#DRAW
def draw?
  if !won? && full?
    true
   else
      false
  end
end

#OVER
def over?
  if full? && won? || draw?
    true
  end
end

#WINNER
def winner
  if won? == false
    nil
  else @board[won?[0]]
  end
end

#Play
def play
  while !over?
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "A draw!"
end
end

end
