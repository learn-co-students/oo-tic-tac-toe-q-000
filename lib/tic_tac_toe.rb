class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  WIN_COMBINATIONS = [
    [0, 1, 2], 
    [3, 4, 5], 
    [6, 7, 8], 
    [0, 3, 6], 
    [1, 4, 7], 
    [2, 5, 8], 
    [0, 4, 8], 
    [6, 4, 2]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(location, token="X")
    @board[location.to_i-1] = token
  end

  def position_taken?(location)
    if @board[location] != " "
      true
    else
      false
    end
  end

  def valid_move?(location)
    if [1, 2, 3, 4, 5, 6, 7, 8, 9].include?(location.to_i) == true && position_taken?(location.to_i-1) == false
      true
    else
      false
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input) == true
      move(input, current_player)
    else
      turn
    end
    display_board
  end

  def turn_count
    counter = 0
    @board.each do |x|
      if x == "X" || x == "O"
        counter += 1
      else
      end
    end
    counter
  end

  def current_player
    if turn_count.even? == true
      "X"
    elsif turn_count == 0
      "X"
    else
      "O"
    end
  end

  def won?
    win_index_1 = 0
    win_index_2 = 0
    win_index_3 = 0
    position_1 = 0
    position_2 = 0
    position_3 = 0
    WIN_COMBINATIONS.each do |x|
      win_index_1 = x[0]
      win_index_2 = x[1]
      win_index_3 = x[2]
      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return x
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return x
      end
    end
    false
  end

  def full?
    if @board.include?(" ") == true
      false
    else
      true
    end
  end

  def draw?
    if won? == false && full? == true
      true
    elsif won? == false && full? == false
      false
    elsif won? != false
      false
    end      
  end

  def over?
      if won? != false
      true
    elsif draw? == true
      true
    elsif full? == true
      true
    else
      false
    end
  end

  def winner
    winner = won?
    if won? == false
    else
      #return x or o
      @board[won?[0]]
    end
  end

  def play
    until over? == true
      turn
    end

    if won? != false
      puts "Congratulations #{winner}!"
    elsif draw? ==  true
      puts "Cats Game!"
    end
  end
end