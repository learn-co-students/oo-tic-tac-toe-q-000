class TicTacToe
	def initialize(board=Array.new(9," "))
		@board = board
	end
	def display_board
		puts " " + @board[0..2].join(" | ") + " \n#{'-'*11}\n " + @board[3..5].join(" | ") + " \n#{'-'*11}\n " + @board[6..8].join(" | ") + " "
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
	def move(position, character)
		@board[position.to_i - 1] = character
	end
	def position_taken?(position)
		!(@board[position].nil? || @board[position] == " ")
	end
	def valid_move?(position)
		!(position_taken?(position.to_i - 1) || position.to_i.to_s != position)
	end
	def current_player
		if turn_count % 2 == 0
			return "X"
		else
			return "O"
		end
	end
	def turn_count
		count = 0
		@board.each do |space|
			if space == "X" || space == "O"
				count += 1
			end
		end
		return count
	end
	def turn
		choice = gets.strip
		if valid_move?(choice)
			move(choice, current_player)
		else
			turn
		end
		display_board
	end
	def won?
		WIN_COMBINATIONS.each do |combo|
			winning_combo = @board[combo[0]].to_s + @board[combo[1]].to_s + @board[combo[2]].to_s
			if winning_combo == "XXX" || winning_combo == "OOO"
				return combo
			end
		end
		return false
	end
	def full?
		!@board.include?(" ")
	end
	def draw?
		!won? && full?
	end
	def over?
		won? || draw?
	end
	def winner
		if won?
			return @board[won?[0]]
		else
			return nil
		end
	end
	def play
		until over?
			puts "Please pick an empty space from 1-9"
			turn
		end
		if won?
			puts "Congratulations #{winner}!"
		elsif draw?
			puts "Cats Game!"
		end
	end
end
