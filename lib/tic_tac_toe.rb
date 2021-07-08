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

  def move(position, token = "X")
    @board[position.to_i - 1] = token
  end

  def position_taken?(position)
    @board[position] != "" && @board[position] != " "
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !position_taken?(position.to_i - 1)
  end

  def turn
    puts "Please enter a position of 1-9:"
    position = gets.strip
    if valid_move?(position)
      move(position, current_player) && display_board
    else
      turn
    end
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
  WIN_COMBINATIONS.each do |win|
    win_combo1 = @board[win[0]]
    win_combo2 = @board[win[1]]
    win_combo3 = @board[win[2]]

    if win_combo1 == "X" && win_combo2 == "X" && win_combo3 == "X"
      return win
    elsif win_combo1 == "O" && win_combo2 == "O" && win_combo3 == "O"
      return win
    end
  end
  return false
  end

  def full?
    !@board[0..8].any? {|move| move == "" || move == " "}
  end

  def draw?
    if !won? && full?
      return true
    elsif !won? && !full?
      return false
    elsif won?
      return false
    end
  end

  def over?
    won? || draw? || full?
  end

  def winner
    if win_combo = won?
      return @board[win_combo[0]]
    else
      return nil
    end
  end

  def play
    until over?
      turn
    end
    won? ? (puts "Congratulations #{winner}!") : (puts "Cats Game!")   
  end

end