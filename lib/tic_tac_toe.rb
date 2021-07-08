class TicTacToe
  def initialize(board = nil)
    @board = Array.new(9, " ")
  end
WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def move(location, current_player = current_player(@board))
  @board[location.to_i-1] = current_player
end

def position_taken?(location)
  @board[location] != " " && @board[location] != ""
end

def valid_move?(position)
  position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  if valid_move?(input)
    move(input)
  else
    turn
  end
  display_board
end

def turn_count
  count = 0
  @board.each do |space|
    if space == "X" or space == "O"
      count += 1
    end
  end
  return count
end


def current_player(current_player = "X")
  if turn_count % 2 == 0
    return "X"
  else
    return "O"
  end
end

def won?
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]
    if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    end
  end
  return false
end

def full?
  @board.each do |space|
    if space == " "
      return false
    else
    end
  end
  return true
end

def draw?
  if !won? && full?
    return true
  end
end

def over?
  if won? || draw? || full?
    return true
  end
end

def winner
  if won? && @board[won?[0]] == "X"
    return "X"
  elsif won? && @board[won?[0]] == "O"
    return "O"
  else
    return nil
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
