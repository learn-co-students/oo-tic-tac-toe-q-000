class TicTacToe
  #initializing an instance of TicTacToe
  #the instance of the game creates the starting state of the board
  #an array with 9 " " empty strings, within an instance variable @board.
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  # Define your WIN_COMBINATIONS constant - all the possible three-location wins!
  WIN_COMBINATIONS = [
  [0,1,2], # top row
  [3,4,5], # middle row
  [6,7,8], # bottom row
  [0,3,6], # left column
  [1,4,7], # middle column
  [2,5,8], # right column
  [0,4,8], # diag top left to bottom right
  [6,4,2]] # diag top right to bottom left

  # code your #display_board method to show the state of the board based on the @board instance variable
  def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} " 
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  # code your #move method to ask for the user choice
  def move(location, token = "X")
  #this sets the correct index value of the chosen position on the board equal to the token 
  #(i.e., puts an X or O where you chose, if valid)
  @board[location.to_i-1]= token
  end

  # code your #position_taken? method here, so that it can assist the #valid_move? method
  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  # code your #valid_move? method here to see if the user selection is OK to make
  def valid_move?(location)
    location.to_i.between?(1,9) && !position_taken?(location.to_i-1)
  end

  #code your #turn method to ask the user for their location choice
  def turn
    puts "Please enter 1-9:"
    location = gets.strip
    if valid_move?(location)
        token = current_player #This was not clear in the instructions on how to get the correct token
        move(location, token)
    else
      turn
    end
    display_board
  end

  # code your #turn_count method that returns the number of turns that have been played
   def turn_count
    @board.count{|token| token == "X" || token == "O"} # << tweaked
  end

  #code #current_player method that uses the #turn_count method to return which player gets to move
  def current_player
    turn_count % 2 == 0 ? "X" : "O" # << tweaked
  end

  # define your #won? method to test if any of the WIN_COMBINATIONS has been matched
  def won?
    WIN_COMBINATIONS.detect do |wc|
      @board[wc[0]] == @board[wc[1]] && @board[wc[1]] == @board[wc[2]] && position_taken?(wc[0])
    end  
  end

  # define your #full? method to see if the board has all locations taken
  def full?
    @board.all? do |location| 
      location == "X" || location == "O"
    end
  end

  # define your #draw? method, which checks to see if the board is full and/or won
  def draw?
    if full? && !won?
      return true
    else
      return false
    end
  end

  # define #over? method to see if the game is over based on a win or draw
  def over?
    won? || draw? || full?
  end

  # define #winner method to determine based on the WIN_COMBINATION which of "X" or "O" won the game
  def winner  
      @board[won?[0]] if won?
  end

  # code your #play method here
  def play
    turn until over?
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cats Game!"
    end
  end

end
