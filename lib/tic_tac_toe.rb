class TicTacToe
  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} " 
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "  
  end

WIN_COMBINATIONS =[
  [0,1,2],[0,3,6],[1,4,7],[2,5,8],[3,4,5],[6,7,8],[0,4,8],[6,4,2]]
  
  def move(position, player)
  
  @board[(position.to_i)- 1] = player
end

def position_taken?(position)
  position = position.to_i
  if @board[position] == " " || @board[position] == "" || @board[position] == nil
    false
  elsif @board[position] == "X" || @board[position] == "O"
    true
  end
end
  def valid_move?(position)
    position = position.to_i
  if position.between?(1,9) && !position_taken?(position -1) 
    true
  end
end
def turn
  puts "Please enter 1-9:"
  position = gets.strip
  if valid_move?(position)
    move(position, player = current_player)
    display_board
  else
    puts "Please enter 1-9:"
    position = gets.strip
  end
end

def current_player
    if turn_count % 2 == 0
     "X"
    else
     "O"
    end
end

def turn_count
  
  count = 0
  @board.each do |math|
    if math == "O" || math == "X"
    count += 1
  end
end
count
end

def won?
  
WIN_COMBINATIONS.detect do |a|
    (a.all?{|position| @board[position] == "X"}) || (a.all?{|position| @board[position] == "O"})

end

end

def full?
if @board.any? {|bb| bb.strip.empty?}
false
else
true
end
end

def draw?
if full? && !won?
  true
end
end

def over?
 if full? || draw? || won?
  true
end
end

def winner
  whowin=won?
if whowin
 @board[whowin[0]]

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
end
