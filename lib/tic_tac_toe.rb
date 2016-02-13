class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle
  [6,7,8], #bottom
  [0,3,6], #left down
  [1,4,7], #middle down
  [2,5,8], #right down
  [0,4,8], # diagonal down
  [6,4,2] # diagonal up
  ]

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def move(location, token = "X")
  @board[location.to_i-1] = token
end

def position_taken?(position)
  if (@board[position] ==  " " || @board[position] == "" || @board[position] == nil)
     taken = false
  else
     taken = true
 end
end


def valid_move?(position)
  if position.to_i.between?(1,9)
    if !position_taken?(position.to_i-1)
      true
   end
end

position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
end


def turn
  puts "Please enter 1-9:"
  input = gets.strip
  if valid_move?(input)
    move(input, current_player)
    display_board
  else
    turn
  end
end

def turn_count
  count = 0
  @board.each do |token|
    if token == "X" || token == "O"
    count += 1
  end
end
  return count
end

def current_player
  if turn_count % 2 == 0
    return "X"
  else
    return "O"
  end
end

def won?
   WIN_COMBINATIONS.find do | win_combination |

    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    else
      false
    end
  end
end

def full?
  @board.all?{|token| token == "X" || token == "O"}
end

def draw?
  full? && !won?
end

def over?
  won? || full? || draw?
end

def winner
  if winning_combo = won?
    @board[winning_combo.first]
  end
end

def play
  until over?
    turn
end

if won?
    puts "Congratulations #{winner}!"
else draw?
    puts "Cats Game!"
  end
end
end

