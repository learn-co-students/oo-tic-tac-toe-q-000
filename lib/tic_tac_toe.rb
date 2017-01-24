class TicTacToe
	def initialize(board = nil)
		@board = board || Array.new(9, " ")
	end

	def board=(board)
		@board = board
	end

	def board
		@board
	end

WIN_COMBINATIONS =[
	[0,1,2],	# Top Row
	[3,4,5],	# Middle Row
	[6,7,8],	# Bottom Row
	[0,3,6],	#First Vertical
	[1,4,7],	#Second Vertical
	[2,5,8],	#Third Vertical
	[0,4,8],	#Diagonal Down
	[6,4,2],	#Diagonal Up
]

	def display_board
	puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
	puts "-----------"
	puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
	puts "-----------"
	puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
	end

	def move(position, character = "X")
	@board[position.to_i-1] = character
	end

	def position_taken?(position)
	if @board[position] == "X"
		return true
	elsif @board[position] == "O"
		return true
	elsif @board[position] == " " || "" || nil
		return false
	end
	end

	def valid_move?(position)
 		if (1..9).include?(position.to_i) && !(position_taken?(position.to_i - 1))
 	   return true
 	 	else
   	 return false
 		 end
	end

	def current_player
	    turn_count % 2 == 0 ? "X" : "O"
	end

	def turn_count
	    @board.count{|token| token == "X" || token == "O"}
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

  def won?
	TicTacToe::WIN_COMBINATIONS.each do |win_combination|

	win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1] 
    position_2 = board[win_index_2] 
    position_3 = board[win_index_3]
    
    if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination 
        return true
    end
	end
	return false
	end

	def full?
	if @board.any?{|value| value == " "}
  		return false
	else
		return true
	end
	end

	def draw?
	if won? == true
		return false
	elsif !won? && full?
		return true
	elsif !won? && !full?
		return false
	end
	end

	def over?
	if won? || draw? || full?
		return true
	end
	end

	def winner
  		if won? == false
    		nil
  		elsif board[won?[0]] == "X"
    		return "X"
  		elsif board[won?[0]] == "O"
   			return "O"
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
    else 
      puts "Cats Game!"
    end
  	end

end