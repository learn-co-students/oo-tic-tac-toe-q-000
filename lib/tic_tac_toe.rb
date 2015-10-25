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

def move(input, character = "X")
  location = (input.to_i) - 1
  @board[location] = character
end

def position_taken?(location)
  if @board[location] == nil || @board[location] == " "
    return false
  else
    return true
  end
end

def valid_move?(position)
  if position.to_i.between?(1,9) && position_taken?(position.to_i - 1) == false
    return true
  else
    return false
  end
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  position = input

  if valid_move?(position) == true
    character = current_player
    move(input, character)
  else
    puts "Please enter 1-9:"
    input = gets.strip
    position = input
  end 
  display_board
end

def turn_count
  turns_played = 0
    @board.each do |space|
      if space == "X" || space == "O"
        turns_played += 1
      end
  end
 turns_played
end

def current_player
  if turn_count.to_i % 2 == 0
    return "X"
  else
    return "O"
  end
end

def won?
  WIN_COMBINATIONS.each do |win_combination|
   if win_combination.all? {|location| @board[location] == "X" || win_combination.all? {|location| @board[location] == "O"}}
    return win_combination
    end
  end
  if @board.all? {|spot| spot == "X" || spot == "O"}
    return false
  end
end

def full?
   if @board.all? {|spot| spot == "X" || spot == "O"}
    return true
    end
  WIN_COMBINATIONS.each do |win_combination|
    if win_combination.any? {|location| @board[location] == " " || win_combination.any? {|location| @board[location] == "" || win_combination.any? {|location| @board[location] == nil}}}
      return false
    end
  end
end

def draw?
  if won? == false && full? == true
    return true
  elsif !!won? == false && full? == false
    return false
  elsif won?
    return false
  end
end

def over?
  if !!won? == true || full? == true || draw? == true
    return true
  end
end

def winner
  WIN_COMBINATIONS.each do |win_combination|
    if win_combination.all? {|location| @board[location] == "X"}
      return "X"
    elsif win_combination.all? {|location| @board[location] == "O"}
      return "O"
    end
  end
    if !!won? == false
      return nil
    end
end

  def play
    until over? == true
      turn
    end

    if draw? == true
      puts "Cats Game!"
    end

    if won?
      if winner == "X"
        puts "Congratulations X!"
      elsif winner == "O"
        puts "Congratulations O!"
      end
    end
  end

end