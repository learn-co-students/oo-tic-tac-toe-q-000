class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  WIN_COMBINATIONS = [
    [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]
  ]

  def move(position, player = "X")
    position = position.to_i - 1
    @board[position] = player
  end

  def position_taken?(position)
    if @board[position.to_i] == " " || @board[position.to_i] == "" || @board[position.to_i] == nil
      return false
    elsif @board[position.to_i] == "X" || @board[position] == "O"
      return true
    end
  end

  def valid_move?(position)
    if position.to_i > 9 || position.to_i < 1
      return false
    elsif position_taken?(position.to_i-1) == false
      return true
    else
      return false
    end
  end

  def turn
    puts "Please enter 1-9:"
    position = gets.strip
    until valid_move?(position) == true
      puts "invalid"
      position = gets.strip
    end
    player = current_player
    move(position, player)
    display_board
  end  

  def turn_count
    counter = 0
    @board.each do |turn|
      if turn == "O" || turn == "X"
        counter += 1
      end
    end
    counter
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O" 
  end

  def won?
    WIN_COMBINATIONS.each do |win_combo|
      position_1 = @board[win_combo[0]]
      position_2 = @board[win_combo[1]]
      position_3 = @board[win_combo[2]]
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combo
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combo
      end
    end
    return false
  end

  def full?
    if @board.detect{|i| i == " "} == " "
     return false
    end
    return true
  end

  def draw?
    if full? == true && won? == false
      return true
    elsif won? == false && full? == false
      return false
    elsif won? != false
      return false
    end
  end

  def over?
    if won? != false || full? == true || draw? == true
      return true
    else
      return false
    end
  end

  def winner
    if won? != false
      win_combo = won?
      @board[win_combo[0]]
    elsif won? == false 
      return nil
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
