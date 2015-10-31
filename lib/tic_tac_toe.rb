class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
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

def move(position, character = "X")
  @board[position.to_i - 1] = character
end

def position_taken?(position)
  if @board[position] == " " || @board[position] == "" || @board[position] == nil
    false
  else
    true
  end
end

def valid_move?(position)
  if position.to_i.between?(1, 9)
    if !position_taken?(position.to_i - 1)
      true
    end
  end
end

def turn
  puts "Please enter 1-9:"
  position = gets.strip
  if !valid_move?(position)
    turn
  else
    move(position, current_player)
  end
    display_board
end

def turn_count
  current_move_counter = 0
  @board.each do |index|
    if index == "X" || index == "O"
      current_move_counter += 1
    end
  end
  current_move_counter
end

def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

def won?
  WIN_COMBINATIONS.detect do |win|
    position_taken?(win[0]) && @board[win[0]] == @board[win[1]] && @board[win[1]] == @board[win[2]]
  end
end

def full?
  all_full = @board.all? do |element|
    element == "X" || element == "O"
  end
end

def draw?
  if !won? && full?
    true
  elsif won?
    false
  else
    false
  end
end

def over?
  won? || draw? || full?
end

def winner
  if won?
    won?.each do |index|
      if position_taken?(index) && @board[index] == "X"
        return "X"
      elsif position_taken?(index) && @board[index] == "O"
        return "O"
      else
        return nil
      end
    end 
  end
end

def play
  while !over?
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cats Game!"
  end
end

end
