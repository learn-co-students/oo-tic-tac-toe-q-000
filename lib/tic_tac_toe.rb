class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0, 1, 2], # Top row
    [3, 4, 5],  # Middle row
    [6, 7, 8], # Bottom row

    [0, 3, 6], # left column
    [1, 4, 7], # middle column
    [2, 5, 8], # right column

    [0, 4, 8], # left diagonal
    [6, 4, 2]  # right diagonal
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end


  def move(location, current_player = "X")
    @board[location.to_i-1] = current_player
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
      move(input, current_player)
    else
      turn
    end
    display_board
  end

  def won?
    win_combination ||= nil
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      end
    end
    return win_combination
  end

  def full?
    @board.none? do |position|
      position == "" || position == " "
    end
  end

  def draw?
    if !full?
      return false
    elsif won?
      return false
    else
      return true
    end
  end

  def over?
    if won? || full? || draw?
      return true
    end
  end

  def winner
    winning = won?
    winning ? @board[winning[0]] : nil
  end

  # End of Helper Methods

  def play
    until over?
      turn
      turn_count
    end
    if over?
      if won?
        return puts "Congratulations #{winner}!"
      else
        return puts "Cats Game!"
      end
    end
  end

end



