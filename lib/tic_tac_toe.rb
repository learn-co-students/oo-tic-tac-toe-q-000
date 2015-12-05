class TicTacToe
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
    @board = Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-" * 11
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-" * 11
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def draw?
    full? && !won? ? true: false
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def full?
    !(@board.detect { |token| token == " " || token == nil })
  end

  def move(position, token = "X")
    position = position.to_i
    @board[position-1] = token
  end

  def over?
    draw? || won?
  end

  def play
    while !over?
      turn
    end
    puts won? ? "Congratulations #{winner}!" : "Cats Game!"
  end

  def position_taken?(position)
    position = position.to_i
    !(@board[position] == " " || @board[position] == nil)
  end

  def turn
    puts "Please select a number 1-9:"
    position = gets.strip
    if valid_move?(position)
      move(position, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    @board.count { |token| token == "X" || token == "O"}
  end

  def valid_move?(position)
    position = position.to_i
    position.between?(1, 9) && !position_taken?(position-1)
  end

  def winner
    winning_combo = won?
    winning_combo ? @board[winning_combo.first] : nil
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] &&
        @board[combo[1]] == @board[combo[2]] &&
        position_taken?(combo.first)
    end
  end


end
