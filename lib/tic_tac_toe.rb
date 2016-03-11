class TicTacToe

  def initialize(board = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
    @board = board
  end

  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Middle column
  [0,4,8], # Decreasing diagonal
  [2,4,6], # Increasing diagonal
  ]

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def move(position, token = "X")
  @board[position.to_i - 1] = token
end

def position_taken?(position)
  !(@board[position].nil? || @board[position] == " ")
end

def valid_move?(position)
  pos = position.to_i - 1
  if !position_taken?(pos) and pos.between?(0,8)
    true
  else
    false
  end
end

def turn
  puts "Please enter 1-9:"
  position = gets.strip
  if valid_move?(position)
    move(position, current_player)
    display_board
  else
    turn
  end
end

def turn_count
  counter = 0
  @board.each do |field|
    if field == "X" or field == "O"
      counter += 1
    end
  end
  return counter
end

def current_player
  if turn_count % 2 == 0
    "X"
  else
    "O"
  end
end

def won?
  outcome = false
  WIN_COMBINATIONS.each do |win_combination|
  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]
  position_1 = @board[win_index_1]
  position_2 = @board[win_index_2]
  position_3 = @board[win_index_3]
  if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
    outcome = win_combination
  end
  end
  return outcome
end

def full?
  @board.all? do |position|
    position == "X" || position == "O"
  end
end

def draw?
  full? && !won?
end

def over?
  won? || draw? || full?
end

def winner
  if won?
    pos_to_check = won?[0]
    return @board[pos_to_check]
  end
end

def play
  while !over?
    turn
    won?
    draw?
  end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cats Game!"
  end
end


end