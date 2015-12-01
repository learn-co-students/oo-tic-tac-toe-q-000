class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

WIN_COMBINATIONS = [
  [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8],
  [0,4,8], [6,4,2]]

def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def move(location, character = "X")
  @board[location.to_i - 1] = character
end

def position_taken?(position)
  if @board[position] == " " || @board[position] == "" || @board[position] == nil
    return false
  elsif @board[position] == "X" || @board[position] == "O"
    return true
  end
end

def valid_move?(input)
  current_move = input.to_i - 1
  if !position_taken?(current_move) && current_move.between?(0, 8)
    return true
  else
    false
  end
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
until valid_move?(input)
    puts "Try again!"
    input = gets.strip
end
    move(input, current_player)
end

def turn_count
  counter = 0
   @board.each do |move|
    if move == "X" || move == "O"
      counter += 1
    end
  end
  counter
end

def current_player
  if turn_count % 2 == 0
  return "X"
  else
    return "O"
  end
end

def won?
  WIN_COMBINATIONS.detect do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"

  return win_combination
    else
      false
    end
  end
end

def full?
  @board.all? do |square|
    square == "X" || square == "O"
    end
end

def draw?
  if !won? && full?
    return true
  end
end

def over?
  if draw? || won?
    return true
  else
    return false
  end
end

def winner
  if won?
    won?.each do |t|
      return @board[t]
    end
  end
end
def play
  until over?
  turn
  end
  if won?
    if winner
    the_winner = winner
      puts "Congratulations #{the_winner}!"
    end
  elsif draw?
    puts "Cats Game!"
    end
  end
end