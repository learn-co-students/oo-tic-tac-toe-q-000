class TicTacToe

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8], # Bottom row
    [0,3,6], # Left column
    [1,4,7], # Center column
    [2,5,8], # Right column
    [0,4,8], # Top-Left to Bottom-Right diagonal
    [6,4,2]  # Bottom-Left to Top-Right diagonal
  ]

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def position_taken?(position)
    !(@board[position].nil? || @board[position].empty? || @board[position] == " ")
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      @board[win_combo[0]].eql?(@board[win_combo[1]]) &&
      @board[win_combo[1]].eql?(@board[win_combo[2]]) &&
      position_taken?(win_combo[0])
    end
  end

  def winner
    winning_combo = won?
    return @board[winning_combo.first] if winning_combo
  end

  def full?
    @board.all? do |board_token|
      board_token == "X" || board_token == "O"
    end
  end

  def draw?
    full? && !won?
  end

  def over?
    won?|| draw?
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !position_taken?(position.to_i - 1)
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def move(position, current_player = "X")
    @board[position.to_i - 1] = current_player
  end

  def turn_count
    @board.count do |player_token|
      player_token == "X" || player_token == "O"
    end
  end

  def turn
    puts "Please enter 1-9:"
    position = gets.strip
    if valid_move?(position)
      move(position, current_player)
      display_board
    else
      turn
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cats Game!"
    end
  end

end
