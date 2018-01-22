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
    [6,4,2],
  ]

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def move(position, character = "X")
  position = (position.to_i-1)
  @board[position] = character
end

def position_taken?(position)
  @board[position] != " " && @board[position] != ""
end

def valid_move?(position)
  position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
end

def turn
  puts "Please enter 1-9:"
  input = gets.chomp
  if valid_move?(input)
    move(input,current_player)
  else
    turn
  end
  display_board
end

def turn_count
  count = 0
  @board.each do |turn|
    if turn == "X" || turn == "O"
      count+= 1
    end
  end
  count
end

def current_player
  if turn_count % 2 == 0
    current_player = "X"
  else
    current_player = "O"
  end
end

def won?
WIN_COMBINATIONS.each do |combo|
  return combo if combo.all? {|input| @board[input] == "X" }
  return combo if combo.all? {|input| @board[input] == "O" }
end
  false
end

def full?
  !@board.include?(" ")
end

def draw?
  full? && !won?
end

def over?
    full? || draw? || won?
end

def winner
  WIN_COMBINATIONS.each do |combo|
  return "X" if combo.all? {|input| @board[input] == "X" }
  return "O" if combo.all? {|input| @board[input] == "O" }
end
  return nil
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
