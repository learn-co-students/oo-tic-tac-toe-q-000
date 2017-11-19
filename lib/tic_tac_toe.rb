require 'pry'

class TicTacToe

def initialize
  @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
end


def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end


def move(position, char = "X")
  position = position.to_i - 1
  char = current_player
  @board[position] = char
end


def valid_move?(position)
  if position.to_i < 1 || position.to_i > 9
    false
  else
    !(position_taken?(position.to_i-1))
  end
end


def position_taken?(position)
  if @board[position] == "X" || @board[position] == "O"
    true
  else
    false
  end
end


def turn
  puts "Please enter 1-9:"
  position = gets.strip

  if valid_move?(position) == true
    move(position)
  else
    turn
  end

  display_board
end


def turn_count
  counter = 0
  @board.each do |slot|
    if slot != " "
      counter += 1
    end
  end
  counter
end


def current_player
  if turn_count % 2 == 0
      "X"
  elsif turn_count % 2 == 1
      "O"
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


WIN_COMBINATIONS =[
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]]

def won?
    WIN_COMBINATIONS.each do |win_combo|
        if (@board[win_combo[0]] == 'X' && @board[win_combo[1]] == 'X' && @board[win_combo[2]] == 'X') || (@board[win_combo[0]] == 'O' && @board[win_combo[1]] == 'O' && @board[win_combo[2]] == 'O')
            return win_combo
        end
    end
    nil
end


def full?
    !@board.any? do |pos|
        pos == " "
    end
end


def draw?
    full? && !won?
end


def over?
    won? || draw?
end


def winner
    win_combo = won?
    if win_combo
        @board[win_combo[0]] # == 'X' || 'O'
    else
        nil
    end
end

end