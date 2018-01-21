class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

# WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6], # Left column
  [1,4,7],  # Middle column
  [2,5,8],  # Right column
  [0,4,8],  # Left top diagonal
  [6,4,2]  # Right top diagonal 
]
  # Displays current instance of board variable
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  #move
def move (input, current_player = "X")
  position = input.to_i - 1
  @board[position] =  current_player
  # def update_array_at_with(array, position, current_player)
  #   array[position] = current_player
  # end
  # update_array_at_with(board, position, current_player)
end

#position_taken? T/F
def position_taken?(position)
     if @board[position] == "  " || @board[position] == " " || @board[position] == "" || @board[position] == nil
         false
     elsif @board[position] == "X" || @board[position] == "O"
         true
      end
    end
 # valid_move? T/F
  def valid_move?(position)
    current_move = position.to_i-1
    if !position_taken?(current_move) && current_move.between?(0, 8)
      return true
    else
      false
    end
  end

  #Single complete turn
  def turn 
  # ask for input
  puts "Please enter 1-9:"
  # show the board
  display_board
  # get input
  input = gets.strip
    # ask for input again until you get a valid input
    until valid_move?(input)
      puts "Invalid entry. Try again!"
      input = gets.strip
    end
  move(input, value=current_player)   

end

#returns number of turns played based on @board
def turn_count
  counter = 0
   @board.each do |move|
    if move == "X" || move == "O"
      counter += 1
    end
  end
  counter
end

#returns current player based on #turn_count
def current_player
  if turn_count % 2 == 0
    return "X"
  else
    return "O"
  end
end

# game loop
def play
  until over?
    turn
  end
  if winner != nil
    puts "Congratulations #{winner}!"
  else 
    puts "Cats Game!"
  end
end

def won?
  WIN_COMBINATIONS.detect do |combos| 
    @board[combos[0]] == @board[combos[1]] &&
    @board[combos[1]] == @board[combos[2]] &&
    position_taken?(combos[0])
    end
end

def full?
  @board.all?{|i| i == "X" || i == "O"}
end

def draw?
  full? && !won?
end

def over?
  won? || full? || draw?
end

def winner
  if winner_combo = won?
    @board[winner_combo.first]
  end
end

end #End of class