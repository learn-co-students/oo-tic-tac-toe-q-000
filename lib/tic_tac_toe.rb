class TicTacToe
  # Constants
  WIN_COMBINATIONS = [
    [0,1,2], #top row
    [3,4,5], #mid row
    [6,7,8], #low row
    [0,3,6], #left v
    [1,4,7], #mid v
    [2,5,8], #rite v
    [0,4,8], #diag1
    [2,4,6] #diag2
  ]

  # Methods
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

  def move(position, token="X")
    index = position.to_i - 1
    @board[index] = token
  end

  def position_taken?(index)
    @board[index] != " " && @board[index] != ""
  end

  def valid_move?(position)
    position = position.to_i
    position.between?(1,9) && !position_taken?(position - 1)
  end

  def turn
    puts "Please enter 1-9:"
    position = gets.strip
    if valid_move?(position)
      move(position, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    count = 0
    @board.each do |position|
      if position == "X" || position == "O"
        count += 1
      else
      end
    end
    return count
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def won?
    if @board.all?{ |position| position == " " }
      false
    elsif
      WIN_COMBINATIONS.each do |combo|
        plays = [@board[combo[0]],@board[combo[1]],@board[combo[2]]]
        if (plays == ["X","X","X"]) || (plays == ["O","O","O"])
          return combo
        else
          false
        end
      end
    else
      true
    end
  end

  def full?
    @board.none?{ |position| position == " " }
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
    while !over?
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
