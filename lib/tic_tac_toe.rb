class TicTacToe
def initialize(board=nil)
  @board=board || Array.new(9," ")
end
WIN_COMBINATIONS = [
[0,1,2], #Top Row
[3,4,5], #Middle Row
[6,7,8], #Bottom Row
[0,3,6], #left vert
[1,4,7], #middle vert
[2,5,8], #Right Vert
[0,4,8], #TL to RB diag
[6,4,2] #TR to BL diag
]
FINAL_WIN = []
def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def move(position, player="X")
  @board[position.to_i - 1]=player
end

def position_taken?(position)
  @board[position] != (" " || nil)
end

def valid_move?(position) space=(position.to_i-1)
 !position_taken?(position.to_i-1) && (0..8).include?(position.to_i-1)
end

def turn
    puts "Pleas enter 1-9"
    input=gets.strip.to_i
    if !valid_move?(input)
     turn
    end
    move(input,current_player)
    display_board   
end

def turn_count
  @board.count{|turns| turns=="X" || turns=="O"}
end

def current_player
if turn_count % 2 == 0
  return "X"
else
  return "O"
  end
end

def won?
  WIN_COMBINATIONS.each do | combos |
    if @board[combos[0]] == "X" && @board[combos[1]] == "X" && @board[combos[2]] == "X"
      return combos
    elsif @board[combos[0]] == "O" && @board[combos[1]] == "O" && @board[combos[2]] == "O"
      return combos
    end
  end
  false
end



    
def full?
  @board.all?{|spots| spots =="X" || spots == "O"}
  end


def draw?
   !won? && full?
end

def over?
   won? || draw?
end


def winner
  WIN_COMBINATIONS.each do |win_combo|
    if win_combo.all? {|spots| @board[spots] == "X" }
       return "X"
    elsif win_combo.all? {|spots| @board[spots] == "O"}
       return  "O"
    end
    end 
    nil 
end



def play
  while !over?
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  else draw?
    puts "Cats Game!"
  end
  
end


end