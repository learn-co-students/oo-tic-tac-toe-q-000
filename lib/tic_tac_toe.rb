class TicTacToe

        def initialize
                @board = Array.new(9, " ")
        end

          WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # first column
  [1,4,7], # second column
  [2,5,8], # third column
  [0,4,8], # diagonal left
   [6,4,2]
]

        def display_board

  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
        end

def turn_count

        counter = 0
        @board.each do |occupied|

                if occupied == "X" || occupied == "O"
                        counter += 1
                end # ends if statement
        end # ends do
        counter
end # ends method

def current_player

        if turn_count.odd?
                return "O"
        elsif turn_count.even?
                return "X"
        end
end

        def move(position, character = "X")

        if character == "X" || character == "O"
        @board[position.to_i-1] = character
       elsif current_player == "X"
                @board[position.to_i-1] = "X"
        elsif current_player == "O"
                @board[position.to_i-1] = "O"
        end
          return @board
        end

def position_taken?(position)
  !(@board[position].nil? || @board[position] == " ")
end

def valid_move?(position)

        position = position.to_i-1

        if position >= 0 && position <= 8 && @board[position] == " "
                return true

        else position_taken?(position) != false
                return false
        end
end

def turn
        puts "Please enter 1-9:"
        position = gets.strip

        if valid_move?(position)
                move(position, current_player)
               display_board

        else !valid_move?(position)
                puts "The move is invalid. Please enter a move again:"
                turn
        end
end

def won?
  WIN_COMBINATIONS.detect do |win_combination|
    @board[win_combination[0]] == @board[win_combination[1]] &&
    @board[win_combination[1]] == @board[win_combination[2]] &&
    position_taken?(win_combination[0])
  end
end

def full?
        @board.all?{|full| full == "X" || full == "O"}
        end

def draw?

        !won? && full?
end

def over?

        draw? || won?

end

def winner

     if   winning_combination = won?
    @board[winning_combination.first]
     end
end

def play

until over?
       turn
end

        if winner == "X"
        puts "Congratulations X!"
        elsif winner == "O"
        puts "Congratulations O!"
        elsif draw?
        puts "Cats Game!"
        end
end


end  #ends class

