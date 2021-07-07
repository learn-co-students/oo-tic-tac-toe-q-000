class TicTacToe
  attr_accessor :board
  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end

  def winner
    if won?
      @board[won?[0]] == "X" ? @winner = "X" : @winner = "O"
    end
  end

  def play()
    while !over?()
      turn()
    end
    if won?()
      puts "Congratulations #{winner}!"
    end
    if draw?()
      puts "Cats Game!"
    end
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2] ]

  def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def position(location)
    @board[location.to_i]
  end

  def current_player()
    turn_count % 2 == 0 ? "X" : "O"
  end
  def move(location, current_player = "X")
    @board[location.to_i-1] = current_player
  end

  def position_taken?(location)
    !(@board[location].nil? || @board[location] == " ")
  end
  def valid_move?(position)
    position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
  end

  def turn
    display_board
    puts "Please enter 1-9:"
    input = gets.strip
    if !valid_move?(input)
      turn
    end
    move(input, current_player)
    display_board
  end

  def turn_count() # determine what turn it is
    @board.count{|token| token == "X" || token == "O"}
  end
  def won?()
    WIN_COMBINATIONS.detect do |combo|
      position(combo[0]) == position(combo[1]) &&
      position(combo[1]) == position(combo[2]) &&
      position_taken?(combo[0])
    end
  end

  def full?()
    @board.all? do |str|
      str == "O" || str == "X"
    end
  end
  def draw?()
    !won? && full?
  end
  def over?()
    won? || draw?
  end
end