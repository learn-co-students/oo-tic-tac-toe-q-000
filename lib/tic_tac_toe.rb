class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8], #Bottom row

  [0,3,6], #Left column
  [1,4,7], #Middle Column
  [2,5,8], #Right column

   #diagonal one
   [6,4,2],
  [0,4,8],#diagonal two
    ]

   def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(input, xoro = "X")
@board[input.to_i - 1] = xoro
end

  def position_taken?(position)
 !(@board[position].nil? || @board[position] == " ")
end

def valid_move?(position)
if position_taken?(index = position.to_i - 1) == true
   false
elsif (0..8).cover?(index) == true
  return true
end
end


def turn
puts "Please enter 1-9:"
position = gets.strip
  if valid_move?(position) == true
    move(position, xoro = current_player)
    display_board
  else
  turn
  end
end

  def current_player
if turn_count % 2 == 0
 "X"
  else
 "O"
end
end

  def turn_count
 @board.count do |turn| turn == "X" || turn == "O"
 end
end



def won?
WIN_COMBINATIONS.collect do |winarray|
  win_index_1 = winarray[0]
  win_index_2 = winarray[1]
  win_index_3 = winarray[2]

  position_1 = @board[win_index_1]
  position_2 = @board[win_index_2]
  position_3 = @board[win_index_3]

  if position_1 == "X" && position_2 == "X" && position_3 == "X"
    return winarray # return the win_combination indexes that won.
  elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
    return winarray
  end
end
false
end

def full?
@board.all?{|i| i == "X" || i == "O"}
end

def draw?
won? == false && full?
end

def over?
if won? == false && draw? == false
  false
  else
  true
end
end



def winner
if draw? == true; nil;
  else

  WIN_COMBINATIONS.each do |winarray|
  win_index_1 = winarray[0]
  win_index_2 = winarray[1]
  win_index_3 = winarray[2]

  position_1 = @board[win_index_1]
  position_2 = @board[win_index_2]
  position_3 = @board[win_index_3]

  if position_1 == "X" && position_2 == "X" && position_3 == "X"
    winner = "X"
    return winner
  elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
    winner = "O"
    return winner
  else
    nil
  end
end
nil
end
end


def play
until over?
  turn
end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cats Game!"
 end
end


end
