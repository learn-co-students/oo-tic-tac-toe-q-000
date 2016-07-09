
class TicTacToe
  def initialize(board= nil)
    @board = board || Array.new(9, " ")
  end


def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end


def move(index, current_player = "X")
  index = index - 1
  @board[index] = current_player
end

def turn
  puts "Please enter 1-9:"
  index = gets.strip
  index = index.to_i

  if valid_move?(index)
    move(index, current_player)
    display_board
  else
    turn
  end
end

def valid_move?(index)
  index = index.to_i
 index = index - 1
 index.between?(0,8) && !position_taken?(index)
 end

def position_taken?(index)
  @board[index] != " " && @board[index] != ""
  end

def turn_count
     counter = 0
     @board.each do |element|
     if element == "X" || element == "O"
    counter += 1
     end
    end
      counter
  end

def play
until over? || draw?
  turn
end
  if won?
    puts "Congratulations #{winner}!"
  else draw?
    puts "Cats Game!"
    end
  end

def current_player
  turn_count % 2 == 0 ? "X" : "O"
end


     WIN_COMBINATIONS = [
       [0,1,2],
       [3,4,5],
       [6,7,8],
       [0,3,6],
       [1,4,7],
       [2,5,8],
       [0,4,8],
       [2,4,6],
   ]

   def won?
     board_x = @board.each_index.select {|i| @board[i] == "X"}
     board_o = @board.each_index.select {|i| @board[i] == "O"}
     WIN_COMBINATIONS.each do |win_combination|
       if win_combination.all?{|w| board_x.include?(w)} || win_combination.all?{|w| board_o.include?(w)}
         return win_combination
     end
   end
   return false
   end

   def full?
     @board.all? do |index|
       index != " "
     end
   end

   def draw?
     if !won? == true && full? == true
       return true
     else
       return false
     end
   end

   def over?
     won? || full? || draw?
   end

   def winner
     if won?
     @board[won?[0]]
     end
   end
end
