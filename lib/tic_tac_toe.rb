class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

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
    @board[position] == "X" || @board[position] == "O"
  end

  def valid_move?(position)
    !position_taken?(position.to_i) && position.to_i.between?(0, 8)
  end

  def turn
    puts "Please enter 1-9:"
    position = gets.strip.to_i - 1

    if !valid_move?(position)
      turn
    end
    move(position, character = "X")
    display_board
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      if (@board[win_combination[0]] == "X" && @board[win_combination[1]] == "X" && @board[win_combination[2]] == "X") || (@board[win_combination[0]] == "O" && @board[win_combination[1]] == "O" && @board[win_combination[2]] == "O")
        return win_combination
      end
    end
    return false
  end


  def full?
    @board.all? do |index|
      index != " "
    end
  end


  def draw?
    if won? == false && full? == true
      return true
    elsif won? == false && full? == false
      return false
    else
      return false
    end
  end

  def over?
    won? || draw? || full?
  end


  def winner
    if won? && @board.count("X") > @board.count("O")
      return "X"
    elsif won? && @board.count("O") > @board.count("X")
      return "O"
    else
    end
  end

  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    else draw?
      puts "Cats Game!"
    end
  end

end
