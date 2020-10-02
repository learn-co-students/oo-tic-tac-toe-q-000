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
      [0,1,2], # top row
      [3,4,5], # middle row
      [6,7,8], # bottom row
      [0,3,6], # left column
      [1,4,7], # middle column
      [2,5,8], # right column
      [0,4,8], # left diag
      [6,4,2] # right diag
   ]

   def move(position, char = "X")
      position = position.to_i - 1
      @board[position] = char
   end

   def position_taken?(location)
     !(@board[location].nil? || @board[location] == " ")
   end

   def valid_move?(position)
     position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
   end

   def turn
      puts "Please enter 1-9:"
      position = gets.strip
      if valid_move?(position)
         move(position, current_player)
         display_board
      elsif !valid_move?(position)
         puts "Please enter another number 1-9:"
         position = gets.strip
      end
      display_board
   end

   def turn_count
      count = 0
      @board.each do |turn|
         if turn != " "
            count += 1
         end
      end
      return count
   end

   def current_player
      if turn_count % 2 == 0
         return "X"
      else
         return "O"
      end
   end

   def won?
      WIN_COMBINATIONS.each do |win_combination|
         win_index_1 = win_combination[0]
         win_index_2 = win_combination[1]
         win_index_3 = win_combination[2]
         position_1 = @board[win_index_1]
         position_2 = @board[win_index_2]
         position_3 = @board[win_index_3]
         if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
            return win_combination
         end
      end
      return false
   end

   def full?
      @board.all? do |str|
      str == "O" || str == "X"
      end
   end

   def draw?
      if full? && !won?
         return true
      end
   end

   def over?
      if draw? || won?
         return true
      end
   end

   def winner
      if won?
         return @board[won?[0]]
      else
         return nil
      end
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
end
