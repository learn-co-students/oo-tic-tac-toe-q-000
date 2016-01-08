class TicTacToe
 
  def initialize
    @board = Array.new(9," ")
    
  end

  def display_board
    puts " #{@board[0]} " + "|" +  " #{@board[1]} " + "|" +  " #{@board[2]} "

    puts "-----------"

    puts " #{@board[3]} " + "|" +  " #{@board[4]} " + "|" +  " #{@board[5]} "

    puts "-----------"

    puts " #{@board[6]} " + "|" +  " #{@board[7]} " + "|" +  " #{@board[8]} "
end

 WIN_COMBINATIONS =[
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [6,4,2],
   ]

  def move(input, player="X")
    input=input.to_i
    input=input-1
    @board[input]=player
  end

  def position_taken?(location)
   !(@board[location].nil? || @board[location] == " ")

  end

  def valid_move?(position)
    position = position.to_i-1
    if  position.between?(0,8) && position_taken?(position)==false
      true
    else
      false
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

def current_player
  if turn_count % 2 == 0
    return "X"
  else
    return "O"
  end
end

def turn_count
  count=0
  @board.each do |space|
    if space =="X" || space=="O"
      count+=1
    end
  end
  count
end

def won?
    WIN_COMBINATIONS.each do |arr|
        if @board[arr[0]] == "X" && @board[arr[1]] == "X" && @board[arr[2]] == "X" ||
            @board[arr[0]] == "O" && @board[arr[1]] == "O" && @board[arr[2]] == "O"
            return arr # return the win_combination indexes that won.
        end
    end
  false
end

def full?
   @board.all? do |space|
    space!=" "
   end
end

def draw?
  if  full? &&  !won?
    true
  end
end

def over?
  if won?|| draw?
    return true
  else
    return false
  end
end

def winner
  arr = won?
  if arr!=false
    return @board[arr[0]]
  end
end

def play
  until over? do
    turn
    draw?
    winner
  end
  
  if won?
    w = winner
    puts "Congratulations #{w}!"
  else
    puts "Cats Game!"
  end
end














end