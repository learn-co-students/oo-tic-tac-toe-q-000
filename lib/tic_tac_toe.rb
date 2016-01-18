class TicTacToe


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

  def initialize()
    @board = Array.new(9, " ")
  end


def display_board()
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def move(position, character = "X" )
  position = position.to_i
  @board[position - 1] = character
end


def position_taken?(position)
  if @board[position] == " " || @board[position] == "" || @board[position] == nil
     false
  else
     true
  end
end

def valid_move?(position)
  position = position.to_i
  if position_taken?(position - 1) == false && position.between?(1, 9)
    true
  else
    false
  end
end

def turn_count()
  @board.count{|space| space == "X" || space == "O"}
end

def current_player()
 turn_count() % 2 == 0 ? "X" : "O"
end

def turn()
  display_board
  puts "Please enter 1-9:"
  position = gets.strip
  if valid_move?(position) == true
    move(position, current_player())
  else
    valid_move?(position) == false
    turn()
  end
  display_board
end

def won?()
  WIN_COMBINATIONS.find do |wins|
    @board[wins[0]] == @board[wins[1]] && @board[wins[1]] == @board[wins[2]] && position_taken?(wins[0])
  end
end

def full?()
  @board.all? do |letter|
    letter == "X" || letter == "O"
  end
end

def draw?()
  full?() && !won?()
end

def over?()
  won?() || draw?() || full?()
end

def winner()
  if winner = won?()
    @board[winner[1]]
  else
    nil
  end
end

def play()
  until over?()
  turn()
  end
  if
    draw?()
      puts "Cats Game!"
  else
    puts "Congratulations #{winner()}!"
  end
end

end
