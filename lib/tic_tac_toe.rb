class TicTacToe
  def initialize (board=[" "," "," "," "," "," "," "," "," "])
    @board=board
  end

  def board
    @board
  end

  WIN_COMBINATIONS=[
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]]

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def move(location,a)
  a=current_player
  location=(location.to_i)-1
  @board[location]=a
 display_board
end

def position_taken?(position)
  if @board[position]==" "||@board[position]==""||@board[position]==nil
    return false
  elsif @board[position]=="X"||@board[position]=="O"
    return true
  end
end

def valid_move?(position)
  position= position.to_i-1
  if position.between?(0,8)&& !(position_taken?(position))
    return true
  else
    return false
  end
end

def turn
  puts "Please enter 1-9:"
  location=gets.strip
  if valid_move?(location)
    move(location,a="X")
  else
    turn
  end
end

def turn_count
  count=0
  @board.each do |counts|
    if counts=="X"||counts=="O"
      count+=1
    end
  end
    return count
end

def current_player
  if turn_count%2==0
  return "X"
else
  return "O"
end
end

def won?
  if @board[0]=="X"&&@board[1]=="X"&&@board[2]=="X"
    return WIN_COMBINATIONS[0]
  elsif @board[0]=="O"&&@board[1]=="O"&&@board[2]=="O"
    return WIN_COMBINATIONS[0]
  end
    if @board[3]=="X"&&@board[4]=="X"&&@board[5]=="X"
    return WIN_COMBINATIONS[1]
  elsif @board[3]=="O"&&@board[4]=="O"&&@board[5]=="O"
    return WIN_COMBINATIONS[1]
  end
  if @board[6]=="X"&&@board[7]=="X"&&@board[8]=="X"
    return WIN_COMBINATIONS[2]
  elsif @board[6]=="O"&&@board[7]=="O"&&@board[8]=="O"
    return WIN_COMBINATIONS[2]
  end
    if @board[0]=="X"&&@board[3]=="X"&&@board[6]=="X"
    return WIN_COMBINATIONS[3]
  elsif @board[0]=="O"&&@board[3]=="O"&&@board[6]=="O"
    return WIN_COMBINATIONS[3]
  end
    if @board[1]=="X"&&@board[4]=="X"&&@board[7]=="X"
    return WIN_COMBINATIONS[4]
  elsif @board[1]=="O"&&@board[4]=="O"&&@board[7]=="O"
    return WIN_COMBINATIONS[4]
  end
  if @board[2]=="X"&&@board[5]=="X"&&@board[8]=="X"
    return WIN_COMBINATIONS[5]
  elsif @board[2]=="O"&&@board[5]=="O"&&@board[8]=="O"
    return WIN_COMBINATIONS[5]
  end
    if @board[0]=="X"&&@board[4]=="X"&&@board[8]=="X"
    return WIN_COMBINATIONS[6]
  elsif @board[0]=="O"&&@board[4]=="O"&&@board[8]=="O"
    return WIN_COMBINATIONS[6]
  end
  if @board[2]=="X"&&@board[4]=="X"&&@board[6]=="X"
    return WIN_COMBINATIONS[7]
  elsif @board[2]=="O"&&@board[4]=="O"&&@board[6]=="O"
    return WIN_COMBINATIONS[7]
  end
  return false
end

def full?
  @board.all? do |i|
    i=="X"||i=="O"
  end
end

def over?
  if won?||draw?||full?
    return true
  end
end

def winner
  if !(won?)
    return nil
  end
  a=won?
  if board[a[0]]=="X"
    puts "Congratulations X!"
    return "X"
  else
    puts "Congratulations O!"
    return "O"
  end
end

def draw?
  if won?
    return false
  elsif !(full?)
    return false
  end
  puts "Cats Game!"
  return true
end

def play

  if over?
     winner
    else turn
    end
  if over?
      winner
    else play
  end
end

end