class TicTacToe

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-"*11
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-"*11
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i
  end

  def move(input, value)
      @board[input - 1] = value
  end

  def position_taken?(current_move)
    if @board[current_move] == " "
      return false
    elsif @board[current_move] == ""
      return false
    elsif @board[current_move] == nil
      return false
    else @board[current_move] == "X" || @board[current_move] == "O"
      return true
      end
    end

  def valid_move?(input)
      current_move = input.to_i - 1
      if current_move.between?(0,8) && !position_taken?(current_move)
         return true
      else
         return false
      end
  end

  def turn
    puts "Please make a move between 1 and 9"
    input = gets.strip.to_i
    input = input_to_index(input)
    if valid_move?(input)
       move(input, current_player)
       display_board
    else turn
      puts "Please enter valid number"
    end
  end

  def turn_count
    @board.count {|x| x == "X" || x == "O" }
    end

  def current_player
      if turn_count % 2 != 0
         return 'O'
      else turn_count % 2 == 0
         return 'X'
      end
  end

  def won?
   WIN_COMBINATIONS.each do |win_combo|
   win_index_1 = win_combo[0]
   win_index_2 = win_combo[1]
   win_index_3 = win_combo[2]

   position_1 = @board[win_index_1]
   position_2 = @board[win_index_2]
   position_3 = @board[win_index_3]
 if position_1 == position_2 && position_2 == position_3 && position_1 != " "
   return win_combo
 end
 end
 return nil
 end

 def full?
     if @board.all? { |cell| cell == "X" || cell == "O" }
     return true
   end
 end

 def draw?
   if !won? && full?
     return true
   else
     return false
   end
 end

 def over?
   if draw? || won? || full?
     return true
   else
     return false
   end
 end

 def winner
   if winning_combo = won?
      @board[winning_combo.first]
   end
 end

 def play
   until over?
       turn
       turn_count
   end
   if winner == "X"
     puts "Congratulations X!"
   elsif winner == "O"
     puts "Congratulations O!"
   else draw?
     puts "Cats Game!"
   end
 end

end
