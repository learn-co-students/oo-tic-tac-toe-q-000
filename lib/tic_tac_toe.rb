class TicTacToe
  WIN_COMBINATIONS = [
  [0,1,2],  # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6],  # Left column
  [1,4,7],  # Middle column
  [2,5,8],  # Right column
  [0,4,8],  # Diagonal top left to bottom right
  [6,4,2]  # Diagonal top right to bottom left
  ]

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def draw?
    return true if full? == true && won? == false
  end

  def full?
    return true if (@board.count("X") + @board.count("O")) == @board.count
  end

  def move(location,char="X")
    @board[location.to_i - 1] = char
    @board
  end

  def over?
    return true if won? || draw? || full?
  end

  def play  # This is the main method to play the game!
    until over? == true do
      @board = turn
    end

    if draw?
      puts "Cats Game!"
    else
      puts "Congratulations #{winner}!"
    end

  end

  def position_taken?(position)
    return true if @board[position] == "X" || @board[position] == "O"
    return false
  end

  def turn
    valid = false
    until valid == true do
      puts "Please enter 1-9:"
      input = gets.chomp
      valid = valid_move?(input)
    end
    @board = move(input, current_player)
    display_board
    @board
  end

  def turn_count
    @board.count("X") + @board.count("O")
  end

  def valid_move?(position)
    i = position.to_i - 1
    return false if i > 8 || i < 0
    return true if position_taken?(i) == false
  end

  def winner
    win_combo = won?
    #binding.pry
    if win_combo == false
      return nil
    elsif @board[win_combo[0]] == "X"
      return "X"
    elsif @board[win_combo[0]] == "O"
      return "O"
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
        return combo
      elsif @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
        return combo
      end
    end
    return false
  end
end