class TicTacToe
  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6],
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} \n-----------\n #{@board[3]} | #{@board[4]} | #{@board[5]} \n-----------\n #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(idx,token="X")
    @board[idx.to_i - 1] = token
  end

  def position_taken?(position)
    if @board[position] == " " || @board[position] == "" || @board[position] == nil
      return false
    elsif @board[position] == "X" || @board[position] == "O"
      return true
    end
  end

  def valid_move?(position)
    position = position.to_i
    if position > 9 || position < 1
      return false
    elsif !position_taken?(position - 1)
      return true
    end
  end

  def turn
    puts "Please enter 1-9:"
    position = gets.strip
    if valid_move?(position)
      move(position,current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    return @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    count = turn_count
    if count % 2 == 0
      "X"
    else
      "O"
    end
  end

  def won?
    win = WIN_COMBINATIONS.detect{|i| @board[i[0]] + @board[i[1]] + @board[i[2]] == "XXX" || @board[i[0]] + @board[i[1]] + @board[i[2]] == "OOO"}
    if !win
      return false
    else
      win
    end
  end

  def full?
    @board.all?{|i| i == "X" || i == "O"}
  end

  def draw?
    if !won? && full?
      true
    end
  end

  def over?
    return draw? || won?
  end

  def winner
    if !won?
      nil
    else @board[won?[0]]
    end
  end

  def play
    while !over?
      turn
    end
    if draw?
      puts "Cats Game!"
    else
      puts "Congratulations #{winner}!"
    end
  end
end
