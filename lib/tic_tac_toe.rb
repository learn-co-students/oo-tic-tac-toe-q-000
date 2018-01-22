class TicTacToe
  
  def initialize
    @board = Array.new(9," ")
  end

  WIN_COMBINATIONS = [
[0,1,2], #Top Row Win
[3,4,5], #Middle Row Win
[6,7,8], #Bottom Row Win
[0,3,6], #Left Column Win
[1,4,7], #Center Column Win
[2,5,8], #Right Column Win
[0,4,8], #Top to Bottom Diagnol Win
#[2,4,6],
[6,4,2] #Bottom to Top Diagnol Win
]

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def move(location,char = "X")
  i = location.to_i - 1
  @board[i] = char
end

def position_taken?(location)
  !(@board[location].nil? || @board[location] == " ")
end

def valid_move?(position)
 location = position.to_i - 1
  if position_taken?(location) == true
    false
  elsif location.between?(0,9) == false
    false
  else position_taken?(location) == false && location.between?(0,9) == true
    true
  end
end

def turn
  puts "Please enter 1-9:"
  position = gets.strip
  if valid_move?(position)
    move(position,current_player)
    display_board
  else 
    turn
  end
end

def current_player
  if turn_count.even?
    "X"
  else 
    "O"
  end
end

def turn_count
  counter = 0
  @board.each do |position|
    if position != " "
      counter += 1
    else
    end
  end
  counter
end

def won?

  WIN_COMBINATIONS.each do |a|
    if a.all? {|i| @board[i] == "X"} || a.all?{|i| @board[i] == "O"} 
     return a
    end
  end
  return false
end

def full?
  @board.none?{|i| i == " " }
end

def draw?
  if full? == true && won? == false
    return true
  else
    return false
  end
end


#Define #over? method here:
def over?
  if draw? == true || won? != false
    return true
  end
end

#Define #winner method here:
def winner
  if won? == false
    return nil
  end

  a = won?

  if @board[a[0]] == "X"
    return "X"
  else 
    return "O"
  end
end

def play
  until over? == true
    turn  
  end
  if draw? == true
      puts "Cats Game!"
    else
      puts "Congratulations #{winner}!"
    end
end


end