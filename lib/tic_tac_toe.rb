class TicTacToe

  def initialize
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8], # Diagonal 1
  [6,4,2], # Diagonal 2
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

  def turn(current_player = "X")
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
      move(input, current_player)
    else
      turn()
    end
    display_board
  end

  def turn_count
    pos_taken = @board.reject{ |i| i == " "}
    return pos_taken.count
  end

  def current_player  #actually returns what the next move/player should be
    if (turn_count % 2) == 0
      return "X"
    else
      return "O"
    end
  end

def won?
  WIN_COMBINATIONS.each do |combination|
    index_1 = combination[0]
    index_2 = combination[1]
    index_3 = combination[2]

    position_1 = @board[index_1]
    position_2 = @board[index_2]
    position_3 = @board[index_3]
    if (position_1 == "X" && position_2 == "X" && position_3 == "X") ||
       (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return combination
    end
  end
  return false
end

def full?
  !@board.any?{ |i| i == " " }
end

def draw?
  if !won? && full?
    return true
  else
    return false
  end
end

def over?
  if full? || won? || draw?
    return true
  else
    return false
  end
end

def winner
  won_location = won?
  #puts "Won: #{won_location}"
  if won_location == false
    return nil
  else
    return @board[won_location[0]]
  end
end

  def play
    until over? do
      next_turn = current_player
      if next_turn == "X"
        turn()
      else
        turn(next_turn)
      end
    end
    who_won = winner
    if who_won == "X"
      puts "Congratulations X!"
    elsif who_won == "O"
      puts "Congratulations O!"
    else
      puts "Cats Game!"
    end
  end
end