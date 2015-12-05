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

  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # First column
  [1,4,7], # second column
  [2,5,8], # third column
  [0,4,8], # diagonal win from left
  [6,4,2]  # diagonal win from right
  ]



  def move(input, char = "X" )
    @board[input.to_i-1] = char
  end

  def position_taken?(position)
    if @board[position] == " " || @board[position] == "" || @board[position] == nil
      return false
    elsif @board[position] == "X" || @board[position] == "O"
      return true
    end
  end

  def valid_move?(input)
    input.to_i.between?(1,9) && !position_taken?(input.to_i-1)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if !valid_move?(input)
      turn
    end
    move(input, current_player)
    display_board
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.find do |i|
      @board[i[0]] == @board[i[1]] &&
      @board[i[1]] == @board[i[2]] &&
      position_taken?(i[0])
    end
  end

  
  def full?
    @board.all?{|i| i == "X" || i == "O"}
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    if i = won?
      @board[i.first]
    end
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def play
    while !over?
      turn
    end
    if winner == "X"
      puts "Congratulations X!"
    elsif winner == "O"
      puts "Congratulations O!"
    else 
      puts "Cats Game!"
    end
  end

end

