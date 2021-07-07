class TicTacToe

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "] 
  end

  WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #left column
  [1,4,7], #middle column
  [2,5,8], #right column
  [0,4,8], #diagonal right
  [6,4,2]] #diagonal left

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, current_player = "X")
    @board[position.to_i-1] = current_player
  end

  def position_taken?(position)
    @board[position] != " " && @board[position] != ""
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
  end

  def turn
    puts "Please enter 1-9:"
    position = gets.strip
    if valid_move?(position)
      # Get the current player's token, X or O
      current_token = current_player
      # pass the current player's token to the board
      move(position, current_token)
    else
      turn
    end
    display_board
  end

  def turn_count
    count = 0
    @board.each {|character| 
      if (character == "X") || (character == "O") 
        count +=1 
      end
    }
    count
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.detect do |win|
      win.all? {|e| @board[e] == 'X'} || win.all? {|e| @board[e] == 'O'}
    end
  end

  def full?
    if @board.none?{|position|position == " "}
      return true
    else
      return false
    end
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw? 
  end

  def winner
      WIN_COMBINATIONS.each do |combo|
      return "X" if combo.all? {|position| @board[position] == 'X'}
      return "O" if combo.all? {|position| @board[position] == 'O'}
    end
    return nil
  end

  def play
    until over? 
     turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

end