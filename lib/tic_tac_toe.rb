class TicTacToe
  attr_accessor :board

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ]

  def initialize(board = nil)
    @board = board || Array.new(9, ' ')
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-" * 11
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-" * 11
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(pos, char = "X")
    @board[pos.to_i - 1] = char
  end

  def position_taken?(position)
    !(@board[position].nil? || @board[position] == " ")
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if !valid_move?(input)
      turn
    end
    move(input, current_player)
    display_board
  end

  def turn_count
    9 - @board.count(" ")
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.detect do |arr|
      @board[arr[0]] == @board[arr[1]] &&
      @board[arr[1]] == @board[arr[2]] &&
      position_taken?(arr[0])
    end
  end

  def full?
    @board.count(" ") == 0
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    @board[won?[0]] if over?
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end
  
end