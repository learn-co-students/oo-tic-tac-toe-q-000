require 'pry'
class TicTacToe
  def initialize(board = nil) 
    @board = board || Array.new(9, " ")
  end
WIN_COMBINATIONS = [
[0, 1, 2], 
[3, 4, 5],
[6, 7, 8], 
[0, 3, 6], 
[1, 4, 7], 
[2, 5, 8],
[0, 4, 8], 
[6, 4, 2]
]

  def display_board
     puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
     puts "-----------"
     puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
     puts "-----------"
     puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(location, token = "X")
   @board[location.to_i-1] = token
  end 

  def position_taken?(position)
     if @board[position] == " " || @board[position] == "" || @board[position] == nil
     false 
     else @board[position] == "X" || @board[position] == "O"
     true
    end
  end

  def position_taken_1?(position)
    !(@board[position.to_i-1] == " ")
  end  
  
  def valid_move?(position)
    position.to_i.between?(1,9) && !position_taken_1?(position)
  end  

  def turn
    puts "please enter 1-9:"
    position = gets.strip
      if valid_move?(position)
      move(position, current_player)
      display_board
    else puts "Invald Move!!"
      turn
      end
   end

   def turn_count
    turns = 0
    @board.each do |item|
      if item == "X" || item == "O"
        turns += 1
       end 
     end
     turns  
   end   

    def current_player
      turn_count % 2 == 0 ? "X" : "O"
    end

     def won?
      WIN_COMBINATIONS.detect do |win_combo|  
        @board[win_combo[0]] == @board[win_combo[1]] &&
        @board[win_combo[1]] == @board[win_combo[2]] &&
        position_taken?(win_combo[0])
     end
    end
   
     def full?
      @board.all? do |filled|
        filled == "X" || filled == "O"
      end
    end
  
     def draw?
      !won? && full?
     end
     
     def over?
     won? || full?
     end

    def position(location)
      @board[location.to_i]
    end  

  def winner
    if who_won = won?
    winner = position(who_won[0])
    end
  end

  def play
    display_board
    while !over? && !draw?
      turn
    end   
   if won?
    puts "Congratulations #{winner}!"
  else draw?
    puts "Cats Game!"
   end
  end  
end

