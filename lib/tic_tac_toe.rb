#Define the TicTacToe class
class TicTacToe

  #initialize method
  def initialize
    #@board is the instance variable
    @board = Array.new(9, " ")
  end

  #a constant 2D array containing all 8 possible winning combinations
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2],
  ]  

  #displays the current board
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  #adds a token to the @board array
  def move(location, token='X')
    @board[location-1] = token
  end

  #checks if the position is already filled
  def position_taken?(location)
    @board[location] == 'X' || @board[location] == 'O' ? true : false
  end

  #checks if user input is valid and position is not taken
  def valid_move?(location)
    if location.to_i < 1 || location.to_i > 9
      return false
    elsif position_taken?(location.to_i-1)
      return false
    else
      return true
    end
  end

  #player turn algorithm
  def turn
    puts "Enter a position 1-9:"
    position = gets.strip
    if valid_move?(position)
      move(position.to_i, current_player)
      display_board
    else
      turn
    end
  end

  #returns the number of turns taken
  def turn_count
    @board.count {|square| square == 'X' || square == 'O'}
  end

  #returns current player
  def current_player
    turn_count%2==0 ? 'X' : 'O'
  end

  #returns the winning combination as an array
  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index1 = win_combination[0]
      win_index2 = win_combination[1]
      win_index3 = win_combination[2]

      position1 = @board[win_index1]
      position2 = @board[win_index2]
      position3 = @board[win_index3]

      if position1 == 'X' && position2 == 'X' && position3 == 'X'
        return win_combination
      elsif position1 == 'O' && position2 == 'O' && position3 == 'O'
        return win_combination
      end
    end
    return false
  end

  #returns true/false if board is full
  def full?
    @board.all? {|position| position == 'X' || position == 'O'}
  end

  #returns true/false if game is a tie
  def draw?
    if full?
      won? ? false : true
    else
      false
    end
  end

  #returns true/false if game is over
  def over?
    won? || draw?
  end

  #returns winning player or nil
  def winner
    won? ? @board[won?[0]] : nil
  end

  #
  def play
    if over?
      puts won? ? "Congratulations #{winner}!" : "Cats Game!"
    else
      turn
      #recursively call play until the game is over
      play
    end
  end

end #end of class