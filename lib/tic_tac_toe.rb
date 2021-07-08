class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6],
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, token = "X")
    @board[position.to_i - 1] = token
  end

  def position_taken?(position)
    !(@board[position].nil? || @board[position] == " ")
  end

  def valid_move?(position)
    position = position.to_i - 1
    position.between?(0,8) && !position_taken?(position)
  end

  def turn
  display_board
  puts "Please enter 1-9:"
  input = gets.strip
  position = input.to_i
  if valid_move?(position)
    move(position, current_player)
  else
    turn
  end
end

def turn_count
  counter = 0
@board.each do |count|
if count == "X"||count == "O"
  counter += 1
end
end
counter
end

def current_player
  turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
  WIN_COMBINATIONS.each do |win_combination|
    if @board[win_combination[0]] == @board[win_combination[1]] && @board[win_combination[1]] == @board[win_combination[2]] && position_taken?(win_combination[0])
      return win_combination
    end
  end
  nil
  end

  def full?
    @board.all? do |index|
      index == "X" || index == "O"
    end
  end

  def draw?
  !won? && full?
end

  def over?
    if won? || draw? || full?
      true
    end
  end

  def winner
  if winning_combo = won?
    @board[winning_combo.first]
  end
end

def play
  until over?
    turn
  end
  if won?
  puts "Congratulations #{winner}!"
elsif draw?
  puts "Cats Game!"
end
end
end
