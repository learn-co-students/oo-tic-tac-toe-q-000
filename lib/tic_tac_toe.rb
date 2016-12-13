class TicTacToe

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
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

  def move(position_int, token)
    @board[position_int - 1] = token
  end

  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      return false
    elsif @board[index] == "X" || @board[index] =="O"
      return true
    end
  end

  def valid_move?(position_str)
    position_int = position_str.to_i
    if position_int < 1 || position_int > 9
      return false
    else
      return !position_taken?(position_int - 1)
    end
  end

  def turn
    puts "Please enter 1-9:"
    position_str = gets.strip
    if !valid_move?(position_str)
      turn
    else
      move(position_str.to_i, current_player)
      display_board
    end
  end

  def turn_count
    turn = 0
    @board.each do |token|
      if token == "X" or token == "O"
        turn += 1
      end
    end
    return turn
  end

  def current_player
    turn = turn_count
    return turn.even? ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.detect { |combination| (@board[combination[0]] == "X" || @board[combination[0]] == "O") && @board[combination[0]] == @board[combination[1]] && @board[combination[1]] == @board[combination[2]] }
  end

  def full?
    @board.all? { |position| position == "X" || position == "O" }
  end

  def draw?
    !won? && full?
  end

  def over?
    full? || won? || draw?
  end

  def winner
    won? ? @board[won?[0]] : nil
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
