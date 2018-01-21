class TicTacToe
  def initialize(board = nil)
    @board = board || [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, token = "X")
    position = position.to_i - 1
    @board[position] = token
  end

  def position_taken?(position)
    position = position.to_i
    if @board[position] == " " || @board[position] == "" || @board[position] == nil
      return false
    elsif @board[position] == "X" || @board[position] == "O"
      return true
    end
  end

  def valid_move?(position)
    position = position.to_i - 1
    if position.between?(0,8) && position_taken?(position) == false
      return true
    else
      return false
    end
  end

  def turn
    puts "Please enter 1-9:"
    position = gets.strip
    if valid_move?(position) == true
      move(position, current_player)
    elsif valid_move?(position) == false
      puts "That's not a valid move. Please try again."
      turn
    end
    display_board
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
    if turn_count.even?
      return "X"
    elsif turn_count.odd?
      return "O"
    end
  end

  def won?
    WIN_COMBINATIONS.any? do |combo|
      if combo.all? {|spot| @board[spot] == "X"}
        return combo
      elsif combo.all? {|spot| @board[spot] == "O"}
        return combo
      end
    end
  end

  def full?
    @board.all? {|spot| spot == "X" || spot == "O"}
  end

  def draw?
    if won? == false && full? == true
      return true
    elsif won? == false && full? == false
      return false
    elsif won? == true
      return false
    end
  end

  def over?
    if won? != false || draw? == true || full? == true
      return true
    end
  end

  def winner
    if won? == false
      return nil
    elsif won?.all? {|spot| @board[spot] == "X"}
      return "X"
    elsif won?.all? {|spot| @board[spot] == "O"}
      return "O"
    end
  end

  def play
    until over? == true
      turn
    end
    if winner == "X"
      puts "Congratulations X!"
    elsif winner == "O"
      puts "Congratulations O!"
    elsif draw? == true
      puts "Cats Game!"
    end
  end

end