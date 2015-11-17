class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle Row
  [6,7,8], #Bottom Row
  [0,3,6], #Left Column
  [1,4,7], # Middle Column
  [2,5,8], # Right Column
  [0,4,8], # Diagaonal from top left
  [6,4,2] # Diagaonal from top right
  ]

 def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

def move(location,player = "X")
  @board[location.to_i-1] = player
end

def position_taken?(position)
  if @board[position] == " " || @board[position] == "" || @board[position] == nil
     false
  else true
  end
end



  def valid_move?(position)
 location = position.to_i - 1
  if position_taken?(location) == true || location.between?(0,9) == false
    return false
  else
    return true
  end
end

def turn
  puts "Please enter 1-9:"
  input = gets.chomp
  if valid_move?(input)
    move(input.to_i, current_player)
    display_board
  else
    turn
  end
end

def won?
  WIN_COMBINATIONS.find do |wincomb|
    return wincomb if wincomb.all? do |position| @board[position] == "X" end
    return wincomb if wincomb.all? do |position| @board[position] == "O" end
  end
end

def full?
  @board.all? {|letter| letter != " "}
end

def draw?
  !won? && full?
end

def over?
  won? || draw? || full?
end

def winner
  if letter_win = won?
    @board[letter_win.first]
  end
end

def turn_count
  count = 0
  @board.each do |letter|
    if letter != " "
      count += 1

  end
end
return count
end

def current_player
  if turn_count%2 == 0
    return "X"
  else
    return "O"
  end
end

def play
  while !over?
turn
end
if won?
  puts "Congratulations #{winner}!"
 elsif  draw?
puts "Cats Game!"
end
end


end