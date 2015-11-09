class TicTacToe
  def initialize(board=[" "," "," "," "," "," "," "," "," "])
    @board = board
  end

  WIN_COMBINATIONS = [
 [0,1,2], [3,4,5], [6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]


 def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} " 
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} " 
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} " 
end

def move(position, char="X")
  @board[position.to_i - 1]= char
  display_board
end

def position_taken?(position)
  !(@board[position].nil? || @board[position] == " ")
end

def valid_move?(position) 
  position = position.to_i
  position.between?(1,9) && position_taken?(position-1) == false
end

def turn
  puts "Please enter 1-9:"
  position = gets.strip
  if valid_move?(position)
    move(position,current_player)

  else
    turn
  end
end

def turn_count
    tc=0
    counter=0
    while counter<= @board.length-1
    if position_taken?(counter)
       tc +=1
    end
    counter+=1
  end
  tc
end


def current_player
  if turn_count.even?
      "X"
   else
    "O"
  end
end

def won?
  WIN_COMBINATIONS.detect do |combo|
   @board[combo[0]] == @board[combo[1]] &&
   @board[combo[1]] == @board[combo[2]] &&
   position_taken?(combo[0])
  end
end

def full?
  @board.all?{|token| token == "X" || token == "O"}
end

def draw?
  full? && !won?   
end

def over?
  won? || full?
end

def winner
  if winning_combo = won?
    puts "Congratulations #{@board[winning_combo.first]}!"
    @board[winning_combo.first]
  else
    puts "Cats Game!"
  end

end

def play
  
  until over? || draw?
    turn
end
winner

end

end


