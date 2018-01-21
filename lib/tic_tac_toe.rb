class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
  [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]
  ]

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def move(input, player = "X")
  @board[input.to_i - 1] = player
end

def position_taken?(location)
  !(@board[location].nil? || @board[location] == " ")
end

def valid_move?(position)
  if position_taken?(position.to_i - 1) == false && (position.to_i - 1).between?(0, 8)  
  true
  else 
  false
  end
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  if valid_move?(input) == true 
    move(input, "#{current_player}")
    display_board
  else
    turn
  end
end

def won?
  WIN_COMBINATIONS.each do |win_combination|
    position_1 = @board[win_combination[0]]
    position_2 = @board[win_combination[1]]
    position_3 = @board[win_combination[2]]
  
    if position_1 != "" && position_1 != " " && position_1 == position_2 && position_2 == position_3
       return win_combination
      
    end
  end 
  return false
end

def full?
  @board.all? do |space|
    space == "X" || space == "O"
  end
end

def draw?
  full? && !won?
end

def over?
  won? || full? || draw?
end

def winner
  array_spaces = won?
  if array_spaces 
    winning_team = @board[array_spaces[0]]
  end
end

def turn_count
  counter = 0
  @board.each do |spot|
    if spot != " " && spot != ""
      counter += 1
    end
  end
  return counter
end

def current_player
  if turn_count % 2 == 0
    return "X"
  elsif turn_count % 2 == 1
    return "O"
  end
end

def play
  until over?
    turn
  end
  thewinner = winner
  if won?
    puts "Congratulations #{thewinner}!"
  elsif draw?
    puts "Cats Game!"
  end  
end

end