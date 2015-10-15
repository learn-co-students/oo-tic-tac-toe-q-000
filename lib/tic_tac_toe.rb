class TicTacToe
  def initialize(board=[" ", " ", " ", " ", " ", " ", " ", " ", " "])
    @board = board
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

def move(location, current_player = "X")
  @board[location.to_i-1] = current_player
end

def position_taken?(location)
  @board[location] != " " && @board[location] != ""
end

def valid_move?(position)
  position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
end

def turn_count
  count = 0
  @board.each do |x|
   if x != " "
     count += 1
   end
  end
  return count
end

def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  if valid_move?(input)
    move(input,current_player)
  else
    turn
  end
  display_board
end

def won?
  WIN_COMBINATIONS.each do |wincombo|
    winningcombo = [@board[wincombo[0]],@board[wincombo[1]],@board[wincombo[2]]]
    xcombo = winningcombo.all? {|position| position == "X"}
    ocombo = winningcombo.all? {|position| position == "O"}
    return wincombo if xcombo || ocombo
  end #each_end
  false
end #method_end

def full?
  if @board.any? {|x| x == " "}
    return false
  else
    return true
  end
end

def draw?
  if won? || !full?
    false
  else
    true
  end
end

def over?
  if draw?|| won?
    true
  else
    false
  end
end

def winner
  wincombo = won?
  if wincombo
    return @board[wincombo[0]]
  end
end

def play
  while over? != true
    turn
  end

  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cats Game!"
  end
end #end_play

end #end_class