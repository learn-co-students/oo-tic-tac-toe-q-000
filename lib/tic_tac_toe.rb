require 'pry'
class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],  # Bottom row
    [0,3,6], # Left column
    [1,4,7], # Middle column
    [2,5,8], # Right column
    [0,4,8], # Right diagonal
    [2,4,6]  # Left diagonal
  ]
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  def position_taken?(location)
  location=location.to_i
  @board[location] != " " && @board[location] != ""
  end
  def move(location, token="X" )
  @board[location.to_i - 1] = token
  end
 def valid_move?(position)
    position = position.to_i - 1
     if position_taken?(position) == false && position.to_i.between?(0, 8)
      return true
    elsif position_taken?(position) == true
      return false
    else
      return false
    end
   end
   def turn
      puts "Please enter 1-9:"
      position = gets.strip
      if valid_move?(position) == true
        move(position, token = current_player)
       elsif
        until valid_move?(position) == true
        puts "Invalid move.  Please select an unoccupied position on the board."
        position = gets.strip
         end
      end
     won?
      display_board

    end
def won?
  @win_var=[]
  WIN_COMBINATIONS.each do |win_combination|
		win_index1= win_combination[0]
		win_index2= win_combination[1]
		win_index3= win_combination[2]
		pos_1 = @board[win_index1]
		pos_2 = @board[win_index2]
		pos_3 = @board[win_index3]

	     if (pos_1 == "X" && pos_2 == "X" && pos_3 == "X")
	        return win_combination
		    end
        if  (pos_1 == "O" && pos_2 == "O" && pos_3 == "O")
	         @win_var=win_combination
          return win_combination
	      end
	 	  end
       return false
    end

##

  def full?
  !@board.any? {|element| (element ==" ") || (element =="")}
end
def draw?
  if !won? && full?
    return true
  elsif !won?&&!full?
    return false
  elsif won?
    return false
  end
end
def over?
  if won?||full?||draw?
    return true
  end
end
def winner
	if win_combination =won?
	  @board[win_combination.first]
  end
end


  # Define your play method below

 def play
	until over?
		turn
      if won?

        puts "Congratulations #{winner}!"

      elsif draw?
        puts "Cats Game!"

      end
  end

end


end








