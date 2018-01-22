class TicTacToe
  attr_accessor :board
WIN_COMBINATIONS = [
  [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]
]

 def initialize()
    @board = Array.new(9, " ")
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

 def display_board
  puts [" #{board[0]} ""|"" #{board[1]} ""|"" #{board[2]} "]
  puts "-----------"
  puts [" #{board[3]} ""|"" #{board[4]} ""|"" #{board[5]} "]
  puts "-----------"
  puts [" #{board[6]} ""|"" #{board[7]} ""|"" #{board[8]} "]
 end


 def move(location,xo = "X")
  @board["#{location}".to_i - 1] = xo
 end


 def valid_move?(input)
  if input.to_i.between?(1, 9) && !position_taken?(input.to_i-1)
    true
  else
    false
  end
 end

def position(location)
    @board[location.to_i]
  end

 def position_taken?(location)
  if @board[location] == " " || @board[location] == "" || @board[location] == nil
    false
  else
    true
  end
 end


 def turn
   display_board
  puts "Please enter 1-9:"
  input = gets.chomp
  if valid_move?(input)
    move(input, current_player)
  else
    turn
  end
  display_board
 end


  def turn_count
  counter = 0
  @board.each do |count|
    if "#{count}" != " "
      counter += 1
    end
  end
  counter
 end


 def current_player
  if turn_count % 2 != 0
    "O"
  elsif turn_count % 2 == 0
    "X"
  end
 end


 def won?
    WIN_COMBINATIONS.detect do |win|
    position(win[0]) == position(win[1]) && position(win[1]) == position(win[2]) &&
    position_taken?(win[0])
    end
 end


 def full?
  @board.all? do |token| token == "X" || token == "O"
  end
 end


 def draw?
    !won? && @board.all? do |token| token == "X" || token == "O"
 end
 end


 def over?
  won? || draw?
 end


  def winner
   if w_combo = won?
      @winner = position(w_combo.first)
   end
 end


end