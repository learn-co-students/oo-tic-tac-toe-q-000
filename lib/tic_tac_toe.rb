class TicTacToe

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, character = "X")
    @board[position.to_i - 1] = character
  end

  def position_taken?(position)
    if @board[position] == "" || @board[position] == " " || @board[position] == nil
      false
    else
      true
    end
  end

  def valid_move?(input)
    position = input.to_i - 1

    if !position_taken?(position) && position.between?(0,9)
      true
    else
      false
    end
  end

  def turn
    puts "Please enter 1-9:"
    player_choice = gets.strip

    if valid_move?(player_choice)
      move(player_choice, current_player)
      display_board
    else
      puts "That is not a valid move"
      turn
    end
  end

  def current_player
    if turn_count.even?
      "X"
    else
      "O"
    end
  end

  def turn_count
    turn_counter = 0

    @board.each do |position|
      turn_counter += 1 if position == "X" || position == "O"
    end

    turn_counter
  end

  def won?
    WIN_COMBINATIONS.detect do |line|
      line.all? { |position| @board[position] == "X" } ||
      line.all? { |position| @board[position] == "O" }
    end
  end

  def full?
    @board.all? { |position| position == "X" || position == "O" }
  end

  def draw?
    if full? && !won?
      true
    end
  end

  def over?
    if won? || full? || draw?
      true
    end
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

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end
end
