class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

def position_taken?(location)
  !(@board[location].nil? || @board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
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
  WIN_COMBINATIONS.detect  do | combination|
    position_taken?(combination[0]) && (@board[combination[0]] == @board[combination[1]] && @board[combination[2]] == @board[combination[1]])
  end

 end
def full?
    !@board.include?(" ")
end

def draw?
    full? && !won?
end

def over?
    full? || draw?|| won?
end
def winner
    if won?
        return @board[won?[0]]
    else
        return nil
    end
end
def valid_move?(position)# code your #valid_move? method here
  if position.to_i.between?(1,9) && !position_taken?(position)
    return true
  else
    return false
    end
end
def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def move(location, current_player = "X")
  @board[location.to_i-1] = current_player
end


def valid_move?(position)
  position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  if valid_move?(input)
    move(input,current_player)
  else
    turn
  end
  display_board
end

# Define your play method below
def play
until over? do
  turn
  end
if won?
  puts "Congratulations #{winner}!"
elsif draw?
puts "Cats Game!"
end
end

def turn_count
  count = 0
  @board.each do |place|
    if place == "X" || place == "O"
      count +=1
    end
  end
  count
end



def current_player
  turn_count % 2 == 0? "X" : "O"
end
end
