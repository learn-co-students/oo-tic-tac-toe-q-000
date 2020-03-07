class TicTacToe
  # This arrray represents all the possible combinations of positions to be filled on the board that possibly constitute a victory for either side
  WIN_COMBINATIONS = [
    [0,1,2], #top row
    [3,4,5], #middle row
    [6,7,8], #bottom row
    [0,3,6], #left column
    [1,4,7], #middle column
    [2,5,8], #right column
    [0,4,8], #top left to bottom right diagonal
    [2,4,6]  #bottom left to top right diagonal
  ]

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def initialize()
    @board = Array.new(9, " ")
  end

  def display_board()
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(index, current_player)
    index = index.to_i
    @board[index-1] = current_player
  end

  def position_taken?(index)
    index = index.to_i
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    index = index.to_i
    (index-1).between?(0,8) && !position_taken?(index-1)
  end

  def turn()
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
      move(input, current_player())
      display_board()
    else
      turn()
    end
  end

  def turn_count()
    count = 0
    @board.each do | position |
      if position == "X" || position == "O"
        count += 1
      end
    end
    count
  end

  def current_player()
    turn_count() % 2 == 0 ? "X" : "O"
  end

  def all_filled?(positions)
    positions.all? do | position |
      @board[position] == "X" || @board[position] == "O"
    end
  end

  def all_X?(positions)
    positions.all? do | position |
      @board[position] == "X"
    end
  end

  def all_O?(positions)
    positions.all? do | position |
      @board[position] == "O"
    end
  end

  def won?()
    WIN_COMBINATIONS.each do | combo |
      if (all_filled?(combo) && (all_X?(combo) || all_O?(combo)))
        return combo
      end
    end
    return false
  end

  def full?()
    @board.all? do | space |
      space == "X" || space == "O"
    end
  end

  def draw?()
    !won?() && full?()
  end

  def over?()
    won?() || draw?()
  end

  def winner()
    if won?()
      winning_combo = won?()
      @board[winning_combo[0]]
    end
  end

  def play()
    until over?()
      turn()
    end
    if won?()
      if winner() == "X"
        puts "Congratulations X!"
      else
        puts "Congratulations O!"
      end
    else
      puts "Cats Game!"
    end
  end
end
