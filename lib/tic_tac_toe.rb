class TicTacToe

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8], 
  [0, 3, 6], 
  [1, 4, 7], 
  [2, 5, 8], 
  [0, 4, 8], 
  [6, 4, 2]
]

  def initialize(board = nil)
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "] || @board = board
  end

=begin
def board= (board)
  @board = board
end

def board
  board
end
=end

  def display_board

  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "

  end

  def move(position, char = "X")
  pos = position.to_i
  @board[pos - 1] = char

  end
def valid_move?(position)

  if position.to_i < 1 || position.to_i > 9
    return false
  elsif position_taken?(position.to_i - 1) == true
    return false
  else 
    return true
  end

end

def position_taken?(position)

  if @board[position.to_i] == "X" || @board[position.to_i] == "O"
    return true
  else
    return false
  end

end

# one turn(takes player input and excutes if valid)
def turn

puts "Please enter 1-9:"
position = gets.chomp

  if valid_move?(position) == false
    turn
  else
    move(position, current_player)
    display_board
  end

end

def turn_count
  count = 0

  @board.each do |i|
    if i == "X" || i == "O"
      count += 1
    end
  end

  return count
end

def current_player

  if turn_count.even?
    return "X"
  else
    return "O"
  end

end

def won?

  WIN_COMBINATIONS.each do |i|
    if i.all? {|j| @board[j] == "X"} || i.all?{|j| @board[j] == "O"}
      return i
    end
  end

  return false
end

def full?

  @board.none? {|i| i == " " }

end

def draw?

  if won? == false && full? == true
    return true
  else
    return false
  end

end

def over?

  if draw? == true || won? != false
    return true
  end

end

def winner

  if won? == false
    return nil
  end
  
  i = won?

  if @board[i[0]] == "X"
    return "X"
  else
    return "O"
  end 

end

def play
display_board

  while over? !=true
  char = current_player
  turn
  end

  if draw?
    puts "Cats Game!"
  elsif winner == "X"
    puts "Congratulations X!"
  elsif winner == "O"
    puts "Congratulations O!"
  end

end




end