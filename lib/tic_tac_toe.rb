class TicTacToe

	def initialize
		@board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
	end

	WIN_COMBINATIONS = [
	[0,1,2], #Top Row
	[3,4,5], #Middle Row
	[6,7,8], #Bottom Row
	[0,3,6], #Left Column
	[1,4,7], #Middle Column
	[2,5,8], #Right Column
	[0,4,8], #Top Left to Bottom Right
	[2,4,6]  #Top Right to Bottom Left
	]

	def display_board
		puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
		puts "------------"
		puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
		puts "------------"
		puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
	end

	def move(user_input, token="X")
		token = current_player
		index = user_input.to_i - 1
		@board[index] = token
	end

	def position_taken?(user_input)
		!(@board[user_input].nil? || @board[user_input] == " ")
	end

	def valid_move?(user_input)
		index = user_input.to_i - 1
		index.between?(0,8) && !position_taken?(index)
	end

	#Make One valid turn cycle
	def turn
		puts "Where do you want to move? (1-9):"
		user_input = gets.strip
		if valid_move?(user_input)
			move(user_input)
			display_board
		else
			puts "Invalid move."
			turn
		end
	end

	def turn_count
		counter = 0
		@board.each do |position|
			if position == "X" || position == "O"
				counter += 1
			end
		end
		return counter
	end

	#Use turn_count to determine current player
	def current_player
		unless turn_count == 0 || turn_count % 2 == 0
			return "O"
		else
			return "X"
		end
	end

	def won?
		WIN_COMBINATIONS.detect do |win_combination|
			@board[win_combination[0]] == @board[win_combination[1]] &&
			@board[win_combination[1]] == @board[win_combination[2]] &&
			@board[win_combination[0]] != " "
		end
	end

	def full?
		@board.all? do |position|
			position == "X" || position == "O"
		end
	end

	def draw?
		!won? && full?
	end

	def over?
		won? || draw?
	end

	def winner
		if over?
			win_combo = won?
			return @board[win_combo[1]]
		end
	end

	def play
		puts "Welcome to Tic Tac Toe!"
		while !over?
			turn
		end
		if won?
			puts "Congratulations #{winner}!"
		elsif draw?
			puts "Cats Game!"
		end
	end

end