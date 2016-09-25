class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2], #horizontal top row
    [3,4,5], #horizontal middle row
    [6,7,8], #horizontal bottom row
    [0,3,6], #vertical first column
    [1,4,7], #vertical second column
    [2,5,8], #vertical third column
    [0,4,8], #top left to bottom right diagnoal
    [2,4,6] #top right to bottom left diagnoal
  ]
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(index, value = "X")
      @board[index-1] = value
  end

  def position_taken?(input)
    index = input.to_i
    if @board[index] == "O"
      return true
    elsif @board[index] == "X"
      return true
    elsif @board[index] != "X"
      return false
    elsif @board[index] != "O"
      return false
    end
  end

  def valid_move?(index)
    input = index.to_i
    if !position_taken?(input-1) && input.between?(1,9)
      return true
    else
      return false
    end
  end

  def turn
    puts "Please enter 1-9:"
    value = gets.strip
    index = value.to_i
    if valid_move?(index) == true
      value = current_player
      move(index, value)
      display_board
    else
      puts "Please enter a valid input"
      turn
    end
  end

  def turn_count
    counter = 0
      @board.each do |position|
        if position == "X"
          counter += 1
        elsif position == "O"
          counter += 1
        else
          counter = counter
      end
    end
    return counter
  end

  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]

        position_1 = @board[win_index_1] # load the value of the board at win_index_1
        position_2 = @board[win_index_2] # load the value of the board at win_index_2
        position_3 = @board[win_index_3] # load the value of the board at win_index_3
        if position_1 == "X" && position_2 == "X" && position_3 == "X"
          return win_combination # return the win_combination indexes that won.
        elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
          return win_combination
        end
    end
    @board.each do |index|
      if index == " "
        return false
      else
        return false
      end
    end
  end

  def full?
      if @board.include? " "
        return false
      else
        return true
    end
  end

  def draw?
    won = won?
    if full? && !won
      return true
    else
      return false
    end
  end

  def over?
      if draw? || won? || full?
        return true
      else
        return false
    end
  end

  def winner
    if winner = won?
      if @board[winner[0]] == "X"
        return "X"
      elsif @board[winner[0]] == "O"
        return "O"
      end
    else
      return nil
    end
  end

  def play
    while over? == false
      turn
    end
    if won?
      @winner = winner
      puts "Congratulations #{@winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

end
