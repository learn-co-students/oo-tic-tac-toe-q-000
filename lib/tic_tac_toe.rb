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
  [6,4,2]
]

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def move(input,character = "X")
  input = input.to_i
  @board[input-1] = character
end

def position_taken? (position)
  if @board[position] == " " || @board[position] == "" || @board[position] == nil
    return false
  else
    return true
  end
end

def valid_move?(position)
  position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
end

def turn
  puts "Please enter 1-9:"
  position = gets.strip
  if valid_move?(position) == true
    input = current_player
    move(position,input)
    display_board
  else
    puts "Invalid move"
    turn
  end
end

def turn_count
  count = 0
  @board.each do |counter|
    if counter == "X" || counter == "O"
      count += 1
    end
  end
  count
end

def current_player
  if turn_count.even?
    "X"
  else
    "O"
  end
end

def won?
  WIN_COMBINATIONS.detect do |array|
    array.all? {|input| @board[input] == "X"} || array.all? {|input| @board[input] == "O"}
  end
end

def full?
  if @board.any? {|input| input == " "}
    false
else
  true
end
end

def draw?
  unless won? || full? ==  false
    return true
  end
end

def over?
  if full? == false
    return false
  else
    return true
  end
end

def winner
  if won?
    if WIN_COMBINATIONS.detect {|array| array.all? {|input| @board[input] == "X" }}
      return "X"
    else
      return "O"
    end
  end
end

def play
until over? || won? || draw?
turn
end
if won?
  puts "Congratulations #{winner}!"
elsif draw?
puts "Cats Game!"
end
end
end