class TicTacToe
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
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

def move(location, character = "X")
  @board[location.to_i-1] = character
end

def position_taken?(position)
 @board[position] != "" || @board[position] == " "
 if @board[position] == "" || @board[position] == " "
  false
   elsif @board[position] == "X" || @board[position] == "O"
   true
   elsif @board[position] == nil
   false
 end
end

def valid_move?(position)
  position = position.to_i
  position -= 1
  (position.between?(0,8)) && !(position_taken?(position))
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
  WIN_COMBINATIONS.each do |wc|
    p1 = @board[wc[0]]
    p2 = @board[wc[1]]
    p3 = @board[wc[2]]

    if (p1 == "X" && p2 == "X" && p3 == "X") || (p1 == "O" && p2 == "O" && p3 == "O")
      return wc
    end
  end
  return false
end


def full?
  @board.none?{|position| position == " "}
end

def draw?
  !won? && full?
end


def over?
  won? || draw? || full?
end

def winner
won = won?
  if won.class == Array
  return @board[won[0]]
end
end

def play
until over?
  turn
end
if won?
  puts "Congratulations #{winner}!"
end
if draw?
 puts "Cats Game!"
end
end
end