class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  WIN_COMBINATIONS = [[0,1,2],[0,3,6],[0,4,8],[1,4,7],[2,4,6],[2,5,8],[3,4,5],[6,7,8]]

  def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
  user_input.to_i - 1
  end

  def move(user_input, value = "X")
    index = input_to_index(user_input)
    @board[index] = value
  end

  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      return true
    else return false
    end
  end

  def valid_move?(user_input)
    index = input_to_index(user_input)
    if index.between?(0,8) && !position_taken?(index)
      return true
    else return false
    end
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    until valid_move?(user_input) do
      puts "Try again. Where would you like to move?"
      user_input = gets.strip
    end
    move(user_input,current_player)
    display_board
  end

  def turn_count
    turnz = 0
    @board.each do |index|
      if index == "X" || index == "O"
        turnz += 1
      end
    end
    return turnz
  end

  def current_player
    if turn_count % 2 == 0
      return "X"
    elsif turn_count % 2 != 0
      return "O"
    end
  end

  def won?
    WIN_COMBINATIONS.each do |index|
      win_index_1 = index[0]
      win_index_2 = index[1]
      win_index_3 = index[2]
      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]
      if position_taken?(win_index_1)
        if position_1 == position_2 && position_2 == position_3
          return true
        end
      end
    end
    return false
  end

  def full?
    counter = 0
    @board.each do |index|
      if index == "X" || index == "O"
        counter += 1
      end
      if counter >= 8
        return true
      end
    end
    return false
  end

  def draw?
    if !won? && full?
      return true
    else return false
    end
  end

  def over?
    if draw? || won? || full?
      return true
    else return false
    end
  end

  def winner
    WIN_COMBINATIONS.each do |index|
      win_index_1 = index[0]
      win_index_2 = index[1]
      win_index_3 = index[2]
      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]
      if position_taken?(win_index_1)
        if position_1 == position_2 && position_2 == position_3
          return "#{@board[win_index_1]}"
        end
      end
    end
    return nil
  end

  def play
    until over? do
      turn
    end
    if won? == false && draw?
      puts "Cats Game!"
    elsif won?
      puts "Congratulations #{winner}!"
    end
  end

end
