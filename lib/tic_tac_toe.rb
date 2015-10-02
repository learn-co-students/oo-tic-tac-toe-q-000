class TicTacToe

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def position_taken?(location)
    !(@board[location].nil? || @board[location] == " ")
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

  def won?
    won_with_O? || won_with_X?
  end

  def won_with_O?
    WIN_COMBINATIONS.detect do |win_array|
      win_array.all? do |win_index|
        @board[win_index] == 'O'
      end
    end
  end

  def won_with_X?
    WIN_COMBINATIONS.detect do |win_array|
      win_array.all? do |win_index|
        @board[win_index] == 'X'
      end
    end
  end

  def full?
    !@board.detect do |position|
      position == " "
    end
  end

  def draw?
    !won? && full?
  end

  def over?
    draw? || won?
  end

  def winner
    if won_with_O?
      "O"
    elsif won_with_X?
      "X"
    end
  end

  def valid_move?(position)
    if position_taken?(position.to_i - 1) || position.to_i.between?(1, 9) == false
      false
    else
      true
    end
  end

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

  def turn
    puts "Please enter 1-9:"
    position = gets.chomp
    if valid_move?(position)
      move(position, current_player)
    else
      puts "invalid"
      turn
    end
    display_board
  end

  def turn_count
    @board.select do |position|
      position == "O" || position == "X"
    end.length
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def play
    until over?
      turn
    end
    if winner == "X"
      puts "Congratulations X!"
    elsif winner == "O"
      puts "Congratulations O!"
    elsif draw?
      puts "Cats Game!"
    end
  end

end