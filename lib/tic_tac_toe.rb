class TicTacToe
	def initialize
		@board = Array.new(9, " ")
	end

	def display_board
		puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
		puts "-----------"
		puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
		puts "-----------"
		puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
	end

	def move(position, token = "X")
		@board[position.to_i-1] = token	
	end

	def position_taken?(position)
		@board[position.to_i] != " " 
	end

	def valid_move?(position)
		@board[position.to_i-1] == " " && position.to_i.between?(1, 9)
	end

	def turn_count
		@board.select{|position| position != " "}.length
	end

	def current_player
		turn_count % 2 == 0 ? "X": "O"
	end

	def turn
		puts "Please enter 1-9:"
		input = gets.strip
		if valid_move?(input)
			move(input, current_player)
			display_board
		else
			turn
		end
	end

	def won?
		WIN_COMBINATIONS.detect{|combo| 
			p1 = @board[combo[0]]
			p2 = @board[combo[1]]
			p3 = @board[combo[2]]

			(p1 == "X" && p2 == "X" && p3 == "X") || (p1 == "O" && p2 == "O" && p3 == "O") ? combo : false 
		}
	end

	def full?
		@board.select{|position| position == " "}.length == 0
	end

	def draw?
		full? && !won?
	end

	def over?
		full? || won? || draw?
	end

	def winner
		won? ? @board[won?[0]] : nil
	end

	def play
		until over?
			turn
		end

		puts winner ? "Congratulations #{winner}!": "Cats Game!"
	end

	WIN_COMBINATIONS = [
		[0, 1, 2], 
		[0, 3, 6], 
		[0, 4, 8], 
		[1, 4, 7], 
		[2, 5, 8], 
		[3, 4, 5], 
		[6, 4, 2],
		[6, 7, 8]
	]
end
