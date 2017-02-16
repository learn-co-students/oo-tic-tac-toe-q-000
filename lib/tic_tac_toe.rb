class TicTacToe
   def initialize(board = nil)
     @board = board || Array.new(9, " ")
   end
 
   WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]
 
   def display_board
     puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
     puts "-----------"
     puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
     puts "-----------"
     puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
   end
 
   def move(position, value = "X")
     @board[position - 1] = value
   end
 
   def position_taken?(position)
     position = position.to_i
     if @board[position] == " " || @board[position] == "" || @board[position] == nil
       false
     else
       true
     end
   end
 
   def valid_move?(position)
     position = position.to_i - 1
     if position_taken?(position) == false && position.between?(0,8)
       true
     else
       false
     end
   end
 
   def turn
     puts "Please input position number (1-9)!"
     input = gets.strip
     position = input.to_i
     if valid_move?(position)
       move(position, current_player)
       display_board
     else
       puts "INPUT ERROR!"
       turn
     end
   end
 
   def turn_count
     @board.count do |input|
       "#{input}" == "X" || "#{input}" == "O"
    end
   end
 
   def current_player
     turn_count % 2 == 0 ? "X" : "O"
   end
 
   def won?
     WIN_COMBINATIONS.each do |check|
       if (@board[check[0]] == "X" && @board[check[1]] == "X" && @board[check[2]] == "X") || (@board[check[0]] == "O" && @board[check[1]] == "O" && @board[check[2]] == "O")
         return check
       end
     end
     nil
   end
 
   def full?
     @board.all? { |e|  e =="X" || e == "O"}
   end
 
   def draw?
     a = won?
     b = full?
     if b && !a
       true
     else
       false
     end
   end
 
   def over?
     full? || won? || draw?
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
     elsif draw?
       puts "Cats Game!"
     end
   end
 end