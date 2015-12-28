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

def move(position, char = "X")
     @board[position.to_i - 1] = char
end
   # If having trouble later check here
def position_taken?(position)
     !@board[position].include?(" ")
end
 
def valid_move?(position)
     position = position.to_i - 1
     position.between?(0, 8) && !position_taken?(position)
end
 
def turn 
     puts "Please enter 1-9:"
     input = gets.chomp
 
     if valid_move?(input)
       move(input, current_player)
     else
       until valid_move?(input) == true
         turn
         break
       end
     end
end
 
def turn_count
     @board.count {|x| x == "X" || x == "O"}
end
 
def current_player
     if turn_count.even?
       "X"
     else
       "O"
     end
end
 
def won?
     WIN_COMBINATIONS.detect do |x|
      (@board[x[0]] == "X" &&
       @board[x[1]] == "X" &&
       @board[x[2]] == "X") ||
     (@board[x[0]] == "O" &&
       @board[x[1]] == "O" &&
       @board[x[2]] == "O") &&
       position_taken?(x[0])
     end
end
 
def full?
     @board.all? {|x| x == "X" || x == "O"}
end
 
def draw?
     full? && !won?
end
 
def over?
     won? || full? || draw?
end
 
def winner
     if won?
       victor = won?
       @board[victor[0]]
     end
end
 
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
 
 
   WIN_COMBINATIONS = [
      [0, 1, 2],
     [3, 4, 5],
     [6, 7, 8],
     [0, 3, 6],
     [1, 4, 7],
     [2, 5, 8],
     [0, 4, 8],
     [6, 4, 2]
]
 
 
 end