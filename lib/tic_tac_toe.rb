class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end


  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts " ----------- "
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts " ----------- "
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

  def move(position, character="X")
   position = position.to_i
   @board[position-1] = character 
 end

 def position_taken?(character)
  if (@board[character] == " ") || (@board[character] == "") || (@board[character] == nil)
    return false
  else
    return true
  end
end

def valid_move?(character)
  if character.to_i.between?(1,9) && !position_taken?(character.to_i-1)
    return true
  else
    return false
  end
end

def turn
  puts "Please enter 1-9:"
  character = gets.strip
  if valid_move?(character) == true
    move(character, current_player)

  else  valid_move?(character) == false

    turn
  end
  display_board
end

def turn_count
  @board.count{|token| token == "X" || token == "O"}
end

def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

def won?
  WIN_COMBINATIONS.detect do |array|
    array.all? {|input| @board[input] == "X"} || array.all? {|input| @board[input] == "O"}
  end
end


def full?
  if @board.any? {|input| input == " "}
    false
  else
    true
  end
end

def draw?
  unless won? || full? ==  false
    return true
  end
end

def over?
  if full? == false
    return false
  else
    return true
  end
end

def winner
  if won?
    if WIN_COMBINATIONS.detect {|array| array.all? {|input| @board[input] == "X" }}
      return "X"
    else
      return "O"
    end
  end
end


#play
def play
  until over? || won? || draw?
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  else draw?
    puts "Cats Game!"
  end
end




end