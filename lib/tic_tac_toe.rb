class TicTacToe

  def initialize
    @board = Array.new(9, " ")
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


def display_board

  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "

end

def move(position, value = "X")
  @board[position.to_i - 1] = value
end


def position_taken?(location)
  @board[location] != " " && @board[location] != ""
end

def valid_move?(position)
  position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
end

def turn_count
  counter = 0
  @board.each do |place|
    if place != " "
      counter += 1
    end
  end
  counter
end

def current_player
   if turn_count.even?
    "X"
  else 
    "O"
  end
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


def won?
  WIN_COMBINATIONS.detect do |win_combination|
  @board[win_combination[0]] == "X"  && @board[win_combination[1]] == "X" && @board[win_combination[2]] == "X" || @board[win_combination[0]] == "O"  && @board[win_combination[1]] == "O" && @board[win_combination[2]] == "O"
  end
end

def full?
  @board.all? do |index|
    index != " "
  end
end


def draw?
  !won? && full?
end


def over?
  won? || full? || draw?
end

def winner
 if won?
  win_combo = won?
 else
 return nil
 end 

 if @board[win_combo[0]] == "X"
  "X"
  
 elsif @board[win_combo[0]] == "O"
  "O"
 end
end


def play
  until over?
  current_player
  turn
  end
  
  if won?
    puts "Congratulations #{winner}!"

  elsif draw?
    puts "Cats Game!"
  
  end
end


end

