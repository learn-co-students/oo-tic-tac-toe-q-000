class TicTacToe
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

  def initialize
    @board = Array.new(9," ")
  end


def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end


def position_taken?(location)
  !(@board[location].nil? || @board[location] == " ")
end

def move(position,value)
  @board[position.to_i-1]=value
end

def won?
    WIN_COMBINATIONS.each do |combination|
      if combination.all? { |position| @board[position] == 'X'}
        return combination
       elsif combination.all? { |position| @board[position] == 'O'}    # Seperate for 'X' and 'O' otherwise it fails if it's a draw
        return combination
      end
    end
    return false
end

def full?
  @board.all?{|position| position=="X"||position=="O"}
end

def draw?
  full? && !won?
end

def over?
  draw? || won?
end

def winner
  if !over?
    return nil
  end
  @board[won?[0]]=="X"? "X":"O"
end

def position_taken?(position)
  @board[position]=="X"||@board[position]=="O"? true : false
end

def valid_move?(position)
  if (!(position.is_a? Integer))
    position = position.to_i-1
   else
    position = position -1
  end
  (0..8) === position &&!(position_taken?(position))? true : false
end

def turn_count
  count = 0
  @board.each do |cell|
    count += (cell == "X" || cell == "O") ? 1 : 0
  end
  return count
end

def current_player
   turn_count%2==0? "X" : "O"
end

def turn
  puts("Please enter 1-9:")
  position = gets.strip
  if valid_move?(position)
    move(position,current_player)
    display_board
  else
    puts("invalid move")
    display_board
    turn
  end
end

def play
  until over? do
    turn
  end
  if (over?)
    if(draw?)
      puts "Cats Game!"
    elsif (won?)
      puts "Congratulations #{winner}!"
    end
  end
end
end