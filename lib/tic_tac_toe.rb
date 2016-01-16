class TicTacToe

  attr_accessor :board
  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8], # Top left to bottom right
  [6,4,2]  # Top right to bottom left
    ]

def initialize(board = nil)
  @board = board || Array.new(9, " ")
end

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def move(input, player="X")
  @board[input.to_i-1] = player
end

def position_taken?(position)
  !(@board[position] == "" || @board[position] == " " || @board[position] == nil)
end

def valid_move?(position)
  position.to_i.between?(1,9) && !(position_taken?(position.to_i-1))
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

def turn_count
  turns_taken = 0
  @board.each do |count|
  if count == "X" || count == "O"
    turns_taken +=1
  end
end
  turns_taken
end

def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

def won?
    WIN_COMBINATIONS.find do |win_line|
    @board[win_line[0]] == @board[win_line[1]] &&
    @board[win_line[1]] == @board[win_line[2]] &&
    win_line.all? { |counter| @board[counter] == "X" } || win_line.all? { |counter| @board[counter] == "O" }
  end
end

def full?
  @board.all? { |counter| counter == "X" || counter == "O"}
end

def draw?
  !won? && full?
end

def over?
  won? || full? || draw?
end

def winner
  if won?
  @board[won?[0]]
  end
end

def play
  while !over?
    turn
  end
  if draw?
    puts "Cats Game!"
  end
  if won?
    puts "Congratulations #{winner}!"
  end
end

end