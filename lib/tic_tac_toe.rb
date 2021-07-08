class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

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

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(location, token = "X")
    location = location.to_i-1
    @board[location] = token
    display_board
  end

  # Helper Method - position taken if true, not taken if false.
  def position_taken?(location)
    !(@board[location].nil? || @board[location] == " ")
  end

  def valid_move?(location)
    location = location.to_i-1
    location.between?(0,8) && !position_taken?(location)
  end

  def turn
    puts "Please enter 1-9:"
    location = gets.strip

    if valid_move?(location)
      move(location, current_player)
    else
      turn
    end
  end

  def turn_count
    counter = 0

    @board.each do |x|
      if(x != " ")
        counter += 1
      end
    end
    return counter
  end

  def current_player
    count = turn_count

    if count % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  #return false/nil if there is no win combination present 
  #in the board and return the winning combination indexes as an array if there is a win.
   def won?
    WIN_COMBINATIONS.detect do |combo|
       @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]] && position_taken?(combo[0])
    end
   end

  #return true if every element in the board contains either an "X" or an "O"
  def full?
    @board.all? {|x| x != " "}
  end

  #returns true if the board has not been won and is full 
  #and false if the board is not won and the board is not full, and false if the board is won
  def draw?
    if won? 
      false 
    else full? 
    end
  end

  #returns true if the board has been won, is a draw, or is full. 
  def over?
    won? || draw?
  end

  def winner
    if winner = won?
      @board[won?[0]]
    end
  end

  def play
  until over?
    turn
  end

  if winner == "X"
    puts "Congratulations X!"
  elsif winner == "O"
    puts "Congratulations O!"
  else draw?
    puts "Cats Game!"
  end
end

end