class TicTacToe
  def initialize(board = nil)
      @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def move(index, character)
  @board[index - 1] = character
end

def position_taken?(index)
  if @board[index] == " " || @board[index] == "" || @board[index] == nil
    false
  elsif @board[index] == "X" || @board[index] == "O"
    true
  end
end

def valid_move?(index)
  index = index.to_i - 1
  if index.between?(0, 8) && !position_taken?(index)
    true
  else
    false
  end
end

def turn
  puts "Please enter 1-9:"
  index = gets.strip
  index = index.to_i
  if valid_move?(index) == true
    move(index, character = current_player)
    display_board
  else
    turn
  end
end

def turn_count
  @board.count{|token| token == "X" || token == "O"}
end

def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

def won?
  WIN_COMBINATIONS.each do |win_combination|
    win_combination
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
  end
end
return false
end

def full?
@board.all? do |pos|
  if pos == "X" || pos == "O"
    true
  else
    return false
end
end
end

def draw?
  won?
  if full? == true && won? == false
    true
  else
    false
  end
end

def over?
  if won? != false
    true
  elsif draw? == true
    true
  else
    false
  end
end

def winner
x = won?
if x
  index = x[0]
  position = @board[index]
  index1 = x[1]
  position1 = @board[index1]
  index2 = x[2]
  position2 = @board[index2]
  if position == "X" && position1 == "X" && position2 == "X"
    return "X"
  elsif position == "O" && position1 == "O" && position2 == "O"
    return "O"
  end
else
end
end

def play
    until over? == true
      turn
    end
    if winner == "X"
      puts "Congratulations X!"
    elsif winner == "O"
      puts "Congratulations O!"
    else
      puts "Cats Game!"
    end
end
end
