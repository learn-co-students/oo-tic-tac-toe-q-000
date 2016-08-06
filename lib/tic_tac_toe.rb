class TicTacToe
  WIN_COMBINATIONS=[
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def initialize(board = nil)
    @board = Array.new(9, " ")
          end
  def input_to_index(user_input)
    return user_input.to_i-1
  end

      def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts  "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts  "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
      end

      def move(index,value = "X")
        index = input_to_index(index)
          @board[index] = value
         display_board
end

def position_taken?(index)
  if(@board[index] == "X" || @board[index] == "O")
    return true
  else
    return false
  end
end

def valid_move?(index)
  # index = input_to_index(index)
  if(index.between?(0,8) && !position_taken?(index))
  return true
else
  return false
end
end
def current_player
  count = 0
  cx = 0
  co = 0
  while count < 9
    if(@board[count] == "X")
      cx += 1
    elsif(@board[count] == "O")
      co += 1
    end
    count += 1
  end #end while
  if (cx > co)
     "O"
  else   "X"
  end
end # end of current_player

def turn
  puts "Please enter number 1- 9"
  user_input = gets.chomp
  #index = input_to_index(user_input)
  if(valid_move?(input_to_index(user_input))
    move(user_input,current_player)
    display_board
else
 turn
  end
end # end of turn

def  turn_count
  count = 0
  cp = 0
  while count < @board.length
    if(@board[count] == "X" || @board[count] == "O" )
      cp += 1
    end
    count += 1
    end
cp
end  #end of turn_count

def won?
count = 0
while count< WIN_COMBINATIONS.length
  winnerX = WIN_COMBINATIONS[count].all?{|el| @board[el] == "X" }
  winnerO = WIN_COMBINATIONS[count].all?{|el| @board[el] == "O" }
  if(winnerX || winnerO )
return WIN_COMBINATIONS[count]
else
 nil
end
count += 1
end
end #end of won

def full?
  @board.all?{|el| el == "X" || el == "O"}
end # end of full

def draw?
  !won? && full?
end # end of draw

def over?
  won? || full? || draw?
end   # end of over

def winner
  count = 0
  cX = 0
  cO = 0
  while count < @board.length
if( @board[count] == "X")
  cX += 1
elsif(@board[count] == "O")
  cO  += 1
end
count += 1
end
if(cX > cO)
  return "X"
elsif(cO > cX)
  return "O"
else
  nil
end
end # end of winner

def play
  while !over?
    turn
  end
  if (won?)
    puts "Congratulations #{winner}!"
  elsif(draw?)
    puts "Cats Game!"
    end

end # end of play

end # end of the class
