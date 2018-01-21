class TicTacToe
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

#Define WIN_COMBINATIONS constant and set it equal to a nested array 
#filled with the index values for the various win combinations in tic tac toe.
WIN_COMBINATIONS = [ [0,1,2], #top row
                     [3,4,5], #middle row
                     [6,7,8], #bottom row
                     [0,3,6], #left column
                     [1,4,7], #center column
                     [2,5,8], #right column
                     [0,4,8], #left diagonal
                     [6,4,2]  #right diagonal
                   ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, current_player = "X")
    @board[position.to_i - 1] = current_player
  end

  # Define your #position_taken? method 
  def position_taken?(position)
    @board[position] != " " && @board[position] != "" 
  end

  # Define the valid_move? method
  def valid_move?(position)
    position.to_i. between?(1, 9) && !position_taken?(position.to_i-1)
  end

  # Define turn method here
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if !valid_move?(input) 
      turn
    end
    move(input, current_player)
    display_board
    end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

def won?
  TicTacToe::WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]
      if (position_1 == "X" && position_2 == "X" && position_3 == "X") ||
         (position_1 == "O" && position_2 == "O" && position_3 == "O") then
         puts "Congratulations #{@board[win_index_1]}!"
         puts win_combination 
         return win_combination
      end
   end
   false
end

 def full?
  @board.all?{|token| token == "X" || token == "O"}
end

def draw?
  !won? && full?
end

def over?
  if (full? == true || draw? == true || won? != false) then
    true
  end
end 

 def winner
  if won? != false then
   TicTacToe::WIN_COMBINATIONS.each do |win_combination|
     win_index_1 = win_combination[0]
     win_index_2 = win_combination[1]
     win_index_3 = win_combination[2]
     position_1 = @board[win_index_1]
     position_2 = @board[win_index_2]
     position_3 = @board[win_index_3]
      if (position_1 == "X" && position_2 == "X" && position_3 == "X") ||
         (position_1 == "O" && position_2 == "O" && position_3 == "O") then
         return position_1
     
     end
    end
  end

end
 
 # Define play method
def play
 while !over?
    turn
    current_player
  end
  won?
  if draw? then puts "Cats Game!"
  end
end


end