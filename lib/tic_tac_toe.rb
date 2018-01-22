class TicTacToe

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

  def initialize
    @board = Array.new(9," ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, token="X")
    @board[position.to_i - 1] = token
  end

  def position_taken?(position)
    @board[position] != " "
  end

  def valid_move?(position)
    (position.to_i >= 1 && position.to_i <= 9) &&
    !position_taken?(position.to_i - 1)
  end

  def turn
    position = gets until valid_move?(position)
    move(position, current_player)
  end

  def turn_count
    @board.count {|i| i != " "}
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each do |combination|
      all_X = combination.all? {|position| @board[position] == "X"}
      all_O = combination.all? {|position| @board[position] == "O"}
      return combination if all_X || all_O
    end
    false
  end

  def full?
    @board.all? {|i| i != " "}
  end

  def draw?
    full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    win_combination = won?
    @board[win_combination.first] if win_combination
  end

  def play
    until over? do
      display_board
      turn
    end
    puts "Congratulations #{winner}!" if winner
    puts "Cats Game!" if draw?
  end

end
