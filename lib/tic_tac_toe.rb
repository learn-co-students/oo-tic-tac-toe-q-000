
class TicTacToe

  def initialize( board = nil )
    @board = board  || Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
	  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
	  puts "-----------"
	  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, char = "X")
    @board[position.to_i - 1] = char
  end

  def position_taken?(position)
         p_taken = false
      if (@board[position] == "" || @board[position] == " " || @board[position] == nil)
         p_taken = false
      else
         p_taken = true
      end
    p_taken
   end

  def valid_move?(position)
    valid_move = false
     if position.to_i.between?(1,9) &&  !position_taken?(position.to_i - 1)
        valid_move = true
     end
    valid_move
  end

     def current_player
       turn_count % 2 == 0 ? "X" : "O"
     end

    def turn_count
	    @board.count{|c| c == "X" || c == "O"}
	  end

   def turn
     puts "Please enter 1-9:"
     display_board
     input = gets.chomp
       if !valid_move?(input)
          turn
       end
     move(input, current_player)
     display_board
   end

   def full?
     !@board.any?{ |f| f == " " || f == "" || f.nil? }
   end

    def draw?
       if full?
           if !won?
             return true
           else
             return false
           end
       elsif !won?
          return false
       else
         return false
       end
    end

   def full?
     !@board.any?{ |f| f == " " || f == "" || f.nil? }
   end

   def over?
      if !draw?
         if !won?
            return false
         else return true
         end
        return false
       else
        return true
       end
    end

    def winner
      if won? == false
        nil
        elsif @board[won?[2]] == "X"
        return "X"
        elsif @board[won?[0]] == "O"
        return "O"
        end
    end

WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,4,8],[6,4,2],[0,3,6],[2,5,8],[1,4,7]]
W = WIN_COMBINATIONS

 def won?
	 W.each do |win_comb|
#      win_comb_1 = win_comb[0]
#      win_comb_2 = win_comb[1]
#      win_comb_3 = win_comb[2]
     new_pos_1 = @board[win_comb[0]]
     new_pos_2 = @board[win_comb[1]]
     new_pos_3 = @board[win_comb[2]]

       if (new_pos_1 == "X" && new_pos_2 == "X" && new_pos_3 == "X") || (new_pos_1 == "O" && new_pos_2 == "O" && new_pos_3 == "O")
          return win_comb
       end
	  end
	 return false
	end

	def play
    puts    "... wanna play some Tictactoe?"
  		until over?
    	turn
  		end

  	if winner == "X"
         puts "Congratulations X!"
      elsif winner == "O"
         puts "Congratulations O!"
      else
        puts "Cats Game!"
      end
  	end

end
