class TicTacToe

  def initialize
      @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [6,4,2]
    ]


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


  def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

def move(location, current = "X")
  @board[location.to_i-1] = current
end

def position_taken?(location)
  @board[location] != " " && @board[location] != ""
end

def valid_move?(position)
  position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
end

def turn_count
counter = 0
  @board.each do |xo|
    if xo != " "
      counter += 1
    end
  end
  counter
end

def current_player
  if turn_count.odd?
    "O"
    else
    "X"
  end
end




 def won?
  WIN_COMBINATIONS.each do |wincomb|
    position1 = wincomb[0]
    position2 = wincomb[1]
    position3 = wincomb[2]
    if (@board[position1] == "X" && @board[position2] == "X" && @board[position3] == "X") || (@board[position1] == "O" && @board[position2] == "O" && @board[position3] == "O")
      return wincomb
    end
  end
  return false
end

def draw?
  full? && !won?
  end

 def full?
  @board.all? do |element|
    element == "X" || element == "O"
  end
end

def winner
    if won? != false
      return @board[won?[0]]
    end
end

 def over?
  if full? || won? || draw?
    true
  end
 end

def play
  while !over? do
      turn
  end
  if won?
    puts "Congratulations #{winner}!"
    end
  if draw?
    puts "Cats Game!"
  end
end

end


