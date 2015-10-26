class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
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

  def display_board
  	puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, character = "X")
  	position = position.to_i - 1
	@board[position] = character
  end

  def position_taken?(position)
	!(@board[position] == " " || @board[position]  == "" || @board[position] == nil)
  end

  def valid_move?(position)
	input = position.to_i
	input.between?(1, 9) == true && position_taken?(position.to_i - 1) == false
end

def turn
	puts "Please enter 1-9:"
	position = gets.strip
	if valid_move?(position) == true
		move(position, character = current_player)
		display_board
	else
			turn		
	end
end

def turn_count
  @board.count{|piece| piece == "X"  || piece == "O"}
end

def current_player
  turn_count.even? ? 'X' : 'O'
end

def won?
  WIN_COMBINATIONS.each do | win_combination|
      position_1 = @board[win_combination[0]]
      position_2 = @board[win_combination[1]] 
      position_3 = @board[win_combination[2]]
        
    if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return win_combination
    end
  end
  return false
end

def full?
  @board.all?{|i| i == "X" || i == "O"}
end

def draw?
  !(won?) && full?
end

def over?
  won? || draw?
end

def winner
  if won?
    return @board[won?[0]]
  end
end

def play
  until over?
    turn 
  end

  if won?
    puts "Congratulations #{winner}!"
  else
    puts "Cats Game!" 
  end

end

end

