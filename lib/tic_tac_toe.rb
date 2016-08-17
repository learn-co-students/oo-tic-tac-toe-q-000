class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
      [0, 1, 2], #top row
      [3, 4, 5], #horizontal middle row
      [6, 7, 8], #bottom row
      [0, 3, 6], #left column
      [1, 4, 7], #middle column
      [2, 5, 8], #right column
      [0, 4, 8], #left diagonal
      [2, 4, 6]  #right diagonal
   ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, player)
    @board[position-1] = player
  end
  
  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end

  def valid_move?(position)
    index = position.to_f - 1
    0 <= index && index <= 8 &&
    !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    position = input.to_f
    if valid_move?(position)
      move(position, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    @board.count("O") + @board.count("X")
  end

    def current_player
    if turn_count.even?
      "X"
    else
      "O"
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |array|
      if array.all? {|index| @board[index] == "X"}
        array.inspect
      elsif array.all? {|index| @board[index] == "O"}
        array.inspect
      end
    end
  end
  
  def full?
    @board.none? { |x| x == " " }
  end

  def draw?
    !won? && full?
  end

  def over?
    draw? || won?
  end

  def winner
    if won?
      @board[won?[0]]
    end
  end

  def play
    until over?
      turn
    end
    if draw?
      puts "Cats Game!"
    else puts "Congratulations #{winner}!"
    end
  end
end