class TicTacToe
  def initialize
    @board = Array.new(9," ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  WIN_COMBINATIONS = [
  [0,1,2], #top row win
  [3,4,5], #middle row win
  [6,7,8], #bottom row win
  [0,3,6], #left column win
  [1,4,7], #middle column win
  [2,5,8], #right column win
  [0,4,8], #topL to bottomR diag win
  [6,4,2] #topR to bottomL diag win
  ]

  def move(position,char=X)
    @board[position.to_i-1] = char
  end

  def position_taken?(position)
    !(@board[position.to_i]==" ")
  end

  def valid_move?(position)
    (position.to_i.between?(1,9)) && (position_taken?(position.to_i-1)==false)
  end

  def turn
    input = gets
    if valid_move?(input) == false
      puts "invalid"
      input = gets
    end
    @board[input.to_i-1] = current_player
  end

  def turn_count
    count = 0
    @board.each do |cell|
      if cell == "X" || cell == "O"
      count+=1
      end
    end
    return count
  end

  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      @p1 = @board[win_combination[0]]
      @p2 = @board[win_combination[1]]
      @p3 = @board[win_combination[2]]

      if (@p1 == "X" && @p2 == "X" && @p3 == "X") || (@p1 == "O" && @p2 == "O" && @p3 == "O")
        return true
      end
    end
    return false
  end

  def full?
    @board.all? {|cell| cell=="X" || cell=="O"}
  end

  def draw?
    !(won?) && full?
  end

  def over?
    won? || draw?
  end

  def winner
    if won?
      @p1
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cats Game!"
    end
  end

end