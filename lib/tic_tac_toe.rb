class TicTacToe

  def initialize(board=nil)
    @board = board || Array.new(9," ")

  end

  def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

 WIN_COMBINATIONS =  [
   [0,1,2],
   [3,4,5],
   [6,7,8],
   [0,3,6],
   [1,4,7],
   [2,5,8],
   [0,4,8],
   [6,4,2]
    ]

def move( position, char=  "X")
  @board[position.to_i - 1] = char.upcase
end

def position_taken?(position)
  if !(@board[position.to_i].nil?) && (@board[position] == "X" || @board[position] == "O")
    true
  else
    false
  end
end

def valid_move?(position)
  if position.to_i.between?(1,9)
    if !position_taken?(position.to_i-1)
      true
    end
  end
end

def turn
  display_board
puts "Please enter 1-9:"
  user_input = gets.strip
  valid = valid_move?(user_input)
  if !valid
    display_board
  puts "That was invalid.  Please enter 1-9"
  user_response = gets.strip
  end
  current_char = current_player
  current_move = move(user_input, current_char)
display_board
end

def current_player
  whos_move = turn_count
  whos_move.odd? ? "O" : "X"
end

def turn_count
  counter = 0
  @board.each do |string|
    if string == "X" || string == "O"
      counter +=1
    end
  end
  counter
end

def won?
WIN_COMBINATIONS.each do |index|
  return index if index.all? {|position| @board[position] == "X" }
  return index if index.all? {|position| @board[position] == "O" }
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
  (won? || draw?) ? true : false
end

  def winner
  WIN_COMBINATIONS.each do |index|
  return "X" if index.all? {|position| @board[position] == "X" }
  return "O" if index.all? {|position| @board[position] == "O" }
end
nil
end

def play

until over? == true
current_player
turn
end
if draw?
  puts "Cats Game!"
elsif winner
puts "Congratulations #{winner}!"
end

end
end