class TicTacToe
  def initialize(board=Array.new(9, " "))
    @board = board
  end
  WIN_COMBINATIONS = [
    [0,1,2],
    [0,3,6],
    [0,4,8],
    [3,4,5],
    [6,7,8],
    [1,4,7],
    [2,5,8],
    [6,4,2]
    ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} \n\
-----------\n\
 #{@board[3]} | #{@board[4]} | #{@board[5]} \n\
-----------\n\
 #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position,char="X")
    @board[position.to_i-1] = char
  end

  def position_taken?(position)
    return  @board[position.to_i] == "X" || @board[position.to_i] == "O"
  end

  def valid_move?(position)
    !position_taken?(position.to_i-1) && position.to_i.between?(1,9)
  end

 def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end


  def turn
    playing = true
    while(playing)
    puts "Choose a position from 1-9"
    position = gets.strip
      if valid_move?(position)
        playing = false
      end
    end
    move(position, current_player)
    display_board
  end

  def turn_count
    count = 0
    @board.each do |x|
      if x == "X" || x == "O"
        count+=1
      end
    end
    return count
  end

 
  def won?
    WIN_COMBINATIONS.each do |x|
      if ((@board[(x[0])] == "X" && @board[(x[1])] == "X" && @board[(x[2])] == "X") || (@board[(x[0])] == "O" && @board[(x[1])] == "O" && @board[(x[2])] == "O"))
      return x
      end
    end
    return false
  end

  def full?
    @board.all? do |x|
      x == "X" || x == "O"
    end
  end

  def draw?
    !won? && full?
  end

  def over?
    won? ||  draw?
  end

  def winner
    if won?
      return @board[(won?[0])]
    else
      return nil
    end
  end

  def play
    playing = !over?
    while(playing)
      turn
      won?
      playing = !over?
    end
    if won?
    puts "Congratulations #{winner}!"
    else
      puts "Cats Game!"
    end
  end


end