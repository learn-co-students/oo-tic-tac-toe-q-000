class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
  [0,1,2], #TOP ROW
  [3,4,5], #MIDDLE ROW
  [6,7,8], #BOTTOM ROW
  [0,3,6], #FIRST COLUMN
  [1,4,7], #MIDDLE COLUMN
  [2,5,8], #LAST COLUM
  [0,4,8], #0 DIAGONAL
  [6,4,2]  #2 DIAGONAL
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, char="X")
    @board[position.to_i-1] = char
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
    if position_taken?(position - 1) == true && position.between?(1,9)
      return false
     elsif position_taken?(position - 1) == false && position.between?(1,9)
      return true
    end
  end

  def turn
    puts "Please enter 1-9:"
    position = gets
    if valid_move?(position) == true
      move(position, current_player)
    else
      turn
    end
    display_board
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    if turn_count.even?
      "X"
    else
      "O"
    end
  end

  def won?
    WIN_COMBINATIONS.find do |win_comb|
    position_taken?(win_comb[0]) &&
    @board[win_comb[0]] == @board[win_comb[1]] && @board[win_comb[0]] == @board[win_comb[2]]
    end
  end

  def full?
    @board.all?{|spot| !(spot.nil? || spot == " ")}
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw? || full?
  end

  def winner
    if win = won?
      @board[win[0]]
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