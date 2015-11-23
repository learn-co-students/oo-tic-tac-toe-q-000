class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8], # Bottom row
    [0,3,6], # Left column
    [1,4,7], # Middle column
    [2,5,8], # Right column
    [0,4,8],# L to R Diagonal
    [6,4,2] # R to L Diagonal
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(location, player = 'X')
    location = location.to_i
    @board[location - 1] = player
    @board
  end

  def position_taken?(position)
    if @board[position] == " " || @board[position] == "" || @board[position] == nil
      return false
    else
      return true
    end
  end

  def valid_move?(position)
    position = position.to_i
    if position.between?(1,9) && position_taken?(position - 1) == false
      return true
    else
      return false
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
      move(input, current_player)
    else
      turn
    end
    display_board
  end

  def turn_count
    moves = 0
    @board.each do |pos|
      if pos == 'X' || pos == 'O'
        moves += 1
      end
    end
    return moves
  end

  def current_player
    turn_count.even? ? 'X' : 'O' 
  end

  def won?
    WIN_COMBINATIONS.detect do |combination|
     x_win = combination.all? do |pos|
               @board[pos] == 'X' 
             end

     o_win = combination.all? do |pos|
               @board[pos] == 'O' 
             end
     x_win || o_win
    end
  end

  def full?
    @board.all? do |pos|
      position_taken?(@board.index(pos))
    end
  end

  def draw?
    if full? == true && won? == nil
      return true
    else 
      false
    end
  end

  def over?
    if won? || full? || draw?
      return true
    end
  end

  def winner
    if won? != nil
      return @board[won?[0]]
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