class TicTacToe
def initialize
  @board = Array.new(9, " ")
end


  WIN_COMBINATIONS =
    [
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
   puts " #{@board[0]} " '|' " #{@board[1]} " '|' " #{@board[2]} "
   puts '-----------'
   puts " #{@board[3]} " '|' " #{@board[4]} " '|' " #{@board[5]} "
   puts '-----------'
   puts " #{@board[6]} " '|' " #{@board[7]} " '|' " #{@board[8]} "
 end

 def move(index, current_player = "X")
   index = index - 1
   @board[index] = current_player
 end

 def position_taken?(location)
  # location = location - 1
   @board[location] != " " && @board[location] != ""
 end
 def valid_move?(index)
   index = index.to_i
   index = index - 1
   index.between?(0,8) && !position_taken?(index)
 end
 def turn
   puts "Please enter 1-9:"
   index = gets.strip
   index = index.to_i
   if valid_move?(index)
     move(index, current_player)
     display_board
   else
     turn
 end
end
def turn_count
@board.count{ |token| token == "X" || token == "O"}
end
def current_player
  turn_count % 2 == 0 ? "X" : "O"
end
def won?
  WIN_COMBINATIONS.each do |win|
    win_index_1 = win[0]
    win_index_2 = win[1]
    win_index_3 = win[2]

    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]
     if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 ==  "O" && position_3 == "O")
       return win
     end
   end
   false
 end



 def full?
   @board.each do |ind|
     if ind ==  " " || ind == nil
       return false
     end
   end
   true
 end
 def draw?
   if (!won?) && (full?)
     return true
   end
 end
 def over?
   if won?|| full? || draw?
     return true
   end
 end
 def winner
   if won?
      @board[won?.first]
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
