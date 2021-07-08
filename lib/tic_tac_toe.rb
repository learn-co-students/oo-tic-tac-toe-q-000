class TicTacToe

def initialize(board = nil)
	@board = board || Array.new(9, " ")
end

def display_board
	puts " #{@board[0]} " + "|" +  " #{@board[1]} " + "|" + " #{@board[2]} " + 
	"\n-----------\n" + 
	" #{@board[3]} " + "|" +  " #{@board[4]} " + "|" + " #{@board[5]} " + 
	"\n-----------\n"  +
	" #{@board[6]} " + "|" +  " #{@board[7]} " + "|" + " #{@board[8]} " 
end

	WIN_COMBINATIONS = 	[
		[0, 1, 2],
		[3, 4, 5],
		[6, 7, 8],
		[0, 3, 6],
		[1, 4, 7],
		[2, 5, 8],
		[0, 4, 8],
		[6, 4, 2]
	]

def move(position, current_player)
	 @board[position.to_i - 1] = current_player
end

def position_taken?(position)
	if @board[position] == " " || @board[position] == ""
		return false
	elsif @board[position] == nil
		return false
			else 
				return true			
	end
end

 def valid_move?(position)
	  position.to_i.between?(1,9) && !position_taken?(position.to_i - 1)
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

def turn_count
	@board.count{|token| token == "X" || token == "O"}
end

def current_player
	turn_count % 2 == 0 ? "X" : "O"
end

def won?
	WIN_COMBINATIONS.find do |combo| 
		@board[combo[0]] == @board[combo[1]] && 
		@board[combo[1]] == @board[combo[2]] && 
		position_taken?(combo[0])
	end
end

def full?
	@board.all? {|token| token == "X" || token == "O"}
end

def draw?
	if won?
		return false
	elsif full?
		return true
	end
end

def over?
	won? || full? || draw?
end

def winner
	if combo_winner = won?
		@board[combo_winner.first]
	end
end

def play
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