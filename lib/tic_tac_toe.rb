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

def move(position, current_player = "X")

  @board[position.to_i - 1] = current_player
end

def position_taken?(position)
   @board[position] != " " or  @board[position] != nil or  @board[position] != "" and  @board[position] == "X" or  @board[position] == "O"
end

def valid_move?(position)
  position = (position.to_i) -1
  position.between?(0, 8) and !position_taken?(position)
end

def turn
  display_board
  puts "Please enter 1-9:"
  input = gets.strip
  if !valid_move?(input)
    turn
  end
  move(input, current_player)
  display_board
end

def position(location)
    @board[location.to_i]
end


def turn_count
  t_count = 0
  @board.each do |turns|

    if turns == "X" or turns == "O"
      t_count +=1

    end
  end
  return t_count
end


def current_player
  if turn_count % 2 == 0
    return "X"
  else
    return "O"
  end
end

def won?

  WIN_COMBINATIONS.detect do |combo|

     @board[combo[0]] == @board[combo[1]] &&
     @board[combo[1]] == @board[combo[2]] &&
     position_taken?(combo[0])
  end

end



def full?
  @board.all?{|token| token == "X" || token == "O"}
end


def draw?
    !won? and full?
end


def over?
  won? or draw?
end


def winner

  if won?

    @board[won?[0]]

  else

    return nil
  end

end

def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end


end