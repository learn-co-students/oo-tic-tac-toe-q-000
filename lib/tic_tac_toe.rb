class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9," ")
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

def display_board
  dashes = "-----------"
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts dashes
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts dashes
puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def move(spot, xoro = "X")
  spot = (spot.to_i) - 1
  @board[spot] = xoro
  return @board
end

def position_taken?(location)
  !(@board[location].nil? || @board[location] == " ")
end

def valid_move?(spot)
  spot = spot.to_i - 1
  if
    position_taken?(spot) == false && spot.between?(0,9) == true
    true
  elsif
    position_taken?(spot) == true
    false
  end
end

def turn
  puts "Please enter 1-9:"
  spot = gets.strip
  if valid_move?(spot) == true
    move(spot,current_player)
    display_board
  else turn
  end
end

def turn_count
  counter = 0
  spot = 0
  while spot < 9
    if @board[spot] == "X" || @board [spot] == "O"
      counter += 1
      spot += 1
    else counter = counter
      spot += 1
    end
  end
  return counter
end

def current_player
  if turn_count.even?
    return "X"
  else return "O"
  end
end

def won?
  WIN_COMBINATIONS.each do |combo|
    if
      (@board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]) && (@board[combo[0]] == "X" || @board[combo[0]] == "O")
      return combo
    end
  end
  return false
end

def full?
  #wasn't getting .any to work, come back to this?
  @board.each do |spot|
    if spot == " "
      return false
    end
  end
    return true
end

def draw?
  if won? == false && full? == true
    return true
  elsif won? == false && full? == false
    return false
  elsif won? == true
    return false
  end
end

def over?
  if won? == true || full? == true || draw? == true
    return true
  else
    return false
  end
end

def winner
  #is this too hard coded?
  if won? == false
    return nil
  else
  winning_player = won?
  return @board[winning_player[0]]
  end
end

#should definitely be able to remove the reduncy below
def play
    if won? != false
      puts "Congratulations #{winner}!"
    elsif draw? == true
      puts "Cats Game!"
    end
  while over? != true
    if won? != false
      puts "Congratulations #{winner}!"
    break
    elsif draw? == true
      puts "Cats Game!"
    break
    end
  turn
  end
end

end
