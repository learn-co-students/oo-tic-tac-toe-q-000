class TicTacToe

  def initialize
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
   [0,1,2],   [3,4,5],   [6,7,8],   [0,3,6],
   [1,4,7],   [2,5,8],   [0,4,8],   [6,4,2]
  ]


  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    puts "-----------"
  end




  def move(position, token="X")
    position-=1
    @board[position] = token
  end




  def position_taken?(position)
 position-=1
  if(@board[position]=="X" || @board[position]=="O")
    return true
  elsif(@board[position]==" ")
    return false
  end
end




  def valid_move?(position)

  position=position.to_i
  if (position.between?(1,9) && !position_taken?(position))
    return true
  else
    return false
  end
end




  def turn
  puts "Player #{current_player} enter 1-9:"
  position=gets.strip.to_i
  while !(valid_move?(position))
    puts "Enter a valid move"
    position=gets.strip.to_i
  end
    move(position,current_player)
    display_board
end






  def current_player
  if turn_count.odd?
    return "O"
    else
    return "X"
  end
end




  def turn_count
  i=0
  count=0
  while @board.length>i
    if @board[i]=="X"
      count+=1
      elsif @board[i]=="O"
      count+=1
    end
    i+=1
  end
  return count
end


  def won?
  WIN_COMBINATIONS.detect do |array|
    array.all?{|i| @board[i]=="X"} || array.all?{|i| @board[i]=="O"}
  end
end

def full?
  @board.all? {|i| i!=" "}
end

def draw?
  if (!won? && full?)
    return true
  elsif (!won? && !full?)
    return false
  elsif won?
    return false
  end
end


def over?
 (won?) || (draw?) || (full?)

end

def winner
   if (won?)
     return @board[won?[0]]
   else
     return nil
   end
end

 def play()
    while !over?() 
      turn()
    end
    if draw?()
      puts "Cats Game!"
    else
      puts "Congratulations #{winner()}!"
    end
  end



end
