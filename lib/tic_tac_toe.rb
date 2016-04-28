class TicTacToe
  def initialize
    @board = [" ", " ", " ", " " , " "," " , " ", " ", " "]
  end

WIN_COMBINATIONS =[ [0,1,2], [3,4,5], [6,7,8], [0,4,8], [1,4,7], [0,3,6], [2,5,8], [6,4,2] ]

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def move(position, value = "X")
  @board[position.to_i - 1] = value
end

def position_taken?(location)
  !(@board[location].nil? || @board[location] == " ")
end

 def valid_move?(position)
  position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
 end

def turn
  puts "Please enter 1-9:"
  position = gets.strip
  if valid_move?(position)
   move(position, current_player)
  else
    turn
  end
  display_board
end

def turn_count
  counter = 0
  @board.each do |index|
    if index == "X" || index == "O"
      counter += 1
    end
  end
  counter
end

def current_player
  if turn_count % 2 == 0
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
  @board.each do |board_position|
    if board_position == " "
      return false
    end
  end
end
def draw?
  !won? && full?
end

 def over?
  won? || draw?
 end

 def play
  while !over?
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cats Game!"
  end
end

def winner
  if winning_combo = won?
    @board[winning_combo.first]
  end
end
end
