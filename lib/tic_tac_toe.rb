class TicTacToe
   def initialize(board = nil)
       @board = board || Array.new(9, " ")
   end
   
   def board=(board)
       @board = board
   end
   def board
       @board
   end

   def current_player
       turn_count % 2 == 0 ? "X" : "O"
   end

   def turn_count
       @board.count{|token| token == "X" || token == "O"}
   end

   def display_board
       puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
       puts "-----------"
       puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
       puts "-----------"
       puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
   end
   WIN_COMBINATIONS = [
       [0,1,2],
       [3,4,5],
       [6,7,8],
       [0,3,6],
       [1,4,7],
       [2,5,8],
       [0,4,8],
       [6,4,2]
   ]


   def move(position, value="X")
       position = position.to_i
       board[position-1] = value
   end

   def position_taken?(position)
       !(board[position].nil? || board[position] == " ")
   end
   def valid_move?(position)
       return if (position.to_i - 1 < 0)
       !position_taken?(position.to_i-1)
   end
   def turn
       puts "Please enter 1-9:"
       position = gets.strip
       if valid_move?(position)
           move(position,current_player)
           display_board
       else 
           turn
       end
   end

   def won?

       WIN_COMBINATIONS.detect do |win_combination|

           win_index_1 = win_combination[0]
           win_index_2 = win_combination[1]
           win_index_3 = win_combination[2]

           position_1 = board[win_index_1]
           position_2 = board[win_index_2]
           position_3 = board[win_index_3]

           position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 =="O"
       end
   end

   def full?
       board.all? do |cell|
           cell == "X" || cell == "O"
       end
   end

   def draw?
       if won? == nil && full? == true
           return true
       end
   end

   def over?
       if draw? == true || won? != nil
           return true
       end
   end

   def winner
       if won? != nil
           won?.each do |win_num|
               return board[win_num][0]
           end
       end
   end
   def play
       until over? == true
           turn  
       end
       if draw? == true
           puts "Cats Game!"
       else
           puts "Congratulations #{winner}!"
       end
   end


end