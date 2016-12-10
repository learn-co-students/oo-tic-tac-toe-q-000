class TicTacToe

    WIN_COMBINATIONS = [
	 [0,1,2], #Top row
	 [3,4,5], #Middle row
	 [6,7,8], #Bottem row
	 [0,3,6], #Left column
	 [1,4,7], #Middle column
	 [2,5,8], #Right column
	 [0,4,8], #Top left to bottom right
	 [2,4,6]  #Top right to bottom left
    ]

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

    def move(index, current_player = x)
       @board[index -1] = current_player
    end
    
    def position_taken?(location)
      @board[location] != " " && @board[location] != ""
    end

    def valid_move?(input)
      position = input.to_i
      position.between?(1,9) && !position_taken?(position -1)
    end

    def turn
      puts "Please enter 1-9:"
      user_input = gets.strip.to_i
  
      if valid_move?(user_input)
       move(user_input, current_player)
       display_board
      else
       turn
      end
    end

    def turn_count
	  couter =  @board.select{|charector| charector == "X" || charector == "O"}
	  couter.size
    end

    def current_player
	  turn_count.even? ? "X" : "O"
    end

    def won?
    	results = false
    	WIN_COMBINATIONS.each do |collction|
    		if !results
    	    i = @board.values_at(collction[0], collction[1], collction[2]).uniq
           if (i.size == 1) && (i[0] == "X" || i[0] == "O")
    	      results = collction
           end
         end
    	end
    	results
    end 
    
    def full?
      @board.all?{|tokan| tokan == "O" || tokan == "X"}
    end

    def draw?	 		
	   if won? && full?
	     false
	   elsif full? 
	     true	
	   end	
    end
    
    def over?
	   full?() || draw?() || won?()
    end

    def winner
   	won? ? @board[won?[0]] : nil
    end

    def play

  	  until over?
  	    turn()
  	  end

  	  if won?
  	    puts "Congratulations #{winner}!"
     else
       puts "Cats Game!"
     end 
             	
   end


end