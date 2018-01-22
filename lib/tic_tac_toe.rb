class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
  [0,1,2],  # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6],  # Vertical row
  [1,4,7],  # Vertical Middle row
  [2,5,8],  # Vertical row
  [0,4,8],  # Diagonal Row
  [6,4,2]   # Diagonal Row
  ]


  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(input, char = "X")
    position = input.to_i - 1
    @board[position] = "#{char}"
  end 

  def position_taken?(position)
    @board[position] == "X" || @board[position] == "O"
  end  

  def valid_move?(position)
    position = position.to_i - 1
    position.between?(0,8) && !position_taken?(position) 
  end 
   
  def turn
    puts "Please enter 1-9:"
    position = gets.strip
    valid_move?(position) ? move(position, current_player) : turn
    display_board  
  end

  def current_player
    turn_count.even? ? "X" : "O" 
  end 

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def won?
  WIN_COMBINATIONS.detect do |combo| 
    combo.all? {|location| @board[location] == "X" } || combo.all? {|location| @board[location] == "O" }
    end
  end

  def full?
    !@board.any? {|location| location == " "}  
  end

  def draw?
    full? && !won? ? true : false
  end 

  def over?
    won? || draw?
  end

  def winner
    won? ? @board[won?[0]] : nil
  end

  def play
   until over?
    turn 
   end 
   if won?
    puts "Congratulations #{winner}!"
   else draw?
    puts "Cats Game!" 
   end 
  end
end  