class TicTacToe
  def initialize(board = nil)
    @board = (board || (Array.new 9, " "))
  end

  def display_board
    sep = "-----------"
    puts" #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts sep
    puts" #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts sep
    puts" #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  WIN_COMBINATIONS = [
    [0,1,2], # Top Row
    [3,4,5], # Mid Row
    [6,7,8], # Bot Row
    [0,3,6], # Left Col
    [1,4,7], # Mid Col
    [2,5,8], # Right Col
    [0,4,8], # L2R Diag
    [6,4,2] # R2L Diag
  ]

  def move(location, player = current_player)
    @board[location.to_i.pred] = player
    puts @board
  end

  def turn_count
    filled_squares = []
    @board.each do |square|
      if (square == "X" || square == "O")
        filled_squares<<square
      end
    end
    filled_squares.count
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def position_taken?(location)
    if @board[location.to_i] != "X" && @board[location.to_i] != "O"
      false
    else
      true
    end
  end

  def valid_move?(position)
    if position.to_i.between?(1,9) && !position_taken?(position.to_i.pred)
      true
    else
      false
    end
  end

  def turn
    puts "Please enter 1-9:"
    position = gets.strip
    if valid_move?(position)
      move(position)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

      if position_1=="X" && position_2=="X" && position_3 =="X"
        return win_combination
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      end
    end
    false
  end

  def full?
    if (@board.count("X") + @board.count("O") > 8)
      true
    end
  end

  def draw?
    if full? && !won?
      true
    end
  end

  def over?
    if draw? || won?
      true
    end
  end

  def winner
    if won? == false
      nil
    elsif @board[won?[0]] =="X"
      "X"
    elsif @board[won?[0]] == "O"
      "O"
    end
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
