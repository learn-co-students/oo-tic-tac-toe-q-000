class TicTacToe

   def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end


WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]
]

  def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

  def position_taken?(position)
  if @board[position] == " " || @board[position] == "" || @board[position] == nil
    false
  else
    true
  end
end

def valid_move?(position)
  if position_taken?(position.to_i - 1) == true
    false
  elsif position.to_i - 1 > 9 || position.to_i - 1 < 0
    false
  else
    true
  end
end

def move(location, player="X")
  @board[location.to_i - 1] = player
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
plays=0
@board.each do |turn|
  if turn == "X" || turn == "O"
  plays += 1
end
end
return plays
end


def current_player
  if turn_count.even?
    return "X"
  else
    return "O"
  end
end

def won?
  WIN_COMBINATIONS.each do |win_mix|
    win_index_1 = win_mix[0]
    win_index_2 = win_mix[1]
    win_index_3 = win_mix[2]

    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_mix
    end
    end
else
  return false
end

def full?
  if @board.include? (" ")
    return false
end
else
  return true
end

def draw?
  !won? && full?
end

def over?
  won? || draw?
end

def winner
  if won?
    @board[won?[0]]
  end
end


def play
  until over? do
    turn
  end

  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cats Game!"
  end
end


end





