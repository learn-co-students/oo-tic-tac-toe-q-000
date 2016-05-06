class TicTacToe
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
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

  WIN_COMBINATIONS = 

[
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

def move(position, current_player)
  position = position - 1
  @board[position] = current_player
end

def position_taken?(position)
  @board[position] != " " && @board[position] != ""
end

def valid_move?(position)
  position = position.to_i - 1
  position.between?(0,8) && !position_taken?(position)
end


def turn
  position = nil
  until valid_move?(position) do
    puts "Please enter 1-9:"
    position = gets.strip.to_i

  end

    move(position, current_player)
    display_board
  
end


def play
      
    until over? do

      turn

    end

      if won?

        if winner == "X"
          puts "Congratulations X!"
      
        elsif winner == "O"
          puts "Congratulations O!"
        
        end
  
      elsif draw?
          puts "Cats Game!"

      
      else
        return nil
      end
end
    





def won?


  won_comb_X = @board.each_index.select do |position|
    @board[position] == "X"
  end

  won_comb_O = @board.each_index.select do |position|
    @board[position] == "O"
  end
   
  if won_comb_X == [] && won_comb_O == []
    
    return false

  elsif (WIN_COMBINATIONS.none? {|subarray| subarray & won_comb_X == subarray}) && (WIN_COMBINATIONS.none? {|subarray| subarray & won_comb_O == subarray})

    return false

  
  elsif WIN_COMBINATIONS.none? {|subarray| subarray & won_comb_X == subarray}
    return won_comb_O
    

  else
    return won_comb_X
    
    
  end
end

def full?
  if @board.none? do |entry|
    entry == " " || entry == ""
  end
  
    return true
    
  
  else

    return false

  end
end

def draw?

  !won? && full?

end

def over?

  if draw?
    return true

  elsif won?
    return true

  else

    return false

  end
end

def winner

  won_comb_X = @board.each_index.select do |position|
    @board[position] == "X"
  end

  won_comb_O = @board.each_index.select do |position|
    @board[position] == "O"
  end
   

if WIN_COMBINATIONS.any? {|subarray| subarray & won_comb_X == subarray}
    
    return "X"

elsif
    WIN_COMBINATIONS.any? {|subarray| subarray & won_comb_O == subarray}
   
    return "O"


else
    return nil

  end
end
end