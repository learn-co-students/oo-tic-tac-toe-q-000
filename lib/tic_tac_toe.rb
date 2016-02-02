class TicTacToe    

  def initialize(board = Array.new(9, " "))
    @board = board 
  end

  def display_board
    puts [" #{@board[0]} | #{@board[1]} | #{@board[2]} ",
    "-----------",
    " #{@board[3]} | #{@board[4]} | #{@board[5]} ",
    "-----------",
    " #{@board[6]} | #{@board[7]} | #{@board[8]} "]
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
  @board[position] != " " && @board[position] != "" && @board[position] != nil
 end

 def valid_move?(position)
  position.to_i - 1 >= 0 && position.to_i - 1 <= 8 && position_taken?(position.to_i - 1) == false
  end

def turn
  puts "Please input 1-9:"
  position = gets.strip
  if valid_move?(position) == true
    move(position, current_player)
  else
    until valid_move?(position) == true
      puts "Please input 1-9:"
      position = gets.strip 
    end
      move(position, current_player)
  end
  display_board
end

def turn_count
  @board.count {|token| token == "X" || token == "O"} 
end

def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

def won?
  won = false
  WIN_COMBINATIONS.each {|win_combination|
  all_X = win_combination.all? {|win_index| @board[win_index] == "X"}
    all_O = win_combination.all? {|win_index| @board[win_index] == "O"}
    if all_X == true || all_O == true
   return win_combination
    end}
    return won
  end

  def full?
  @board.include?(" ") != true
  end

  def draw?
  full? == true && won? == false
  end

  def over?
    won? != false || full? == true || draw? == true
  end

  def winner
  if won? != false
    return @board[won?[1]]
  end
  end

  def play
  until over? == true 
    turn
    end
    if won? != false && winner == "X"
      puts "Congratulations X!"
    elsif won? != false && winner == "O"
      puts "Congratulations O!"
    elsif draw? == true
      puts "Cats Game!"
    end
  end

end
