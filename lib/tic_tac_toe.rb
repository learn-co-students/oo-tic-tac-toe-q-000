class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end

  def display_board
    #this just sets up the board - nothing fancy
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  WIN_COMBINATIONS = [
    #This is a constant that contains every possible
    #winning combination for the game of tic-tac-toe
    [0,1,2], #Top Horizontal
    [3,4,5], #Middle Horizontal
    [6,7,8], #Bottom Horizontal
    [0,3,6], #Left Vertical
    [1,4,7], #Middle Vertical
    [2,5,8], #Right Vertical
    [0,4,8], #Top Left -> Bottom Right
    [6,4,2]  #Bottom Left -> Top Right
    ]

  def move(position, player = "X")
    #Place the given player's token onto the board
    @board[position.to_i - 1] = player
  end

  def position_taken?(position)
    #check to see if a position is empty
    !(@board[position].nil? || @board[position] == " ")
  end

  def valid_move?(position)
    #check to see if a position is on the board, and if it is taken
    position.to_i.between?(1,9) && !position_taken?(position.to_i - 1)
  end

  def turn
    #ask for the user to input their move
    puts "Please enter 1-9:"
    position = gets.strip
    if valid_move?(position)
      #if the move is valid, make the move
      move(position, current_player)
    else
      #if the move is invalid, ask for another move
      puts "Please enter 1-9:"
      position = gets.strip
    end
    #show the board after a turn is taken
    display_board
  end

  def turn_count
    #returns number of turns that have been played
    counter = 0
    @board.each do |value|
      #for each board value, check for a player's token
      #if the position is taken
      value == "X" || value =="O" ? counter += 1 : nil
      #why doesn't this work?
      #position_taken?(value.to_i) ? counter += 1 : nil
    end
    return counter
  end

  def current_player
    #check to see if the number of players is even/odd
    #odd means it is O's turn, even mean's it's X's turn
    turn_count.even? ? "X" : "O"
  end

  def won?
    #iterate through each combo for a winning combination
    WIN_COMBINATIONS.each do |winning_combo|
      if winning_combo.all?{|i| @board[i] == "X"} || winning_combo.all?{|i| @board[i] == "O"}
        return winning_combo
      end
    end
    return false
  end

  def full?
    #check for an X or an O in every position
    @board.all?{|v| v == "X" || v == "O"}
  end

  def draw?
    #for it to be a draw, the board must be full and no one can win
    won? == false && full? == true
  end

  def over?
    #for it to be over someone must have one or it must be a draw
    won? || draw?
  end

  def winner
    #if someone won, return the first character of the winning array
    @board[won?[0]] if won?
  end

  def play
    until over? do
      turn
    end
    puts "Congratulations #{winner}!" if won?
    puts "Cats Game!" if draw?
  end
end