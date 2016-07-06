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

  def move(position, character)
    @board[position - 1] = character
  end

  def position_taken?(position)
    if (@board[position] == " " || @board[position] == "" || @board[position] == nil)
      return false
    else
      return true
    end
  end

  def valid_move?(position)
    if position_taken?(position.to_i - 1)
      return false
    elsif (position.to_i - 1 < 0 || position.to_i - 1 > 8)
      return false
    else
      return true
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input.to_i)
      move(input.to_i, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    counter = 0
    @board.each do |occupy|
      if (occupy == "X" || occupy == "O")
      counter += 1
      end
    end
    return counter
  end

  def current_player
    turn_count.even? == true ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|

      position_1 = @board[win_combination[0]]
      position_2 = @board[win_combination[1]]
      position_3 = @board[win_combination[2]]

      if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return win_combination
      end
    end
    return false
  end

  def full?
    @board.all? do |index|
      index == "X" || index == "O"
    end
  end

  def draw?
    if (!won? && full?)
      return true
    else
      return false
    end
  end

  def over?
    if won? || draw? || full?
      return true
    end
  end

  def winner
    WIN_COMBINATIONS.each do |win_combination|

      position_1 = @board[win_combination[0]]
      position_2 = @board[win_combination[1]]
      position_3 = @board[win_combination[2]]

      if (position_1 == "X" && position_2 == "X" && position_3 == "X")
        return "X"
      elsif (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return "O"
      end
    end
    return nil
  end

  def play
    until over?
      turn
      won?
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif
      draw?
      puts "Cats Game!"
    end
  end
end
