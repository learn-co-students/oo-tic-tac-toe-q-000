class TicTacToe

  WIN_COMBINATIONS = [[0, 1, 2], [0, 3, 6], [0, 4, 8], [2, 5, 8], [6, 7, 8], [1, 4, 7], [2, 4, 6], [3, 4, 5]]

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    @player = "X"
    display_board
  end

  def board
    @board
  end

  def player
    @player
  end

  def play
    while !over?
      turn
    end
    if draw?
      puts "Cats Game!"
    elsif winner != nil
      puts "Congratulations #{winner}!"
    end
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(location, player="X")
    location = location.to_i - 1
    @board[location] = player
  end

  def position_taken?(location)
    @board[location] != " "
  end

  def valid_move?(location)
    location = location.to_i - 1
    location.between?(0,8) && !position_taken?(location)
  end

  def turn
    puts "Please select a space from 1-9:"
    location = -1
    while (!valid_move?(location))
      location = gets.strip
    end
    move(location, @player)
    display_board
    if @player == "X"
      @player = "O"
    else
      @player = "X"
    end
  end

  def turn_count
    count = 0
    @board.each do |place|
      if place == "X" || place == "O"
        count += 1
      end
    end
    return count
  end

  def current_player
    if turn_count%2 == 0
      return "X"
    else return "O"
    end
  end

  def won?
    if !@board.include?("X") && !@board.include?("O")
      return false
    end
    WIN_COMBINATIONS.each do |combo|
      if @board[combo[0]] == 'X' || @board[combo[0]] == 'O'
        if @board[combo[0]] == @board[combo[1]] && @board[combo[0]] == @board[combo[2]]
          return combo
        end
      end
    end
    return false
  end

  def full?
    if @board.include?(" ")
      return false
    end
    return true
  end

  def draw?
    if !won? && full?
      return true
    end
    return false
  end

  def over?
    if full? || draw? || won?
      return true
    end
    return false
  end

  def winner
    victor = won?
    if victor == false
      return nil
    else
      return @board[victor[0]]
    end
  end
end
