class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
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
  [6,4,2]
  ]

def won?
 WIN_COMBINATIONS.detect do |combo|
   combo.all?{|position| @board[position] == "X"} || combo.all?{|position| @board[position] == "O"}
 end
end

def full?
    @board.all?{|i| i == "X" || i == "O"}
end

def draw?
  if won? == nil && full? == true
    return true
  end
end

def over?
  won? || draw?
end

def winner
  if won?
    first_win_combo = won?[0]
  return @board[first_win_combo]
  else
    return nil
  end
end

def move(location, current_player = "X")
  @board[location.to_i-1] = current_player
end

def position_taken?(location)
  @board[location] != " " && @board[location] != ""
end

def valid_move?(position)
  position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
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

def play
  until over?
    turn
  end

  if won?
    puts "Congratulations #{winner}!"
  end

  if draw?
    puts "Cats Game!"
  end
end

def turn_count
  counter = 0
  @board.each do |position|
    if position == "X" || position == "O"
    counter += 1
    end
end
  return counter
end

def current_player
  if turn_count == 0
    return "X"
    elsif turn_count % 2 == 1
    return "O"
  elsif turn_count % 2 == 0
    return "X"
  end
end
end


