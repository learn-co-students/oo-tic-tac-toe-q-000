class TicTacToe
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

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

  def move(location, current_player="X")
    @board[location - 1] = current_player
  end

  def position_taken?(location)
    @board[location.to_i] != " " && @board[location.to_i] != ""
  end

  def valid_move?(position)
    if !position.to_i.between?(1,9)
      return false
    elsif position_taken?(position.to_i - 1) 
      return false
    else
      return true
    end
  end

  def turn
    y = current_player
    x = gets.strip
    puts "Please enter 1-9:"
    if !valid_move?(x.to_i)
      turn
    else
      move(x.to_i, y)
    end
  end

  def current_player
    turn_count % 2 == 1 ? (return "O") : (return "X")
  end

  def turn_count
    count = 0
    @board.each do |space|
      if space != " "
        count += 1
      end
    end
    return count
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]
   
      if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return win_combination
      end
    end
  end

  def full?
    if @board.all?{|i| (i == "X") || (i == "O")}
      true
    else 
      false
    end
  end

  def draw?
    if !won? && full?
      true
    else
      false
    end
  end

  def over?
    if won? || draw? || full?
      return true
    else 
      false
    end
  end

  def winner
    if the_winner_combo = won?
      @board[the_winner_combo.first]
    end
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