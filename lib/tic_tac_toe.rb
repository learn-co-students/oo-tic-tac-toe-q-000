class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8],[0, 3, 6],[1, 4, 7],[2, 5, 8],[0, 4, 8],[6, 4, 2]]

  def display_board
    puts " " + @board[0] + " | " + @board[1] + " | " + @board[2] + " "
    puts "-" * 11
    puts " " + @board[3] + " | " + @board[4] + " | " + @board[5] + " "
    puts "-" * 11
    puts " " + @board[6] + " | " + @board[7] + " | " + @board[8] + " "
  end

  def move(location, character="X")
    location = location.to_i
    location = location -= 1
    @board[location] = character
    return @board
  end

  def position_taken?(position)
  if ((@board[(position)] == " ") || (@board[position] == "") || (@board[position] == nil))
    return false
  else
    return true
  end
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
  end

  def turn
  puts "Please enter 1-9:"
  position = gets.chomp
  if valid_move?(position)
    move(position, current_player)
    display_board
  else
    puts "Sorry that's not available. Please try again"
    turn
  end
  end

  def turn_count
    x_count = @board.count("X")
    o_count = @board.count("O")
    total_turns = (x_count + o_count)
    return total_turns
  end

  def current_player
    if turn_count.even?
      return "X"
    else
      return "O"
    end
  end

  def won?
  WIN_COMBINATIONS.detect do |combo|
    combo.all? {|choice| @board[choice] == "X"} || combo.all? {|choice| @board[choice] == "O"}
    end
  end

  def full?
    if @board.none?{|position|position == " "} then true
    end
  end

  def draw?
    if full? && !won? then true
    end
  end

  def over?
    if won? || full? || draw? then true
    end
  end

  def winner
  unless won?
    return nil
  end
  if @board[won?[0]] == "X"
    return "X"
  elsif @board[won?[0]] == "O"
    return "O"
  end
end

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