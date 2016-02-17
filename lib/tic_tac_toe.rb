class TicTacToe

  def initialize
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2],
  ]  

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(location, token='X')
    @board[location-1] = token
  end

  def position_taken?(location)
    if @board[location] == 'X' || @board[location] == 'O'
      return true
    else
      return false
    end
  end

  def valid_move?(location)
    if location.to_i < 1 || location.to_i > 9
      return false
    elsif position_taken?(location.to_i-1)
      return false
    else
      return true
    end
  end

  def turn
    puts "Enter a position 1-9:"
    position = gets.strip
    if valid_move?(position)
      move(position.to_i, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    count = 0
    @board.each do |space|
      if space == 'X' || space == 'O'
        count += 1
      end
    end
    return count
  end

  def current_player
    return turn_count%2==0 ? 'X' : 'O'
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index1 = win_combination[0]
      win_index2 = win_combination[1]
      win_index3 = win_combination[2]

      position1 = @board[win_index1]
      position2 = @board[win_index2]
      position3 = @board[win_index3]

      if position1 == 'X' && position2 == 'X' && position3 == 'X'
        return win_combination
      elsif position1 == 'O' && position2 == 'O' && position3 == 'O'
        return win_combination
      end
    end
    return false
  end

  def full?
    isFull = true

    @board.each do |space|
      if space == ' '
        isFull = false
      end
    end

    return isFull
  end

  def draw?
    if full?
      if won?
        return false
      else
        return true
      end
    else
      return false
    end
  end

  def over?
    return won? || draw?
  end

  def winner
    if won?
      return @board[won?[0]]
    else
      return nil
    end
  end

  def play
    if over?
      if won?
        puts "Congratulations #{winner}!"
      else
        puts "Cats Game!"
      end
    else
      turn
      play
    end
  end

end #end of class