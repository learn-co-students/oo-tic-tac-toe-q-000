class TicTacToe

WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

def initialize()
  @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
end

def board= (new_board)
  @board = new_board
end

def board 
  @board
end

def display_board()
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def move(position, player = "X")
  board[position.to_i-1] = player
end

def position_taken?(position)
 @board[position.to_i] == "O" || @board[position.to_i] == "X"
end

def valid_move?(position)
  !position_taken?(position.to_i-1) && position.to_i.between?(1,9)
end

def turn
  display_board
  puts "Please enter 1 - 9:"
  input = gets.chomp
  if !valid_move?(input)
    turn
  end
  move(input, current_player)
end

def turn_count
  @board.count{|player| player == "X" || player == "O"}
end


def current_player
  if turn_count % 2 == 0
    current_player = "X"
  else
    current_player = "O"
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
  @board.none?{|i| i == " "}
end

def draw?
  full? && !won?
end

def over?
  full? || won? || draw?
end

def winner
  winner = won?
  winner ? @board[winner.first] : nil
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

      

