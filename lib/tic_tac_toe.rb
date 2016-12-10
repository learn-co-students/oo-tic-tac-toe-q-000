class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def display_board
    puts " #{@board[0]} ""|"" #{@board[1]} ""|"" #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} ""|"" #{@board[4]} ""|"" #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} ""|"" #{@board[7]} ""|"" #{@board[8]} "
  end

  def move(input, value)
    index = input.to_i - 1
    @board[index] = value
  end

  def position_taken?(index)
    return false if @board[index] == " " || @board[index] == "" || @board[index] == nil
    return true if @board[index] == "X" || "O"
  end

  def valid_move?(input)
  index = input.to_i - 1
    if index.between?(0, 8) && !(position_taken?(index))
      return true
    else
      return false
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input.to_i - 1
    if valid_move?(input)
      move(input, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    counter = 0
    @board.each do |token|
      if token == "X" || token == "O"
        counter += 1
      end
    end
    return counter
  end

  def current_player
    if turn_count.even?
      return "X"
    elsif turn_count.odd?
      return "O"
    end
  end

  def won?
    WIN_COMBINATIONS.find do |win_combination|
      (@board[win_combination[0]] == "X" && @board[win_combination[1]] == "X" && @board[win_combination[2]] == "X") || (@board[win_combination[0]] == "O" && @board[win_combination[1]] == "O" && @board[win_combination[2]] == "O")
    end
  end

  def full?
    @board.all? do |taken|
      taken == "X" || taken == "O"
    end
  end

  def draw?
    if !(won?) && full?
      return true
    else
      return false
    end
  end

  def over?
    if won? || full? || draw?
      return true
    else
      return false
    end
  end

  def winner
    if won?
      WIN_COMBINATIONS.find do |win_combination|
        if @board[win_combination[0]] == "X" && @board[win_combination[1]] == "X" && @board[win_combination[2]] == "X"
          return "X"
        elsif @board[win_combination[0]] == "O" && @board[win_combination[1]] == "O" && @board[win_combination[2]] == "O"
          return "O"
        end
      end
    end
  end

  def play
    until over?
      turn
    end
    if winner == "X"
      puts "Congratulations X!"
    elsif winner == "O"
      puts "Congratulations O!"
    elsif draw?
      puts "Cats Game!"
    end
  end
end
