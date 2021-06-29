class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(location, value ="X")
    @board[location - 1] = value
  end

  def position_taken?(position)
     @board[position.to_i] == " " ? false : true
  end    
 
  def valid_move?(position)
    
    def between?(position)
      position = position.to_i
     if (position >= 1) && (position <= 9)
      return true 
     end
    end

    if between?(position) && position_taken?(position.to_i - 1) == false 
      return true
    end
  end

  def turn
   puts "Please enter 1 to 9:"
   position = gets.strip
   position = position.to_i
   if valid_move?(position)
    value = current_player
      move(position,value)
      display_board
   else turn
   end
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
     location = 0
     count = 0 
    while location < 9
       if position_taken?(location) == false
         count += 1
       end
      location += 1
    end
    if count == 9 
       return false
    end
    count = 0
    WIN_COMBINATIONS.each do |combination|
       if ( @board[combination[0]] == "X" && @board[combination[1]] == "X" && @board[combination[2]] == "X") || (@board[combination[0]] == "O" && @board[combination[1]] == "O" && @board[combination[2]] == "O")
          return combination
       else
          count += 1
       end
       if count == 8 
          return false
       end
    end
  end

  def full?
      count = 0
      @board.each do |position|
        if position == "X" || position == "O"
            count += 1
        end
      end
        if count == 9 
           return true
        else 
           return false
        end
  end

  def draw?
     if won? 
        return false
      elsif won? == false && full? == true
        return true
      elsif won? == false && full? == false
        return false
      end
  end

  def over?
     if draw? == true || full? == true || won? == true
        return true
     end
  end

  def winner
        if  won? != false
          array = won?
          if @board[array[0]] == "X" && @board[array[1]] == "X" && @board[array[2]] == "X"
          return "X"
          elsif @board[array[0]] == "O" && @board[array[1]] == "O" && @board[array[2]] == "O" 
          return "O"
          end
        end
  end


  def play
       if won? 
           a = winner
           puts "Congratulations #{a}!"
           return "Congratulations #{a}!"
       elsif  draw?
           puts "Cats Game!"
           return "Cats Game!"
       end
   
  until  over? 
        turn
       if won? 
           a = winner
           puts "Congratulations #{a}!"
           return "Congratulations #{a}!"
       elsif  draw?
           puts "Cats Game!"
           return "Cats Game!"
       end
  end
       if won? 
           a = winner
           puts "Congratulations #{a}!"
           return "Congratulations #{a}!"
       elsif  draw?
           puts "Cats Game!"
           return "Cats Game!"

       end
  end
end