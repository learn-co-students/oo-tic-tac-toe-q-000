
class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 4, 8],
      [2, 4, 6],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8]
    ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

  def input_to_index(user_input)
    user_input = user_input.to_i
    user_input - 1
  end

  def move(index, token="X")
    if @board[index] = " "
      @board[index] = token
    end
  end

  def position_taken?(index)
    if @board[index] == " "
      false
    elsif @board[index] == "X"
      true
    elsif @board[index] == "O"
      true
    end
  end

  def valid_move?(index)
    if index.between?(0, 8) && !position_taken?(index)
      true
    else
      false
    end
  end

  def turn_count
    counter = 0
    @board.each do |taken|
    if taken == "X"
      counter += 1
    elsif taken == "O"
      counter += 1
    end
  end
    return counter
  end

def current_player
  if turn_count.even?
    return "X"
  else
    return "O"
  end
end

def turn
  puts "Please enter 1-9"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(index)
    move(index, current_player)
    display_board
  else
    turn
  end
end

def won?
  WIN_COMBINATIONS.each do |win_combination|
    win = win_combination.all? do |index|
      @board[index] == "X"
    end
    if win
      return win_combination
    end
    win = win_combination.all? do |index|
      @board[index] == "O"
    end
    if win
      return win_combination
    end
  end
  return false
end

def full?
  @board.all? do |token|
  if token == "X"
    true
  elsif token == "O"
    true
  else
    false
  end
end
end

def draw?
  if full? && !won?
    true
  else
    false
  end
end

def over?
  if won? || full? || draw?
    true
  else
    false
  end
end

def winner
  if won?
    return @board[won?[0]]
  else
    nil
  end
end

def play
  until over? == true
    turn
  end

  if draw?
    puts "Cat's Game!"
  elsif won?
    puts "Congratulations #{winner}!"
  end
end

end
