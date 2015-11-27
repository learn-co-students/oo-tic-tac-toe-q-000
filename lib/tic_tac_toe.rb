class TicTacToe

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

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2],
  ]

def move (location, char = "X")
  location = location.to_i
  location = location.pred
  @board[location] = char
end

def position_taken?(location)
  !(@board[location].nil? || @board[location] == " " || @board[location] == "")
end

def valid_move?(position)
  position = position.to_i
  position = position.pred
  if !position_taken?(position) && position.between?(0, 8)
     true
  end
end

def turn
  puts "Please enter 1-9:"
  position = gets.strip
  if valid_move?(position)
    location = position
    move(location, current_player)
  else
    turn
  end
  display_board
end

def turn_count
  counter = 0
  @board.each do |count|
    if count != " "
      counter += 1
    end
  end
  counter
end

def current_player
  player =
    (turn_count.even? ? "X" : "O")
  player
end

def won?
  WIN_COMBINATIONS.detect do |win_index|
    position_1 = @board[win_index[0]]
    position_2 = @board[win_index[1]]
    position_3 = @board[win_index[2]]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      win_index
    elsif position_1 == "O" && position_2 =="O" && position_3 == "O"
      win_index
    else
      false
    end
  end
end

def full?
  !(@board.include?(" "))
end

def draw?
  full? && !won?
end

def over?
  won? || draw?
end

def winner
  if won?
    win_token = won?
    @board[win_token[0]]
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

