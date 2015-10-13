class TicTacToe

def initialize(board = nil)
    @board = board || Array.new(9, " ")
end

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2],
]
   # Middle row
    # ETC, an array for each win combination]

def display_board

        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts " ----------- "
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts " ----------- "
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "

  end

def move(place, current_player)
  place = place.to_i
  @board[place - 1] = current_player
  return @board
end

def turn
  puts "Please enter 1-9:"
  position=gets
  if valid_move?(position)==true
    move(position, current_player)
  elsif valid_move?(position)==false
    turn
  end
  display_board
end

def turn_count
  counter=0
  @board.each do |element|
    if element=="X" || element=="O"
    counter+=1
    end
  end
return counter
end

def current_player
  if turn_count%2==0
    "X"
  else
    "O"
  end 
end

def valid_move?(int)
  int = int.to_i-1
  if int.between?(0,8) && position_taken?(int)==false
    return true
  elsif int.between?(0,8)== false || position_taken?(int)==true
    return false
  end
end

# re-define your #position_taken? method here, so that you can use it in the #valid_move? method above.


def position_taken?(int)
  if (@board[int]==" ") || (@board[int]=="")
    return false
  elsif (@board[int]=="X") || (@board[int]=="O")
    return true
  elsif (@board[int]==nil)
    return false
  end
end

def won?
  WIN_COMBINATIONS.each do |combo|
    return combo if combo.all? {|position| @board[position] == 'X'}
    return combo if combo.all? {|position| @board[position] == 'O'}
  end
  return false if @board.all? { |position| position != " "}
  return false if @board.all? { |position| position == " "}
end

def full?
  @board.all? {|element| element == "X" || element == "O" }
end


def draw?
  !won? && full?
end

def over?
  won? || draw?
end

def winner
    WIN_COMBINATIONS.each do |combo|
    return "X" if combo.all? {|position| @board[position] == 'X'}
    return "O" if combo.all? {|position| @board[position] == 'O'}
  end
  return nil
end

def play

  until over?
    turn
  end


    if won?
    puts "Congratulations #{winner}!"
    
    elsif draw?
      puts  "Cats Game!"
  end

end


end


 

 
 




