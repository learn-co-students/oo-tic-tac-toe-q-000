class TicTacToe

def initialize(board = nil)
  @board = board || Array.new(9, " ")
end

WIN_COMBINATIONS = [
  [0,1,2], #Top row
  [3,4,5], #Middle Row
  [6,7,8], #Bottom row
  [0,4,8], #Top left diagnol
  [6,4,2], #Top right diagnol
  [0,3,6], #Left column
  [1,4,7], #Middle column
  [2,5,8] #Right column
]

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def move(location, player)
  position = location.to_i - 1
  update_array(@board, position, player)
end

def update_array(array, position, value)
  array[position] = value
end

def position_taken?(location)
  !(@board[location].nil? || @board[location] == " ")
end

def valid_move?(location)
  move = location.to_i - 1
  if move.between?(0,8) && !position_taken?(move)
    true
  else   
    false
  end
end

def turn
puts "Please enter 1-9:"
input = gets.strip
if valid_move?(input)
  move(input, find_player)
  else
    turn
  end
  display_board
end

def find_player
   if !turn_count.even?
      "O"
    else 
      "X"
    end
end

def turn_count
  occupied_positions = 0
  @board.each do |position|
    if position == "X" || position == "O"
      occupied_positions += 1
    end
  end
  return occupied_positions
end

def current_player
  occupied_positions = turn_count
  occupied_positions.even? ? "X":"O"
end

def won? 
  if @board == [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    return false
  end
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]
    if position_1 == "X" && position_2 == "X" && position_3 == "X" || 
       position_1 == "O" && position_2 == "O" && position_3 == "O"
      return [win_index_1, win_index_2, win_index_3]
    end
  end
  return false
end

def full?
  @board.each_with_index do |pos, i|
    if !position_taken?(i)
      return false
    end
  end

  return true
end

def draw?
  if won?
    return false
  elsif full?
    return true
  end
end

def over?
  if won? || draw?
    return true
  elsif !full?
    return false
  end
end

def winner
  if won?
    return @board[won?[0]]
  end
end

def play
  while !over? do
    turn
  end
  if won?
    puts "Congratulations " + winner + "!"
  end
  if draw?
    puts "Cats Game!"
  end
end 

end
