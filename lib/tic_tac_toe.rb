class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,3,6], # Left column
    [1,4,7], # Middle column
    [2,5,8], # Right column
    [0,4,8], # Diagonal top left to bottom right
    [2,4,6]  # Diagonal bottom left to top right
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(input, mark = "X")
    index = input.to_i - 1
    @board[index] = mark
  end

  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      return true
    else
      return false
    end
  end

  def valid_move?(input)
    index = input.to_i - 1
    if index.between?(0, 8) && position_taken?(index) == false
      return true
    else
      return false
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets
    if valid_move?(input) == true
      move(input, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    spaces_full = 0
    @board.each do |space|
      if space != "" && space != " "
        spaces_full += 1
      end
    end
    return spaces_full
  end

  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combination|
      first_position_to_check = combination[0]
      second_position_to_check = combination[1]
      third_position_to_check = combination[2]

      position_1 = @board[first_position_to_check]
      position_2 = @board[second_position_to_check]
      position_3 = @board[third_position_to_check]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return combination # return the win_combination indexes that won.
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return combination # return the win_combination indexes that won.
      end
    end
    return false
  end

  def full?
    @board.each do |index|
      if index == "" || index == " "
        return false
      end
    end
    return true
  end

  def draw?
    if full? == true && won? == false
      return true
    elsif (won? == true)
      return false
    else
      return false
    end
  end

  def over?
    if full? == true || draw? == true || won? != false
      return true
    else
      return false
    end
  end

  def winner
    if won? == false
      return nil
    else
      winning_combination = won?
      if @board[winning_combination[0]] == "X"
        return "X"
      elsif @board[winning_combination[0]] == "O"
        return "O"
      end
    end
  end

  def play
    until over? == true
      turn
    end

    if won? != false
      winning_player = winner
      puts "Congratulations #{winning_player}!"
    elsif draw? == true
      puts "Cats Game!"
    end
  end

end
