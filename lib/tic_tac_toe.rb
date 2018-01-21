class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end

  def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

WIN_COMBINATIONS = [
  [0,1,2], #horizontal
  [3,4,5],
  [6,7,8],

  [0,3,6], #vertical
  [1,4,7],
  [2,5,8],

  [0,4,8], #diagonal
  [6,4,2]
]

  def move(location, current_player = "X")
    @board[location.to_i-1] = current_player
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
  end

  def current_player
    return turn_count.even? ? "X" : "O"
  end

  def turn_count
    counter = 0
    @board.each do |position|
      if position == "X" || position == "O"
        counter += 1
      end
    end
    counter
  end

  def turn
    puts "Select a space to place your move"
    position = gets.strip

    if valid_move?(position)
       char = current_player
       move(position, char)
    else
       puts "Invalid move"
       turn
    end
    display_board
  end

def won?
  WIN_COMBINATIONS.detect do |combo| #the 8 nested arrays
    if @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]] && position_taken?(combo[0])
      combo #returns the winning array of 3 numbers
    else
      false
    end
  end
end

def full?
  if @board.include?(" ")
    false
  else
    true
  end
end

def draw?
  if won? || !full?
    false
  else full? && !won?
    true
  end
end

def over?
  if won? || draw? || full?
    true
  else
    false
  end
end

def winner
  combo = won? # either returns array or nil
  if combo
    @board[combo[0]] #returns the token itself. "X" OR "O" No need to overcomplicate things, keep it simple.
  else
    nil
  end
end

def play
  until over?
  turn
end

combo = won?
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cats Game!"
  end
end

end
