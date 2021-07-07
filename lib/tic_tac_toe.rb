class TicTacToe
  def initialize (board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [6, 4, 2]]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(location, current_player = current_player())
    @board[location.to_i-1] = current_player
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
      move(input)
    else
      turn()
    end
    display_board()
  end

  def turn_count
    count = 0
    @board.each do |tile|
      tile == "X" || tile == "O" ? count += 1 : nil
    end
    count
  end

  def won?
    WIN_COMBINATIONS.each do |condition|
      win_1 = condition[0]
      win_2 = condition[1]
      win_3 = condition[2]

      value_1 = @board[win_1]
      value_2 = @board[win_2]
      value_3 = @board[win_3]

      if value_1 == "X" && value_2 == "X" && value_3 == "X"
        return condition
      elsif value_1 == "O" && value_2 == "O" && value_3 == "O"
        return condition
      end
    end
    false
  end

  def full?
    @board.all? do |tile|
      tile == "X" || tile == "O"
    end
  end

  def draw?
    if won?()
      false
    elsif !won?() && full?()
      true
    end
  end

  def over?
    if draw?() || won?()
      true
    else
      false
    end
  end

  def winner
    if !won?()
      nil
    elsif @board[won?()[0]] == "X"
      "X"
    elsif @board[won?()[0]] == "O"
      "O"
    end
  end

  def play
    until over?()
      turn()
    end
    if won?()
      puts "Congratulations #{winner()}!"
    elsif draw?()
      puts "Cats Game!"
    end
  end
end