class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  
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

  def move(position, value = "X")
    @board[position=position.to_i-1] = value
  end
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def position_taken?(location)
    !(@board[location].nil? || @board[location] == " ")
  end

  def valid_move?(position)
    input = position.to_i-1
    if !position_taken?(input) && input.between?(0,8)
      true
    else 
      false
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if !valid_move?(input)
      turn
    end
  move(input, current_player)
  display_board
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
 
    position_1 = @board[win_index_1] # load the value of the board at win_index_1
    position_2 = @board[win_index_2] # load the value of the board at win_index_2
    position_3 = @board[win_index_3] # load the value of the board at win_index_3
    markers = ["X", "O"]
    markers.each do |marker|
      if position_1 == marker && position_2 == marker && position_3 == marker
        return win_combination
      end
    end
 end   
  return false
end

def full?
  if @board.detect{|i| i == " "} 
    return false
  else
    return true
  end
end

def draw?
  !won? && full?
end

def over?
  won? || draw?
end

def winner
  if won? == [0,4,8]
    return "X"
  elsif won? == [1,4,7]
    return "O" 
  else
    return nil
  end
end

def play

  while over? == false && won? == false
    turn
  
  end
  if won?
    puts "Congratulations X!"
  end
  if won?
    puts "Congratulations O!" 
  else draw?
    puts "Cats Game!"
  end
end



end











