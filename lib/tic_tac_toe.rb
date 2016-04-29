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
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,3,6], # Left column
    [1,4,7], # Middle column
    [2,5,8], # Right column
    [0,4,8], # Top-left to bottom-right diagonal
    [6,4,2]  # Top-right to bottom-left diagonal
   ]

  def board
    @board
  end

  def board=(new_board)
    @board=new_board
  end

  def move(location, char="X")
    @board[location.to_i-1] = char
  end

  def position(location)
    @board[location.to_i]
  end

  def position_taken?(location)
    !(@board[location] == " " || @board[location] == "" || @board[location] == nil)
  end

  def valid_move?(location)
    location.to_i.between?(1,9) && !position_taken?(location.to_i - 1)
  end

  def turn
    puts "Please enter 1-9:"
    location = gets.strip
  while valid_move?(location) != true
     puts "Please enter 1-9:"
     location = gets.strip
  end
    move(location, current_player)
    display_board
  end

  def turn_count
   counter = 0
   board.each do |turn|
     if turn == "X"
       counter += 1
     elsif turn == "O"
       counter += 1
     else turn == " "
       counter += 0
     end
   end
     counter
end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def won?
    result = false
    WIN_COMBINATIONS.each do |win_combination|
      if !result
        if win_combination.all?{|i| @board[i]=="X"} || win_combination.all?{|i| @board[i]=="O"}
           result = win_combination
        end
      end
    end
     result
  end

  def full?
    if @board.any?{|location| location == " "}
      false
    else
      true
    end
  end

  def draw?
    if won? == false && full? == true
      true
    else
     false
    end
  end

  def over?
    if won? == false && draw? == false && full? == false
      false
    else
      true
    end
  end

  def winner
    win_combination = won?
      if win_combination
        @board[win_combination[0]]
      else
        nil
      end
  end

  def play
    while !over?
      turn
  end

   if draw?
      puts "Cats Game!"
   end

   if won?
      puts "Congratulations #{winner}!"
   end

end

end
