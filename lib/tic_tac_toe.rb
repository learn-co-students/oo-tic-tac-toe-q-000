class TicTacToe
	def initialize(board = nil)
		@board = board || Array.new(9, " ")
	end

	 def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

 WIN_COMBINATIONS = [
	[0, 1, 2],
	[3, 4, 5],
	[6, 7, 8],
	[0, 3, 6],
	[1, 4, 7],
	[2, 5, 8],
	[0, 4, 8],
	[6, 4, 2]
	]

	def move(position, current_player = "X")
		@board[position.to_i - 1] = current_player
	end

	def position_taken?(position)
		if @board[position] == " " || @board[position] == "" || @board[position] == nil
			false
		elsif @board[position] == "X" || "O"
			true
		end
	end

	def valid_move?(position)
		position = position.to_i
		if position.between?(1,9) && !position_taken?(position.to_i - 1)
			true
		else
			false
		end
	end

	def turn
		loop do
			puts "Please enter 1-9:"
			position = gets.chomp
				if valid_move?(position)
					move(position, current_player)
					break
				end
		end
		display_board
	end

	def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
	WIN_COMBINATIONS.detect do |win_combo|
		win_combo.all? { |position| @board[position] == "X" } || win_combo.all? { |position| @board[position] == "O" }
		end
	end


	def full?
		unless @board.any? {|pos| pos == " " || nil}
			@board.all? == "X" || "O"
		end
	end

	def draw?
		if full? && !won?
			true
		else
			false
		end
	end

	def over?
		if won? || draw? || full?
			true
		else
			false
		end
	end

	def winner
		winning_player = won?

		if !winning_player
			return nil
		end

	winning_player.each do |i| 
			if @board[i] == "X"
				return "X"
			elsif @board[i] == "O"
				return "O"
			end
		end
	end

	def play
	  until over?
	    turn
	  end
	  if won?
	  	puts "Congratulations #{winner}!"
	  elsif draw?
	  	puts "Cats Game!"
	  end
  end


end