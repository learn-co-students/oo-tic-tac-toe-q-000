class TicTacToe

  def initialize
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], # top row
    [3,4,5], # center row
    [6,7,8], # bottom row
    [0,3,6], # left column
    [1,4,7], # center column
    [2,5,8], # right column
    [6,4,2], # R-L diagonal
    [8,4,0] # L-R diagonal
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(pos, symbol)
    @board[pos.to_i - 1] = symbol
  end

  def position_taken?(position)
    @board[position] != " "
  end

  def valid_move?(position)
    position.to_i.between?(1, 9) && @board[position.to_i - 1] == " "
  end

  def turn
    puts "Please enter 1-9"
    input = gets.strip

    if valid_move?(input)
      move(input, current_player)
      display_board
    else
      turn
    end

  end

  def turn_count
    total = 0
    @board.each { |sym| total += 1 if sym == "X" || sym == "O" }
    total
  end

  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end

  def won?
    return false if @board.all? { |pos| pos == " " }

    WIN_COMBINATIONS.each do |combo|
      if check(@board, combo, "X")
        return combo
      elsif check(@board, combo, "O")
        return combo
      end
    end

    return false
  end

  def check(board = @board, array, symbol)
    array.each do |pos|
      return false unless board[pos] == symbol
    end
    true
  end

  def full?
    !@board.include?(" ")
  end

  def draw?
    full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    WIN_COMBINATIONS.each do |combo|
      if check(@board, combo, "X")
        return "X"
      elsif check(@board, combo, "O")
        return "O"
      end
    end

    return nil
  end

  def play
    until over?
      turn
    end

    if winner == "X" || winner == "O"
      puts "Congratulations #{winner}!"
    else
      puts "Cats Game!"
    end
  end

end
