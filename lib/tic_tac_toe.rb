class TicTacToe

  def initialize(board = nil)
@board = board || [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  #Bottom row
  [0,3,6],  #Left columns
  [1,4,7],  #Center column
  [2,5,8],  #Right column
  [0,4,8],  #Left diagonal
  [6,4,2]  #Right diagonal
]

def display_board

    line_1 = " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    line_2 = "-----------"
    line_3 = " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    line_4 = "-----------"
    line_5 = " #{@board[6]} | #{@board[7]} | #{@board[8]} "

    puts line_1
    puts line_2
    puts line_3
    puts line_4
    puts line_5
  end



  def move(input, value)
    @board[input.to_i-1] = value
  end

  def position_taken?(input)
    if
     @board[input.to_i] == "X"
      true
    elsif
      @board[input.to_i] == "O"
      true
    else
      @board[input.to_i] == " " || "" || nil
      false
    end
  end

  def valid_move?(input)
    # nb: Arugments for position_taken.
      if (input.to_i-1).between?(0,8) && (position_taken?(input.to_i-1) == false)
        true
    else
      false
    end
  end

def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input) == true
      move(input, value = current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    counter = 0
    @board.each {|input|
     if input == "X" || input == "O"
      counter += 1
    end
  }
  return counter
end

def current_player
turn = turn_count
  if turn % 2 == 0
    return "X"
  else
   return "O"
 end
end

def won?
  WIN_COMBINATIONS.each { |win_group|
    if (@board[win_group[0]] == "X"  && @board[win_group[1]] == "X"  && @board[win_group[2]] == "X") || (@board[win_group[0]] == "O" && @board[win_group[1]] == "O" && @board[win_group[2]] == "O")
      return win_group
    end
  }
return false
end

def full?
  @board.none? {|input| input == " "}
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
  WIN_COMBINATIONS.each { |win_group|
    if (@board[win_group[0]] == "X"  && @board[win_group[1]] == "X"  && @board[win_group[2]] == "X") || (@board[win_group[0]] == "O" && @board[win_group[1]] == "O" && @board[win_group[2]] == "O")
      return @board[win_group[0]]
     end
    }
    return nil
end

def play
  until over?
    turn
  end

  if won? && winner == "X"
    puts "Congratulations X!"
  elsif won? && winner == "O"
    puts "Congratulations O!"
  elsif draw?
    puts "Cats Game!"
  end
end

end
