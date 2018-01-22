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
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
    ]
  def move(location, player = "X")
    @location = location.to_i - 1
    @player = player
    @board[@location] = @player
  end
  def position_taken?(position)
    @position = position
    if @board[@position] == "X" || @board[@position] == "O"
      true
    else
      false
    end
  end
  def valid_move?(position)
    @position = position.to_i
    @position.between?(1,9) && !position_taken?(@position-1)
  end
def turn
  puts "Please enter 1-9:"
  @input = gets.strip
  if !valid_move?(@input)
    turn
  end
  move(@input, current_player)
  display_board
end
def turn_count
  @board.count{|turns| turns == "X" || turns == "O"}
end
def current_player
  if turn_count % 2 == 0
    "X"
  else
    "O"
  end
end
def won?
  WIN_COMBINATIONS.detect do |combo|
    @combo = combo
    @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]] && position_taken?(@combo[0])
  end
end
def full?
  @board.all?{|token| token == "X" || token == "O"}
end
def draw?
  !won? && full?
end
def over?
  won? || draw?
end
def winner
  if winning_combo = won?
    @board[winning_combo.first]
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