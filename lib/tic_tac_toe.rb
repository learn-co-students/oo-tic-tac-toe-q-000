class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
  [0, 1, 2], # Top row
  [3, 4, 5], # Middle row
  [6, 7, 8], # Bottom row
  [0, 3, 6], # Left row
  [1, 4, 7], # Middle row
  [2, 5, 8], # Right row
  [0, 4, 8], # Backslash \
  [6, 4, 2], # Forward slash / for rspec
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, character = "X")
    if turn_count == 0
      @board[position.to_i - 1] = character
    elsif turn_count.even?
      @board[position.to_i - 1] = character
    elsif turn_count.odd?
      @board[position.to_i - 1] = "O"
    end
  end

  def position_taken?(position)
    if @board[position] == " " || @board[position] == "" || @board[position] == nil
      return false
    elsif @board[position] == "X" || @board[position] == "O"
      return true
    else
    end
  end

  def valid_move?(position)
    if !position_taken?(position.to_i - 1) && (position.to_i - 1).between?(0, 9)
      return true
    else
      return false
    end
  end

  def turn
    puts "Where would you like to go?"
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input) == true
       move(input)
       display_board
    else
      puts "Sorry, that is not a valid move."
      turn
  end
  end

  def turn_count
    counter = 0
    @board.each do |place|
    if place == "X" || place == "O" then counter += 1 end
    end
    return counter
  end

  def current_player
    if turn_count.even? then
      return "X"
    elsif turn_count.odd? then
      return "O"
    end
  end

  def won?
    WIN_COMBINATIONS.any? do |nested_array|
      if nested_array.all? { |index_position| @board[index_position] == "X" } == true
        return nested_array
      elsif nested_array.all? { |index_position| @board[index_position] == "O" } == true
        return nested_array
      else
      end
    end
  end

  def full?
    if @board.all? do |token|
      token == "X" || token == "O"
      end
      return true
    else
      return false
    end
  end

  def draw?
    if won? == false && full? == true
      then true
    elsif won? == false && full? == false
      then false
    elsif won? == true
      then false
    end
  end

  def over?
    if won? == true
      return true
    elsif draw? == true
      return true
    elsif full? == true
      return true
    end
  end

  def winner
    if won? == false
      return nil
    else
      if won?.all? { |nested_position| @board[nested_position] == "X" }
        return "X"
      elsif won?.all? { |nested_position| @board[nested_position] == "O" }
        return "O"
      end
    end
  end

  def play
    while over? != true
      if winner == "X" || winner == "O"
        break
      elsif
        turn
      end
    end

    if draw? == true
      puts "Cats Game!"
    elsif winner == "X"
      puts "Congratulations X!"
    elsif winner == "O"
      puts "Congratulations O!"
    end
  end

end