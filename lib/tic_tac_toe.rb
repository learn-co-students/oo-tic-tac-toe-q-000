#Define the class
class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def board
    @board
  end

  def board=(new_board)
    @board = new_board
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, player = "X")
    position -= 1
    @board[position] = player
  end

  def position_taken?(position)
    @board[position]== "X" || @board[position] == "O"
  end

  def valid_move?(position)
    position = position.to_i
    position -= 1
    position.between?(0,8) && !position_taken?(position)
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    position = user_input.to_i
    if valid_move?(position)
      move(position, current_player)
      display_board
    else
      turn
    end
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
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
