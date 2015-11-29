class TicTacToe
	attr_accessor :board
  
  WIN_COMBINATIONS = [
  	[0,1,2], [3,4,5], [6,7,8],
  	[0,3,6], [1,4,7], [2,5,8],
  	[0,4,8], [6,4,2]
	]

  def initialize
    @board = Array.new(9, " ")
  end

  def display_board
  	puts " #{board[0]} | #{board[1]} | #{board[2]} "
  	puts "-----------"
  	puts " #{board[3]} | #{board[4]} | #{board[5]} "
  	puts "-----------"
  	puts " #{board[6]} | #{board[7]} | #{board[8]} "
	end

	def move(location, current_player = "X")
  	board[location.to_i-1] = current_player
	end

	def position_taken?(location)
  	!(board[location].nil? || board[location] == " ")
	end

	def valid_move?(position)
  	position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
	end

	def current_player
  	turn_count.even? ? "X" : "O" 
	end

	def turn
	  puts "Please enter 1-9:"
	  input = gets.strip
	  turn unless valid_move?(input)

	  move(input, current_player)

	  display_board
	end

	def turn_count
  	test = /^[xo]$/i
  	counter = 0
  	board.each { |cell| counter += 1 if cell =~ test }
  	counter 
	end

	def won?
  	WIN_COMBINATIONS.each do |c|
    	win_1, win_2, win_3 = c[0], c[1], c[2]
    	positions = board[win_1], board[win_2], board[win_3]
  
    	if (positions.all? { |p| p == "X" } || positions.all? { |p| p == "O" }) 
      	return win_1, win_2, win_3
    	end
  	end
  	return nil 
	end

	def full?
  	!board.any? { |e| e == " " } 
	end

	def draw?
  	!won? and full?
	end

	def over?
  	won? or full? or draw?
	end

	def winner
  	won_indices = won?
  	return board[won_indices[0]] if won_indices
  	return nil 
	end

	def play
  	turn until over?
  	winner ? (puts "Congratulations #{winner}!") : (puts "Cats Game!")
	end

end
