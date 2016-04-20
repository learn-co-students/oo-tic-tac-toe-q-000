class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],
  [0,3,6], # Top row
  [1,4,7],  # Middle row
  [2,5,8],
  [0,4,8], # Top row
  [6,4,2]  # Middle row # ETC, an array for each win combination
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(location, current_player = "X")
     @board[location.to_i-1] = current_player
  end

def position_taken?(location)
  @board[location] != " " && @board[location] != ""
end

def valid_move?(position)
  position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
end

def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
      move(input, current_player)
      else
      turn
    end
  display_board
end

def won?
  WIN_COMBINATIONS.each do |combination|
    return combination if combination.all?{|spot| @board[spot]=="X"}
    return combination if combination.all?{|spot| @board[spot]=="O"}
  end
  return false
end

def full?
  return true if @board.all?{|x| x=="X" || x=="O"}
  return false
end

def draw?
  return true if full? && !won?
  return false
end

def over?
  return true if draw? || won? || full?
  return false
end

def winner
  return @board[won?[0]] if won?
  return nil
end
# Define your play method below

def play
  until over?
    turn
  end
  puts "Congratulations #{winner}!" if won?
  puts "Cats Game!" if draw?
end

end