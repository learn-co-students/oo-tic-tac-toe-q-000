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
  [6,4,2]
  ]

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def move(location, current_player = "X")
  @board[location.to_i-1] = current_player
end

def position_taken?(location)
  !(@board[location].nil? || @board[location] == " ")
end

def valid_move?(position)
  position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
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
  @board.each do |space|
    if space == "X" || space == "O"
      counter += 1
    end
  end
  return counter
end

def current_player
  if turn_count.even?
    "X"
  else
    "O"
  end
end

def won?
  if @board.any? {|position| position == "X" || position == "O"
      WIN_COMBINATIONS.each do |win_combination|
        position_1 = @board[win_combination[0]]
        position_2 = @board[win_combination[1]]
        position_3 = @board[win_combination[2]]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      end
      end}
    else
    return false
   end
end

def full?
  if @board.all? {|position| (position == "X" || position == "O")}
    true
  else
    false
  end
end

def draw?
  if full? && !won?
    true
  end
end

def over?
  if draw? || full? || won?
    true
  end
end

def winner
  if !won?
    return nil
    elsif won?
    x_count = 0
    o_count = 0
    @board.each do |element|
      if element == "X"
        x_count += 1
      elsif element == "O"
        o_count += 1
      end
    end
  end
  if x_count > o_count
    return "X"
    elsif o_count > x_count
    return "O"
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