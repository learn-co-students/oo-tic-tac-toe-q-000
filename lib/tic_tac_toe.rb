class TicTacToe

def initialize(board=Array.new(9, " "))
	@board = board
end

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def move(location, current_player = "X")
  @board[location.to_i-1] = current_player
end

def position_taken?(location)
  !(@board[location].nil? || @board[location] == " ")
end

def valid_move?(position)
  position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  who = current_player
  until valid_move?(input)
    puts "invalid"
    input = gets.strip
	end
  move(input, who)
	display_board
end

def turn_count
	occupied = 0
	@board.each do | square |
		if square == "X" || square == "O"
			occupied += 1
		end
	end
	# puts "#{occupied}"
	occupied
end

def current_player
	turn_count.odd? ?	"O"	: "X"
end

def won?
	WIN_COMBINATIONS.each do |combi|
		if position_taken?(combi[0]) && @board[combi[0]] == @board[combi[1]] && @board[combi[1]] == @board[combi[2]]
		return combi
		# return true
		end
	end
	false
end

def won_bg?
	WIN_COMBINATIONS.each do |combi|
		if position_taken?(combi[0]) && @board[combi[0]] == @board[combi[1]] && @board[combi[1]] == @board[combi[2]]
		# return combi
		return true
		end
	end
	false
end


def won_combi
	WIN_COMBINATIONS.each do |combi|
		if position_taken?(combi[0]) && @board[combi[0]] == @board[combi[1]] && @board[combi[1]] == @board[combi[2]]
		return combi
		end
	end
	nil
end

def full?
 	[0,1,2,3,4,5,6,7,8].all? { |i| position_taken?(i)  }
end

def draw?
	#puts "in draw?"
	!won? && full?
end

def over?
	won? || full?
end

def winner
	# if combi
	if won?
		combi = won_combi
		return @board[combi[0]]
	end
	nil
end

def play
 #input = gets.strip
 while true
 # while over? != true
 	turn
 	if won?
 		puts "Congratulations #{winner}!"
 	end
 	if draw?
		puts "Cats Game!"
 	end
 	if over?
 		return nil
 	end
  end
 end
end
