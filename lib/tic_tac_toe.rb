

class TicTacToe

 def initialize(board = nil)
   @board = board || Array.new(9, " ")
 end

  WIN_COMBINATIONS = [
  [0,1,2],[3,4,5],[1,4,7],[2,5,8],[0,3,6],[6,7,8],[0,4,8],[6,4,2]
  ]

  def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def current_player
  if turn_count % 2 == 0
    "X"
  else
    "O"
  end
end

def turn_count
  counter = 0
  @board.each do |choices|
    if "#{choices}" == "X" || "#{choices}" == "O"
      counter += 1
    end
  end
  counter
end


def move(position, current_player=current_player)
  @board[position.to_i-1] = current_player
end

def position_taken?(position)
  @board[position] != " " && @board[position] != ""
end

def valid_move?(position)
  position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
end

def turn
  puts "Please enter 1-9:"
  input = gets
  if valid_move?(input)
    move(input)
  else
    turn
  end
  display_board
end





def full?

  @board.each do |positions|
    if positions == " "
      return false
    else
      true
    end
  end
end

def draw?
  if won?
    false
  else if full?
    true
    return true
  else
    false
  end
end
end

def won?

WIN_COMBINATIONS.detect do |win_combination|

    position_1 = @board[win_combination[0]]
    position_2 = @board[win_combination[1]]
    position_3 = @board[win_combination[2]]

    if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")

      return [win_combination[0],win_combination[1],win_combination[2]]
  else
      false
  end
  end
end


def over?
  if won?
    true
  else if draw?
    true
  else if full?
    true
    return true
  else false
  end
end
end
end

def winner
  win = won?
  if won?
    true
    return @board[win[0]]
  end
end

def play
  while over? != true
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cats Game!"
  end
end


end






