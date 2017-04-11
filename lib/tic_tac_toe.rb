class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],
                    [6,7,8],[0,3,6],
                    [1,4,7],[2,5,8],
                    [0,4,8],[6,4,2]]

  def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(location, symbol = "X")
    @board[location.to_i - 1] = symbol
  end

  def position_taken?(location)
    !(@board[location.to_i].nil? || @board[location.to_i] == " ")
  end

  def valid_move?(location)
    if position_taken?(location.to_i - 1) || (!location.to_i.between?(1, 9))
    false
    else
    true
  end
  end

  def turn
    puts "Please enter 1-9:"
  position = gets.strip
  a = current_player
    if (valid_move?(position))
     move(position, a)
      else turn
        end
display_board
  end

  def turn_count
  counter = 0
  @board.each do |element|
   if (element == "X") || (element == "O")
     counter += 1
                end
        end
counter
  end

def current_player
  if turn_count % 2 == 0
  return "X"
  elsif turn_count % 2 == 1
  return "O"
end
  turn
end

def won?
  a = 0
  WIN_COMBINATIONS.each do |win_combination|
  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]

  position_1 = @board[win_index_1]
  position_2 = @board[win_index_2]
  position_3 = @board[win_index_3]

  if (position_1 == "X" && position_2 == "X" && position_3 == "X") ||
    (position_1 == "O" && position_2 == "O" && position_3 == "O")
    a = win_combination.to_ary
    false
    else
    false
      end
  end

  if @board.all? { |location| location == " "}
    false
    elsif WIN_COMBINATIONS.none? { |win_combination| a == win_combination}
    false
    else return a
  end
end

def full?
  @board.all? do |element|
  element == "X" || element == "O"
end
end

def draw?
  if  full? && !won?
  true
  elsif won?
  false
  elsif !won? && !full?
  false
end
end

def over?
   if won? || draw? || full?
    return true
    else
    false
  end
end

def winner
  if !won?
    return nil
elsif won?.all? {|index| @board[index] == "X"}
 return "X"
  elsif won?.all? {|index| @board[index] == "O"}
 return "O"
  end
end

def play

  if !won? || !draw? || !full
  until over? == true do
    current_player
    turn
              end
  end

  if won?
    puts "Congratulations #{winner}!"
    elsif draw?
    puts "Cats Game!"
  end
  end

end