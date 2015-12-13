class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2], # top row
    [3,4,5], # middle row
    [6,7,8], # bottom row
    [0,3,6], # left column
    [1,4,7], # middle column
    [2,5,8], # right column
    [0,4,8], # top left diagnoal
    [6,4,2]  # top right diagonal
  ]

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

  def move(location, player = "X")
    array_position = location.to_i - 1
    @board[array_position] = player
  end

  def position_taken?(location)
    array_position = location.to_i - 1
    @board[array_position] == "X" || @board[array_position] == "O"
  end

  def valid_move?(location)
    1 <= location.to_i && location.to_i <= 9 && !position_taken?(location)
  end

  def turn
    puts "Please enter 1-9:"
    location = gets.strip
    valid_move?(location) ? move(location, current_player) : turn
    display_board
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.detect {|combo| @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]] && !(@board[combo[0]] == " ")} 
  end

  def full?
    @board.all?{|index| (index == "X" || index == "O") }
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw? || full?
  end

  def winner
    if won?
      @board[won?(@board)[0]]
    end
  end

  def play
    until over?
      turn
    end
    won? ? puts("Congratulations #{winner}!") : puts("Cats Game!")
  end
end
