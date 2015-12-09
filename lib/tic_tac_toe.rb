class TicTacToe
  
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]]

  def initialize
    @board = Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, player = "X")
    @board[position - 1] = player
  end

  def position_taken?(position)
    space = @board[position]
    space == "X" || space == "O"
  end

  def valid_move?(position)
    position = position.to_i
    position.between?(1, 9) && !position_taken?(position - 1)
  end   

  def turn
    puts "Please enter a position between 1 and 9:"
    position = gets.strip
    if valid_move?(position)
      move(position.to_i, current_player)
    else
      turn
    end
    display_board
  end

  def turn_count
    @board.count {|space| space == "X" || space =="O" }
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def won?
    result = WIN_COMBINATIONS.select do |combo|
      ["X", "O"].any? do |player|
        combo.all? do |space|
          @board[space] == player
        end
      end
    end
    result != [] ? result[0] : false
  end

  def full?
    @board.all? do |space|
      space == "X" or space == "O"
    end
  end

  def draw?
    full? && !won?  
  end

  def over?
    won? || draw? || full?
  end

  def winner
    winning_combo = won?
    winning_combo ? @board[winning_combo[0]] : nil
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cats Game!"
    end
  end
end

