class TicTacToe
#once initialize is given an argument (i.e. "board"), you need to give it a default argument that it can fall back to just in case, otherwise it will generate an error wrong # of arguments(0 for 1)

#initialize board upon instance of TicTacToe object
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

#win_combinations constant
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

#display_board
def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "

end

#move
def move(position, current_player="X")
  @board[position.to_i - 1] = current_player
end

#position_taken?
def position_taken?(position)
  (@board[position] == "X" || @board[position] == "O") ? true : false
end

#valid_move?
def valid_move?(position)
  position = position.to_i - 1
  position.between?(0,10) && !position_taken?(position) ? true : false

end

#turn
def turn
  puts "Please enter 1-9:"
  position = gets.strip
  if valid_move?(position)
    move(position, current_player)
   else
    puts "That spot does not exist. Try again, b!"
    turn
  end
  display_board
end

#turn_count
def turn_count
  @board.count {|token| token == "X" || token == "O"}
end

#current_player
def current_player
  turn_count.even? ? "X" : "O"
end

#won?
def won?
  WIN_COMBINATIONS.any? do |win_combo|
          if (@board[win_combo[0]] == "X" || @board[win_combo[0]] == "O") && @board[win_combo[0]]== @board[win_combo[1]] && @board[win_combo[1]]==@board[win_combo[2]]
          return win_combo
        end
  end
  false
end

#full?
def full?
  !@board.any?{|position| position == " "}
end

#draw?
def draw?
  !won? && full?
end

#over?
def over?
won? || draw?
end

#winner
def winner
  if win_combo = won?
    @board[win_combo.first]
  end
end

#play
def play
  until over?
    turn
    end
 if won?
  puts "Congratulations #{winner}!"
 else draw?
  puts "Cats Game!"
  end 
end

end




