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
      move(input)
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

end
