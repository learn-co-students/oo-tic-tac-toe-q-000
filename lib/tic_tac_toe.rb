class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
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


def input_to_index(user_input)
  user_input.to_i - 1
end

def move(index, current_player)
  @board[index-1] = current_player
end


def position_taken?(index)
  !(@board[index.to_i].nil? || @board[index.to_i] == " ")
end


def valid_move?(index)
  index.to_i.between?(0,8) && !position_taken?(index.to_i)
end


def turn
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(index)
    move(index, current_player)
    display_board
  else
    turn
  end
end


def turn_count

counter = 0
@board.each do |spaces|

  if spaces == "X" || spaces == "O"
    counter += 1

  else
counter += 0

  end
end
counter
end


def current_player
  if turn_count.even?
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

  if position_1 == "X" && position_2 == "X" && position_3 == "X"
    return win_combination
  elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
    return win_combination
  else
    false

end
end
false
end


def full?
  @board.all? do |spaces|
  if  spaces == "X" || spaces == "O"
  true

else
  false

  end
end
end


def draw?
  if !won? && full?
true
else
  false
end
end


def over?
if won? || full? || draw?
  true
else
false
end
end


def winner
if !won?
return nil

else
  @board[won?[0]]
end
end


def play

  until over?
turn
end

if won?
  puts "Congratulations #{winner(@board)}!"

else
  puts "Cats Game!"


end
end

end
