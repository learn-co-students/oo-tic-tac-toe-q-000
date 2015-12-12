
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
     input = gets.strip
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
       elsif
         !won?
           return false
        else
           return false
     end
   end

   def over?
      if !draw?
         if !won?
            return false
         else return true
         end
       else
        return true
       end
    end

    def winner
      if won? == false
        nil
        elsif @board[won?[0]] == "X"
        return "X"
        elsif @board[won?[0]] == "O"
        return "O"
        end
    end

WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,4,8],[6,4,2],[0,3,6],[2,5,8],[1,4,7]]
W = WIN_COMBINATIONS

 def won?
	 W.each do |x|
     i_1 = x[0]
     i_2 = x[1]
     i_3 = x[2]

     p_1 = @board[i_1]
     p_2 = @board[i_2]
     p_3 = @board[i_3]

       if (p_1 == "X" && p_2 == "X" && p_3 == "X") || (p_1 == "O" && p_2 == "O" && p_3 == "O")
          return x
          return true
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
