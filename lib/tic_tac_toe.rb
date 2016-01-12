class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
  ]

# Helper Method
def position_taken?(location)
  !(@board[location].nil? || @board[location] == " ")
end

def won?
  WIN_COMBINATIONS.each do |x|
    win_index_1 = x[0]
    win_index_2 = x[1]
    win_index_3 = x[2]

    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return x.to_a
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return x.to_a
  end
 end
  return nil
end

def full?
  !@board.any?{|x| x == " " || x == "" }
end

def draw?
  !won? && full?
end

def over?
  won?||full?||draw?
end


def winner
  WIN_COMBINATIONS.each do |x|
    win_index_1 = x[0]
    win_index_2 = x[1]
    win_index_3 = x[2]

    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return "X"
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return "O"
  end
 end
  return nil
end

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} \n-----------\n #{@board[3]} | #{@board[4]} | #{@board[5]} \n-----------\n #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def move(loc,char = "X")
  @board[loc.to_i-1] = char
  return @board
end

def valid_move?(x)
  x = x.to_i
  x -= 1
  if !position_taken?(x) && x.between?(0,8)
    true
    elsif position_taken?(x) || (x > 8 || x == -1)
    false
  end
end

def turn
  puts "Please enter 1-9:"
  x = gets.chomp
  if valid_move?(x)
    turn_count % 2 == 0 ? move(x) : move(x,"O")
  else
    turn
  end
  display_board

end

def turn_count
  x = @board.select do |y|
    y == "X" || y == "O"
  end
  x.length
end

def current_player
  turn_count % 2 == 0 ? "X" : "O"
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

end
