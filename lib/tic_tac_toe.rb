class TicTacToe
  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # First column
  [1,4,7], # Second column
  [2,5,8], # Third column
  [0,4,8], # Top left bottom right diagonal
  [2,4,6]  # Top right bottom left diagonal
  ]
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, value)
    index = input_to_index(position)
    @board[index] = value
  end

  def input_to_index(position)
    index = position.to_i
    index = index - 1
    return index
  end

  def position_taken?(index)
    if @board[index] == "" || @board[index] == " " || @board[index] == nil
      return false
    else
      return true
    end
  end

  def valid_move?(position)
    index = input_to_index(position)
    if index < 0 || index > 8
      return false
    else
      if position_taken?(index)
        return false
      else
        return true
      end
    end
  end

  def turn_count
    counter = 0
    @board.each do |position|
      if position == "X" || position == "O"
        counter += 1
      end
    end
    return counter
  end

  def current_player
    counter = turn_count
    remainder = counter % 2
    return remainder == 0 ? "X" : "O"
  end

  def all_same(winning_combo, token)
    winning_combo.all? do |position|
      @board[position] == token
    end
  end

  def won?
    WIN_COMBINATIONS.each do |winning_combo|
      if all_same(winning_combo, "X") == true || all_same(winning_combo, "O") == true
        return winning_combo
      end
    end
    return false
  end

  def full?
    @board.all? do |position|
      position == "X" || position == "O"
    end
  end

  def draw?
    !won? and full?
  end

  def over?
    won? || draw? || full?
  end

  def winner
    if won?
      winning_combo = won?
      token = @board[winning_combo[0]]
      return token
    else
      return nil
    end
  end

  def turn
    loop do
      puts "Please enter 1-9:"
      position = gets.strip
#      index = input_to_index(position)
#      if valid_move?(index)
      if valid_move?(position)
        value = current_player
#        move(index, value)
        move(position, value)
        display_board
        break
      end
    end
  end

  def play
    while !over? do
      turn
    end
    if over?
      if draw?
        puts "Cats Game!"
      else
        token = winner
        puts "Congratulations #{token}!"
      end
    end
  end

end
