class TicTacToe
  def initialize
    @board = Array.new(9){|a| a = " "}
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [6,4,2],
    [0,3,6],
    [1,4,7],
    [2,5,8],
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(move_location, character = "X")
    @input = move_location.to_i - 1
    @board[@input] = character
  end

  def position_taken?(move_location)
    ! (@board[move_location].nil? || @board[move_location] == " ")
  end

  def valid_move?(move_location)
    @position = move_location.to_i - 1
    !position_taken?(@position) && @position.between?(0,8)
  end

  def turn
    puts "Please enter 1-9:"
    @answer = gets.strip
    if valid_move?(@answer)
      move(@answer, current_player)
    else
      turn
    end
    display_board
  end

  def turn_count
    @board.count("X") + @board.count("O")
  end

  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |win_array|
      win_array.all?{|spot| @board[spot] == "X"} || win_array.all?{|spot| @board[spot] == "O"}
    end
  end

  def full?
    WIN_COMBINATIONS.all? do |win_array|
      win_array.all?{|spot| position_taken?(spot)}
    end
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw?
  end

  def winner
    if won?
      combo = WIN_COMBINATIONS.detect do |win_array|
        win_array.all?{|spot| @board[spot] == "X"} || win_array.all?{|spot| @board[spot] == "O"}
      end
      answer = @board[combo[0]]
    end
  end

  def play
    turn until over?
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cats Game!"
    end
  end
end