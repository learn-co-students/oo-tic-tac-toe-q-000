class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [  [0,1,2],  [3,4,5],  [6,7,8],  [0,3,6],  [1,4,7],  [2,5,8],  [0,4,8],  [6,4,2]  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, current_player = "X")
    @board[position.to_i-1] = current_player
  end


  def position_taken?(position)
    @board[position] == "X" || @board[position] == "O" ? true:false
  end

  def valid_move?(position)
   position.to_i.between?(1,9) && !position_taken?(position.to_i - 1)
  end

  def turn
    puts "Please enter 1-9:"
    position= gets.strip
    if valid_move?(position)
      current_player
      move(position, current_player)
    else
      turn
    end
    display_board
  end




def turn_count
  counter = 0
  @board.each do |space|
    if (space == "X" || space == "O")
      counter+= 1
    end
  end
  return counter
end

def current_player
  if turn_count.odd? 
    return "O"
  else
    return "X"
  end
end

def won?
  WIN_COMBINATIONS.detect do |i|
    @board[i[0]] == @board[i[1]] && @board[i[1]] == @board[i[2]] && position_taken?(i[0])
  end
end
  
def full?
  @board.all? {|token| token == "X" || token == "O"}
end

def draw?
  !won? && full?
end

def over?
  if won? || draw? || full?
    true
  else
    false
  end
end

def winner
  if !won?
    return nil
  else
    return @board[won?[0]]
  end
end

def play
  counter = 1
  until counter == 10
    if won?
      puts "Congratulations #{winner}!"
      break
    elsif draw?
      puts "Cats Game!"
      break
    elsif over?
      break
    else
    turn
    counter+=1
    end
  end
end

end
