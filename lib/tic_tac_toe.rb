class TicTacToe

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2],
  ]

def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def move(input,char)
  input = input.to_i
  @board[(input-1)] = char

end

def position_taken? (position)
  if @board[position] == " " || @board[position] == "" || @board[position] == nil
    return false
  else
    return true
  end
end

def valid_move?(position)
  position = (position.to_i) - 1
  if position_taken?(position)  == false && position.between?(0,8)
    return true
  else
    return false
  end
end

def turn
  puts "Please enter 1-9:"
  position = gets.strip
  until valid_move?(position)
    puts "Please enter 1-9:"
    position = gets.strip
  end
    char = current_player
    move(position,char)
    display_board
end

def turn_count
    @board.count{|position| position == "X" || position == "O"}
end

def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

def won?
  indexes = Array.new
  if WIN_COMBINATIONS.any? do |combination|
    indexes = combination
    (@board[combination[0]] == "X" && @board[combination[1]] == "X" && @board[combination[2]] == "X") || (@board[combination[0]] == "O" && @board[combination[1]] == "O" && @board[combination[2]] == "O")
  end
  return indexes
else
  return false
end
end

def full?
  @board.all? {|position| position == "X" || position == "O"}
end

def draw?
  if full? == true && won? == false
    return true
  elsif
    full? == false && won? == false
    return false
  else
    false
  end
end

def over?
   if won? != false || draw? == true || full? == true
    return true
   else
    return false
   end
end

def winner
  if won? == false
      return nil
    end
  won?.each do |position|
    if @board[position] == "X"
      return "X"
    else @board[position] == "O"
      return "O"
    end
  end
end

def play
until over?
    turn
end
   if won?
     puts "Congratulations #{winner}!"
   elsif draw?
    puts "Cats Game!"
    end

 end

end
