class TicTacToe
  attr_accessor :board
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  def display_board
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

def turn_count
  counter = 0
  board.each do |x|
    if x.include?('X') || x.include?('O') 
      counter += 1
    end
  end
  counter
end

def current_player
  if turn_count % 2 == 0 
    "X"
  else
    "O"
  end
end


def move(location, current_player = "X")
  board[location.to_i-1] = current_player
end

def valid_move?(position)
  position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
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

def play
  i = 1
  while i <= 9
    turn
    i += 1
  end
end

def position_taken?(location)
  !(board[location].nil? || board[location] == " ")
end


# Define your WIN_COMBINATIONS constant

def won?
  answer = true
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    
    position_1 = board[win_index_1] 
    position_2 = board[win_index_2] 
    position_3 = board[win_index_3]


    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return answer = win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return answer = win_combination
    else
      answer = false
    end
  end
  answer
end



def full?
  if board.any? {|space| space.include?(" ")}
    false
  else
    true
  end
end

def draw?
  if full?
    if won?
      false
    else 
      true
    end
  else
    false
  end
end

def over?
  if draw? || won?
    true
  else
    false
  end
end

def winner
  if won? == false
    nil
  else
    x = won?[0]
    if board[x] == "X"
      "X"
    else
      "O"
    end
  end
end

## PLAY METHOD ##
def play
  until over?
    turn
  end

  if won?
    puts "Congratulations #{winner}!"
  else
    puts "Cats Game!"
  end
end

end