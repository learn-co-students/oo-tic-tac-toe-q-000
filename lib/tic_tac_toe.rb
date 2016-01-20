class TicTacToe
  
  def initialize(board = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
    @board = board
  end

  WIN_COMBINATIONS = [
  [0,1,2], #top horizontal
  [3,4,5], #middle horizontal
  [6,7,8], #bottom horizontal
  [0,3,6], #left vertical
  [1,4,7], #middle vertical
  [2,5,8], #right vertical
  [0,4,8], #diag top left->right
  [6,4,2]] #diag top right->left

  def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, value="X")
  @board[position.to_i - 1] = value
end

def position_taken?(position)
  if @board[position.to_i] == "" || @board[position.to_i] == " " || @board[position.to_i] == nil
    return false
  else
    return true
  end
end

def valid_move?(position)
  if position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
    true
  end
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  if valid_move?(input)
    move(input, current_player)
  else
    turn
  end
  display_board
end

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

def turn_count
  counter = 0
    @board.each do |move|
      if (move == "X" || move == "O")
        counter += 1
      end
    end
return counter
end

def current_player
  counter = 0
    @board.each do |move|
      if (move == "X" || move == "O")
        counter += 1
      end
    end

  if (counter % 2 == 0)
    return "X"
  elsif (counter % 2 != 0)
    return "O"
  end
end

def won?
  WIN_COMBINATIONS.each do |x|
    win_index_1 = x[0]
    win_index_2 = x[1]
    win_index_3 = x[2]
    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return x.to_a
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return x.to_a
  end
  end
  return nil
end

def full?
  !@board.any?{|x| x == " " || x == "" }
end

def draw?
  !won? && full?
end

def over?
  won? || full? || draw?
end

def winner
  combination = won?
    if combination
      @board[combination[0]]
    else
      return nil
    end
end

end