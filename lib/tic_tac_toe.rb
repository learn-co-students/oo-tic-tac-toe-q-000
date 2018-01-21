class TicTacToe
  def initialize
    board = Array.new(9, " ")
    @board = board
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

  def move(position, char = X)
    position = position.to_i - 1
    @board[position] = char
  end

  def position_taken?(position)
      position = position.to_i
    if @board[position] == "X" || @board[position] == "O"
      true 
    else
      false
    end
  end

  def valid_move?(position)
    position = position.to_i - 1
    if position.between?(0,8) && !position_taken?(position)
      true
    end
  end

  def turn
    puts "Select a position 1-9:"
    input = gets.strip
    if valid_move?(input)
      move(input, current_player)
      display_board
    else
      puts "Invalid move, please try again."
      turn
    end
  end

  def turn_count
    counter = 0
    @board.each do |char|
      if char == "X" || char == "O"
        counter += 1
      end
    end
    counter
  end

  def current_player
    if turn_count.even?
      "X"
    else
      "O"
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] &&
      @board[combo[0]] == @board[combo[2]] &&
      position_taken?(combo[0])
    end
  end

  def full?
    @board.all? { |position| position == "X" || position == "O"  }
  end

  def draw?
    if full? && !won?
      true
    end
  end

  def over?
    if won? || draw?
      true
    end
  end

  def winner
    if won? && @board[won?[0]] == "X"
      "X"
    elsif won? && @board[won?[0]] == "O"
      "O"
    end
  end

  def play
    puts "Welcome to Tic Tac Toe!"
    display_board
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end
end
