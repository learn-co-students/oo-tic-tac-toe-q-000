class TicTacToe

  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
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
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, character = "X")
  @board[position.to_i - 1] = character
  end

  def position_taken?(position)
    if @board[position] != " "
      return true
    else
      return false
    end
  end

  def valid_move?(position)
    position = position.to_i - 1
      if !position.between?(0,8)
        return false
      elsif position_taken?(position)
        return false
      else 
        return true
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

  def turn_count
    counter = 0 
    @board.each do | character |
      if character != " "
      counter += 1
      end
    end
      return counter
  end


def current_player
  if turn_count % 2 == 0
    return "X"
  else 
    return "O"
  end
end

def won?
  WIN_COMBINATIONS.each do |win_combination|
    if win_combination.all? {|i| @board[i] == "X"} ||  win_combination.all? {|i| @board[i] == "O"}
      return win_combination
    end
  end
  return false
end

def full?
  @board.all? do |character|
    character != " "
  end
end

def draw?
  if won? || !full?
    return false
  else 
    return true
  end
end

def over?
  if won? || full? || draw?
    return true
  else 
    false
  end
end

def winner
  if won?
    @board[won?[0]]
  end
end

def play
  until over?
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  else draw?
    puts "Cats Game!"
  end
end
end
