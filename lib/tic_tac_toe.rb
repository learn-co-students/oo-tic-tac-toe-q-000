class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
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

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, char = "X")
    @board[position.to_i - 1] = char
  end

  def position_taken?(position)
    !(@board[position] == " " || @board[position] == "" || @board[position] == nil)
  end

  def valid_move?(position)
    position.to_i.between?(1, 9) && !position_taken?(position.to_i - 1)
  end

  def turn
    puts "Please enter 1-9:"
    position = gets.strip
    if valid_move?(position)
      move(position, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      win_combination.all?{|position| @board[position] == "X"} ||
      win_combination.all?{|position| @board[position] == "O"}
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
    if won?
      @board[won?[0]]
    else
      won?
    end
  end

  def play
    until over? do
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cats Game!"
    end
  end
end