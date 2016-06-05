


class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  def board= (board)
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  def board (board)
    board
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
  puts " #{@board[0]} ""|"" #{@board[1]} ""|"" #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} ""|"" #{@board[4]} ""|"" #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} ""|"" #{@board[7]} ""|"" #{@board[8]} "
end
def move(position, current_player = "X")
  array_index = position.to_i - 1
  @board[array_index] = current_player
end
def position_taken?(position)
  array_index = position.to_i - 1
  @board[array_index] != " " && @board[array_index] != ""
end
def valid_move?(position)
  position.between?("1","9") && !position_taken?(position)
end
def turn
  puts "Please enter 1-9:"
  position = gets.strip
  if  valid_move?(position)
      move(position, current_player)
      display_board
  else
    turn
  end
end
def turn_count
    counter = 0
    @board.each do |bp| if bp != " " 
      counter = counter + 1
      end
    end
    return counter
end
def current_player
  if turn_count.even?
    return "X"
  else
    return "O"
  end
end
#game_status_spec.rb
def won?
    WIN_COMBINATIONS.detect do |win_combination| 
        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]
        position_1 = @board[win_index_1]
        position_2 = @board[win_index_2]
        position_3 = @board[win_index_3]
        position = [position_1, position_2, position_3]
        position.all? {|p| p == "X"} || position.all? {|p| p == "O"} end
end
def full?
  @board.all? {|p| p != " "}
end
def draw?
  full? == true && won? == nil
end
def over?
  won? || draw?
end
def winner
  if won? != nil
     index = won?[0]
     @board[index]
  end
end
#game_st_over
def play
  until over?
    turn
  end
  if draw?
      puts "Cats Game!"
  else 
      puts "Congratulations #{winner}!"
  end
end

end




