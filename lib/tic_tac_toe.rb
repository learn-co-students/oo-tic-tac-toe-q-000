class TicTacToe
  # Define your WIN_COMBINATIONS constant
  WIN_COMBINATIONS = [
    [0,1,2], # Top Row
    [3,4,5], # Middle Row
    [6,7,8], # Bottom Row
    [0,4,8], # Diagonal Row # 1
    [6,4,2], # Diagonal Row # 2
    [0,3,6], # Vertical Column 1
    [1,4,7], # Vertical Column 2
    [2,5,8]  # Vertical Column 3
]
  def initialize(new_board = nil)
    @board = board || Array.new(9," ")
  end

  def board=(new_board)
    @board = new_board
  end

  def board
    @board
  end

  def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

# code your move method here!
def move(cell,char="X")
  @board[cell.to_i-1] = char
  puts @board
end

def position_taken?(pos)
  if @board[pos.to_i]=="X" || @board[pos.to_i] =="O"
    return true
  else
    return false
    end
end

# code your #valid_move? method here
def valid_move?(pos)
  if !position_taken?(pos.to_i-1) && pos.to_i.between?(1,9)
    return true
  elsif position_taken?(pos.to_i-1) && pos.to_i.between?(1,9)
    return false
  end
end

#turn method code below
def turn
  puts "Please enter 1-9:"
  pos = gets.chomp
  if valid_move?(pos)
    move(pos,current_player)
    display_board
  else
    turn
  end
end

#turn_count method below
def turn_count
  @board.select {|value| value == "X" || value == "O" }.count
end

#current_player method below
def current_player
  turn_count.even? ? "X" : "O"
end

#won? method below
def won?
  WIN_COMBINATIONS.detect do |combo|
    return combo if combo.all? do |position| @board[position] == "X" end
    return combo if combo.all? do |position| @board[position] == "O" end
  end
end

#full method below
def full?
  @board.all? do |i|
    if i == "X" || i == "O"
      true
    else
      false
    end
  end
end

#draw? method below
def draw?
  if full? && !won?
    true
  else
    false
  end
end

#over? method below
def over?
  if won? || draw? || full?
    true
  else
    false
  end
end

#winner method below
def winner
  if won? != nil
    @board[won?.first]
  else
    nil
  end
end

#play method below
  def play
  until over?
    turn
  end

  if won?
    puts "Congratulations #{winner}!"
  else
    puts "Cats Game!"
  end
end
end