class TicTacToe
  attr_accessor :board


  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
  [6,4,2]]

  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end

  def display_board
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end
def move(pos, current_player = "X")
  board[pos.to_i-1] = current_player
end

def position_taken?(pos)
  !(board[pos] == " " || board[pos].nil?)
end

def valid_move?(pos)
  !(position_taken?(pos.to_i-1) || pos.to_i < 1 || pos.to_i > 9)
end

def turn
  display_board
  puts "Please enter 1 - 9: "
  input = gets.strip
  if !valid_move?(input)
    turn
  else
    move(input,current_player)
  end
end

def turn_count
  @board.count{|count| count == "X" || count == "O"}
end
def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

def won?
  WIN_COMBINATIONS.detect do |combo|
    position_taken?(combo[0]) && board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]]
  end
end

def full?
  board.all?{ |pos| pos == "X" || pos == "O" }
end
def draw?
  full? && !won?
end
def over?
  draw? || won?
end

def winner
  if won?
    win_array = won?
    board[win_array[1]]
  elsif draw?
    nil
  end
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