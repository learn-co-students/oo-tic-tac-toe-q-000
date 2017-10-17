class TicTacToe

  def initialize
    @board = Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, token = "X")
    position = position.to_i - 1
    @board[position] = token
  end

  def position_taken?(position)
    @board[position] == "X" || @board[position] == "O"
  end

  def valid_move?(position)
    position = position.to_i - 1
    position.between?(0, 8) && !position_taken?(position)
  end

  def turn
    puts "Choose a number between 1 - 9"
    input = gets.chomp.to_i
    token = current_player
    if valid_move?(input)
      move(input, token)
    else
      puts "Your move in invalid, please try again"
      turn
    end
  end

  def turn_count
    @board.count do |token|
      token == "X" || token == "O"
    end
  end

  def current_player
    # if even numbers
    if turn_count % 2 == 0
      return "X"
    else 
      return "O"
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      combo.all? { |number| @board[number] == "X"} || combo.all? { |number| @board[number] == "O"}
    end
  end
  

  def full?
    @board.all? do |token|
      token == "X" || token == "O"
    end
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw? || full?
  end

  def winner
    if winning_combo = won?
      @board[winning_combo.first]
    end
  end

  def play 
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cats Game!"
    end
  end


  WIN_COMBINATIONS = [
    [0, 1, 2], # top row
    [3, 4, 5], # middle row
    [6, 7, 8], # bottom row
    [0, 3, 6], # left col
    [1, 4, 7], # middle col
    [2, 5, 8], # right col
    [0, 4, 8], # diag 1
    [6, 4, 2]  # diag 2
  ]

end

