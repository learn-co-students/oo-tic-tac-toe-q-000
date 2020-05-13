class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
  [0,1,2], #Top row
  [3,4,5], #Middle row
  [6,7,8], #Bottom row
  [0,3,6], #Vertical 1
  [1,4,7], #Vertical 2
  [2,5,8], #Vertical 3
  [0,4,8], #Diagonal 1
  [6,4,2] #Diagonal 2
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
  if @board[location] == " "
    false
    else
    true
  end
end

def valid_move?(input)
 (input.to_i-1).between?(0,8) && !position_taken?(input.to_i-1)
end

def turn
  display_board
  puts "Please enter 1-9:"
  input = gets.strip
  if !valid_move?(input)
    turn
  end
    move(input, current_player)
    display_board
end

def turn_count
  @board.count do |token| token == "X" || token == "O"
  end
end

def current_player
    if turn_count.odd?
      "O"
      else
      "X"
    end
end

def won?
  WIN_COMBINATIONS.detect do |combo|
    position(combo[0]) == position(combo[1]) &&
    position(combo[1]) == position(combo[2]) &&
    position_taken?(combo[0])
  end
end

def position(location)
    @board[location.to_i]
end

def full?
  @board.all? do |token| token == "X" || token == "O"
  end
end

def draw?
  !won? && full?
end

def over?
  won? || draw?
end

def winner
  if won?
  position(won?.first)
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

