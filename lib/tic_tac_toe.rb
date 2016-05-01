class TicTacToe

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,3,6],
    [0,4,8],
    [1,4,7],
    [2,5,8],
    [6,4,2]
  ]

def initialize
  @board = Array.new(9, " ")
end

def position_taken?(location)
  !(@board[location].nil? || @board[location] == " ")
end

def xs_n_os_
  xs = []
  os = []
  @board.each_with_index do |item, idx|
    if item == "X" then xs << idx end
    if item == "O" then os << idx end
  end
  return [xs, os]
end

def won?
  xs_n_os = xs_n_os_
  WIN_COMBINATIONS.each do |com|
    if com.all?{|pos| xs_n_os != nil && xs_n_os[0].include?(pos)} then return true end
    if com.all?{|pos| xs_n_os != nil && xs_n_os[1].include?(pos)} then return true end
  end
  return false
end

def full?
  return @board.all?{|item| ["X", "O"].include?(item)}
end

def draw?
  return (!won? && full?)
end

def over?
  return (draw? || won?)
end

def winner
  win = won?
  if win == false then return nil end
  xs_n_os = xs_n_os_
  WIN_COMBINATIONS.each do |com|
    if com.all?{|pos| xs_n_os[0].include?(pos)} then return "X" end
    if com.all?{|pos| xs_n_os[1].include?(pos)} then return "O" end
  end
end

def move(pos, ox)
  @board[pos.to_i - 1] = ox
end

def turn
  puts "Please enter 1-9:"
  pos = gets.strip
  if(valid_move?(pos))
    move(pos, current_player)
    display_board
  else
    turn
  end
end

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def valid_move?(pos)
  posi = pos.to_i
  return 1 <= posi && 9 >= posi && !position_taken?(posi - 1)
end

def turn_count
  count = 0
  @board.each do |spot|
    if ![""," ", nil].include?(spot)
      count += 1
    end
  end
  return count
end

def current_player
  return turn_count % 2 == 0 ? "X" : "O"
end

def play
  while !over?
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  else
    puts "Cats Game!"
  end
end
end