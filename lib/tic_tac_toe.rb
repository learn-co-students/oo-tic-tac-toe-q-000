class TicTacToe

	def initialize()
		@board = Array.new(9, " ")
	end

	# within the body of TicTacToe
	WIN_COMBINATIONS = [
		[0,1,2], # Top row
		[3,4,5], # Middle row
		[6,7,8], # bottom row
		[0,4,8], # diag left top to bottom right
		[6,4,2], # top right bottom left
		[0,3,6], # 1st column
		[1,4,7], # 2nd column
		[2,5,8], # 3rd column
		# an array for each win combination
	]

	def display_board
		puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
		puts "-----------"
		puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
		puts "-----------"
		puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
		puts
	end

	def move(location, player=X)
		@board[location.to_i-1] = player
	end

	def position_taken?(location)
		@board[location] != " " && @board[location] != ""
	end

	def valid_move?(input)
		input.to_i.between?(1,9) && !position_taken?(input.to_i-1)
	end

	def turn
	    display_board
		puts "Please enter 1-9:\n"
		input = gets.strip
		if valid_move?(input)
			move(input, current_player)
		else
			puts "You're killing me Smalls! Try again.\n" # Late night coloring
			turn
		end

	end

	def turn_count
		@board.count{|player| player == "X" || player == "O"}
	end

	def current_player
		turn_count % 2 == 0 ? "X" : "O"
	end

	def won?
		WIN_COMBINATIONS.detect do |combo|
			(@board[combo[0]] == @board[combo[1]]) && (@board[combo[0]] == @board[combo[2]]) && ((@board[combo[0]] == "X") || (@board[combo[0]] == "O"))
		end
	end

	def full?
		@board.all?{|player| player == "X" || player == "O"}
	end

	def draw?
		!won? && @board.all?{|player| player == "X" || player == "O"}
	end

	def over?
		won? || draw? || full?
	end

	def winner
		won? ? @board[won?[0]] : nil
	end

	def play
		while !over?
			turn
		end
		if won?
			puts "\n\nWhoa! I was definitely not betting on you for the win." # Late night coloring
			puts "Congratulations #{winner}!"
		elsif draw?
			puts "\n\nUggh, two losers." # Late night coloring
			puts "Cats Game!"
		end
	end

end #end of class



