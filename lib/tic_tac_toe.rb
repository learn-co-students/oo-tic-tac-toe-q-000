class TicTacToe
  # Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom Row
    [0,3,6], # first column
    [1,4,7], #second column
    [2,5,8], #third column
    [0,4,8], # R to L diagonal
    [6,4,2] # L to R diagonal
  ]

  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end

  def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  # Make The Player's Move
  def move(location, current_player = "X")
    @board[location.to_i-1] = current_player
  end

  # Determine if Position Taken
  def position_taken?(location)
    !(@board[location].nil? || @board[location] == " ")
  end

  # Determine if Valid Move
  def valid_move?(position)
    position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
  end

  #Play a Turn
  def turn
    puts "Please enter a position: "
    position = gets.to_i
    
    until valid_move?(position) do
      position = gets.to_i
    end
      move(position, current_player)
    
      display_board
  end

  # Determine Current Player
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  # Determine # of Turns Played
  def turn_count
    counter = 0
    @board.each do |turn|
      if turn == "X" || turn =="O"
        counter +=1
      end
    end
  return counter
  end

# Check if We Have a Winner
def won?
  TicTacToe::WIN_COMBINATIONS.each do |win_array|

    win_index_1 = win_array[0]
    win_index_2 = win_array[1]
    win_index_3 = win_array[2]

    position_1 = @board[win_index_1] # load the value of the board at win_index_1
    position_2 = @board[win_index_2] # load the value of the board at win_index_2
    position_3 = @board[win_index_3] # load the value of the board at win_index_3

    if ((position_taken?(win_index_1) && position_1 =="X") && (position_taken?(win_index_2) && position_2 =="X") && (position_taken?(win_index_3) && position_3 =="X") or 
    (position_taken?(win_index_1) && position_1 =="O") && (position_taken?(win_index_2) && position_2 =="O") && (position_taken?(win_index_3) && position_3 =="O"))
         return win_array
    end
  end
  return false

end

  # Check if Board is Full
  def full?
    @board.all? {|i| (i =="X" || i =="O")}
  end

  # Check if we have a Draw
  def draw?
    if !won? && full? 
      return true 
    elsif !won? && !full?
      return false 
    elsif won?
      return false
    end
  end

  # Check if Game Over?
  def over?
  won? || full? || draw? ? true : false 
  end

  # Declare the Winner
  def winner
    if over? == true
      return @board[won?[0]]
    end
  end

  # Play the Game
  def play
    until over? == true
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end 

end
