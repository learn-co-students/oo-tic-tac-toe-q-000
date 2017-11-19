class TicTacToe
  def initialize(board=nil)
    @board=board || Array.new(9," ")
  end

WIN_COMBINATIONS=[[0,1,2],[3,4,5],[6,7,8],[0,4,8],[6,4,2],[0,3,6],[2,5,8],[1,4,7]]

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position,current_player="X")
  @board[position.to_i-1]=current_player
end

  def position_taken?(position)
  if @board[position.to_i] == " "
    false
    else @board[position.to_i] == "X" || "O"
    true
  end
end

  def valid_move?(position)
 if position.to_i.between?(1,9)  && !position_taken?(position.to_i-1)
   true
 end
end

  def turn
  puts "Please enter 1-9:"
  position=gets.strip
  if valid_move?(position)
    move(position,current_player)
    else !valid_move?(position)
    turn
  end
  display_board
end

def won?



  top_row_win = [0,1,2]
  middle_row_win = [3,4,5]
  bottom_row_win = [6,7,8]
  left_diagonal_win =[0,4,8]
  right_diagonal_win =[2,4,6]
  left_column_win = [0,3,6]
  right_column_win = [2,5,8]
  middle_column_win = [1,4,7]

  if @board[top_row_win[0]] == "X" && @board[top_row_win[1]] == "X" && @board[top_row_win[2]] == "X" || @board[top_row_win[0]] == "O" && @board[top_row_win[1]] == "O" && @board[top_row_win[2]] == "O"
    return WIN_COMBINATIONS[0]
    elsif @board[middle_row_win[0]] == "X" && @board[middle_row_win[1]] == "X" && @board[middle_row_win[2]] == "X" || @board[middle_row_win[0]] == "O" && @board[middle_row_win[1]] == "O" && @board[middle_row_win[2]] == "O"
    return WIN_COMBINATIONS[1]
    elsif @board[bottom_row_win[0]] == "X" && @board[bottom_row_win[1]] == "X" && @board[bottom_row_win[2]] == "X" || @board[bottom_row_win[0]] == "O" && @board[bottom_row_win[1]] == "O" && @board[bottom_row_win[2]] == "O"
    return WIN_COMBINATIONS[2]
    elsif @board[left_diagonal_win[0]] == "X" && @board[left_diagonal_win[1]] == "X" && @board[left_diagonal_win[2]] == "X" || @board[left_diagonal_win[0]] == "O" && @board[left_diagonal_win[1]] == "O" && @board[left_diagonal_win[2]] == "O"
    return WIN_COMBINATIONS[3]
    elsif @board[right_diagonal_win[0]] == "X" && @board[right_diagonal_win[1]] == "X" && @board[right_diagonal_win[2]] == "X" || @board[right_diagonal_win[0]] == "O" && @board[right_diagonal_win[1]] == "O" && @board[right_diagonal_win[2]] == "O"
    return WIN_COMBINATIONS[4]
    elsif @board[left_column_win[0]] == "X" && @board[left_column_win[1]] == "X" && @board[left_column_win[2]] == "X" || @board[left_column_win[0]] == "O" && @board[left_column_win[1]] == "O" && @board[left_column_win[2]] == "O"
    return WIN_COMBINATIONS[5]
    elsif @board[right_column_win[0]] == "X" && @board[right_column_win[1]] == "X" && @board[right_column_win[2]] == "X" || @board[right_column_win[0]] == "O" && @board[right_column_win[1]] == "O" && @board[right_column_win[2]] == "O"
    return WIN_COMBINATIONS[6]
    elsif @board[middle_column_win[0]] == "X" && @board[middle_column_win[1]] == "X" && @board[middle_column_win[2]] == "X" || @board[middle_column_win[0]] == "O" && @board[middle_column_win[1]] == "O" && @board[middle_column_win[2]] == "O"
    return WIN_COMBINATIONS[7]
  end
end

  def full?
  @board.all? {|string| string == "X" || string == "O"}
end

  def draw?
  if full? && !won?
    true
  end
end

  def over?
  if draw? || won?
    true
  end
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
     if won? && winner == "X"
    puts "Congratulations X!"
    elsif won? && winner == "O"
    puts "Congratulations O!"
    else draw?
    puts "Cats Game!"
     end
  end

  end

