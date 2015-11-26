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

  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [6, 4, 2]]


def move(position, current_player="X")
  @board[position-1] = current_player
end

def position_taken?(position)
  if @board[position] == "X"
    return true
  elsif @board[position] == "O"
    return true
  elsif @board[position] == " " || "" || nil
    return false
end
end

def valid_move?(position)
  if (position.to_i.between?(1, 9)) && (position_taken?(position.to_i - 1) == false)
    return true
  else
    return false
end
end

def turn
  puts "Please enter 1-9:"
  position = gets.chomp.to_i
  while valid_move?(position) != true
    puts "Please enter 1-9:"
    position = gets.chomp.to_i
  end
  if valid_move?(position) == true
    return move(position, current_player)
    return display_board
  end
end

def turn_count
  arr = @board.select { |i| i != " "}
  return arr.length
end

def current_player
  if (turn_count) % 2 == 0
    return "X"
  else
    return "O"
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
  !(@board.include?(" "))
end

def draw?
  (full? == true) && (!won?)
end

def over?
  draw? || won?
end

def winner
  if winning_combo = won?
    @board[winning_combo.first]
  end
end

def play
  until over?
    turn
    display_board
  end
  if won? != false && winner == "X"
    puts "Congratulations X!"
  elsif won? != false && winner == "O"
    puts "Congratulations O!"
  elsif draw? == true
    puts "Cats Game!"
  end
end


end