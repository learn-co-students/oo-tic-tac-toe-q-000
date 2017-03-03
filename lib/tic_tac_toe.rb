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
    @board = Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
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

  def move(position, player)
    @board[position - 1] = player
  end

  def position_taken?(position)
    @board[position] != " "
  end

  def valid_move?(position)
    p = position.to_i
    return true unless p == 0 || position_taken?(p - 1)
  end

  def turn
    puts "Enter a position: "
    place = gets
    if valid_move?(place)
      move(place.to_i, current_player)
    else
      turn
    end
  end

  def turn_count
    @board.select { |b| b != " " }.count
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      return combo if combo.all? { |c| @board[c] == "X" }
      return combo if combo.all? { |c| @board[c] == "O" }
    end

    return false if turn_count == 9
  end

  def full?
    turn_count == 9
  end

  def draw?
    return false if won? || !full?
    true
  end

  def over?
    return true if draw? || won? || full?
  end

  def winner
    return unless combo = won?
    @board[combo[0]]
  end
end
