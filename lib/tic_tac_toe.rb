class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def board= (board)
    @board = board
  end

  def board
    @board
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

def turn
  puts "Please enter 1-9:"
  play = gets.strip
  until valid_move?(play)
    puts "That isn't a valid move, please play again!"
    play = gets.strip
  end
  move(play,current_player)
  display_board
end

def turn_count
  turns_played = 0
  @board.each do |each_turn|
    if each_turn == "X" || each_turn == "O"
      turns_played = turns_played +1
    end
  end
  return turns_played
end

def current_player
  if turn_count.odd?
    return "O"
  else
    return "X"
  end
end

def move(loc,char = "X")
  board[loc.to_i-1] = char
end

def valid_move?(position)
  if position_taken?(position.to_i-1)
    return false
  elsif !((position.to_i >= 1) && (position.to_i <= 9))
    return false || nil
  else
    return true
      end
end

def position_taken?(position)
  if (@board[position] == "") || (@board[position] == " ") || (@board[position] == nil)
    return false
  elsif (@board[position] == "X") || (@board[position] == "O")
    return true
    end
end

def play
until over? do
    turn
    winner = won?
  end
  if won?
    puts "Congratulations #{winner}!"
   else
     puts "Cats Game!"
  end
end

def position_taken? (location)
  !(@board[location].nil? || @board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8], #bottom row
  [0,3,6], #left col
  [1,4,7], #mid col
  [2,5,8], #right col
  [0,4,8], # left diag
  [6,4,2], #right diag
  ]


def won?
  WIN_COMBINATIONS.detect do |yes|
    (@board[yes[0]] == @board[yes[1]]) && (@board[yes[0]] == @board[yes[2]]) && ((@board[yes[0]] == "X") || (@board[yes[0]] == "O"))
  end
end

def full?
  result = @board.detect {|fullness| fullness == " "}
  if result == " "
    return false
  else
    return true
  end
end

def draw?
  if won? == nil && full? == true
    return true
  else
    return false
  end
end
def over?
  if won?
    puts "Congratulations #{winner}!"
  return true
  elsif draw?
    puts "Cats Game!"
  return true
  elsif full?
    puts "full"
    else
    return false
  end
end

def winner
  result = won?
  if result != nil
    return @board[result[0]]
  else
    return nil
  end
end
end



