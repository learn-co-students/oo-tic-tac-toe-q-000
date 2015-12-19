class TicTacToe

  def initialize
    @board=[" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def board
    @board
  end


  WIN_COMBINATIONS = [
[0, 1, 2],
[3, 4, 5],
[6, 7, 8],
[0, 3, 6],
[1, 4, 7],
[2, 5, 8],
[0, 4, 8],
[6, 4, 2]]

def display_board
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

#move
def move(location, current_player)
  board[location.to_i-1] = current_player
end

#turn_count
def turn_count
  counter = 0
  board.each do |space|
    if space == "X" || space == "O"
      counter += 1
    end
  end
  return counter
end

#current_player
def current_player
  return (turn_count.even? ? "X" : "O")
end

#position_taken?
def position_taken?(location)
  board[location] != " " && board[location] != ""
end

#valid_move?
def valid_move?(position)
  position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
end

#won?
def won?
  WIN_COMBINATIONS.each do |winning_trio| 
      winning_trio_index_1 = winning_trio[0]
      winning_trio_index_2 = winning_trio[1]
      winning_trio_index_3 = winning_trio[2]

      pos_1 = board[winning_trio_index_1]
      pos_2 = board[winning_trio_index_2]
      pos_3 = board[winning_trio_index_3]

      if (pos_1 == "X" && pos_2 == "X" && pos_3 == "X") || (pos_1 == "O" && pos_2 == "O" && pos_3 == "O")
      return true && pos_1
      end 
    end 
    return false
  end

#full?
def full?
  board.all? {|place| place == "X" || place == "O"}
end

#draw?
def draw?
  won? == false && full? == true
end

#over?
def over?
  won? || draw?
end

#winner
def winner
  if won?
    return won?
  end
end

#turn
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

#play
def play
  until over?
    turn
  end
  won?
  puts "Congratulations #{winner}!"

  draw?
  puts "Cats Game!"
end


end

