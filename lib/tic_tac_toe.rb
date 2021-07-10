class TicTacToe

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

  def initialize
    @board = Array.new(9, " ")
  end

  def display_board
    row_divider = "-----------"
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts row_divider
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts row_divider
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(location, character="X")
    location = location.to_i - 1
    @board[location] = character
  end

  def position_taken?(location)
    !(@board[location].nil? || @board[location] == " ")
  end

  def valid_move?(position)
    position = position.to_i
    if (position.between?(1, 9) && !position_taken?(position-1)) 
      return true
    end
    return false
  end

  def turn
    puts "Please enter 1-9:"
    position = gets.strip
    if (valid_move?(position))
      move(position, current_player())
      display_board()
    else
      turn()
    end
  end

  def current_player()
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count()
    @board.count{|token| token == "X" || token == "O"}
  end

  def won?
  WIN_COMBINATIONS.each do|combo|
    index1 = combo[0]
    index2 = combo[1]
    index3 = combo[2]
    if (@board[index1] == @board[index2] && @board[index2] == @board[index3] && position_taken?(index1))
      return combo
    end
  end
    return false
  end

  def full?
    (0..@board.size-1).each do|i|
      if (!position_taken?(i)) 
        return false
      end
    end
    return true
  end

  def draw?
    if (!won? && full?)
      return true
    end
    return false
  end

  def over?
  if (won? || full? || draw?)
    return true
  end
  return false
  end

  def winner
    win_indices = won?
    if (win_indices)
      return @board[win_indices[0]]
    end
    return nil
  end

  def play
    until (over?)
      turn
    end

    if (won?)
      winner_char = winner
      puts "Congratulations #{winner_char}!"
    elsif (draw?)
      puts "Cats Game!"
    end
  end

end