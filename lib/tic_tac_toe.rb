class TicTacToe

	attr_accessor :board

	def initialize
		@board = Array.new(9, " ")
	end

	WIN_COMBINATIONS = [
		[0,1,2],
		[3,4,5],
		[6,7,8],
		[0,3,6],
		[1,4,7],
		[2,5,8],
		[0,4,8],
		[2,4,6]
	]

	def display_board
	  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
	  puts "-----------"
	  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
	  puts "-----------"
	  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
	end

	def input_to_index(input)
		input.to_i - 1
	end

	def move(index, current_player)
  	@board[index] = current_player
	end

	def position_taken?(index)
    @board[index] != " " && @board[index] != ""
	end

	def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
	end

	def turn_count
	  @board.count {|e| e == "X" || e == "O"}
  end

  def current_player
	  turn_count.even? ? "X" : "O"
	end

	def turn
	  puts "Please enter 1-9:"
	  input = gets.strip
    index = input_to_index(input)
			if valid_move?(index)
		  move(index, current_player)
		  display_board
			else
	  	  turn
			end
  end

  def won?
	  won_combo = nil

	  WIN_COMBINATIONS.each do |combo|
	    position_1 = combo[0]
	    position_2 = combo[1]
	    position_3 = combo[2]

	    if @board[position_1] == "X" && @board[position_2] == "X" && @board[position_3] == "X"
	      won_combo = combo
	    elsif @board[position_1] == "O" && @board[position_2] == "O" && @board[position_3] == "O"
	      won_combo = combo
	    end
	  end
	  won_combo
  end

  def full?
	  @board.all? {|e| e == "X" || e == "O"}
	end

	def draw?
	  full? && !won?
	end

	def over?
	  won? || draw? || full?
	end

	def winner
	  won? ? @board[won?[0]]  : nil
	end

	def play
	  until over?
	    turn
	  end
	    if won?
	      puts "Congratulations #{winner}!"
	    elsif draw?
	      puts "Cat's Game!"
	    end
	end

end
