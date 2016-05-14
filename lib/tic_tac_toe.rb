
class TicTacToe

WIN_COMBINATIONS =[ 
     [0,1,2],#0 #top row horizontal
     [3,4,5],#1 #middle row horizontal
     [6,7,8],#2 #buttom row horizontal
     
     [0,3,6],#3 #left column vertical
     [1,4,7],#4 #middle column vertical
     [2,5,8],#5 #right column verical

     [8,4,0],#6 #left_to_right adj
     [2,4,6] #7 #right_to_left adj
  ]

def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

def initialize (board = nil)
  @board = Array.new(9," ")
  end

def move(location, token = "X")
    @board[location.to_i-1] = current_player
  end

def current_player
  turn_count.even? ? "X" : "O"   
  end

def position_taken? (location)
    @board[location] != " " && 
    @board[location] != ""  
  end

def valid_move? (location)
    location.to_i.between?(1,9) && !(position_taken?(location.to_i-1) )
  end

def turn
    display_board
    puts "Please enter 1-9:"
    location = gets.strip
      if valid_move?(location)
        move(location)
      else
        turn
      end
  end

def turn_count
    @board.count{|element| element=="X" || element=="O"}
  end


def won?
    WIN_COMBINATIONS.find do |set|
      @board[set[0]] == @board[set[1]] &&
      @board[set[1]] == @board[set[2]] &&
      position_taken?(set[2])
    end
  end

def full?
    !(@board.include?(" ") || @board.include?(""))
  end

def draw?
   won?.nil? && full?
  end

  def over?
    full? && draw? || !(won?.nil?)
  end

  def winner
    if won? !=nil
     @board[ won?[0] ]
    else
      won?
    end
  end

  def play
        until over? == true || 
              draw? != false || 
              won? != nil
              turn
          end

          if won? !=nil 
                display_board
                puts "Congratulations #{winner}!"
                won?
            else draw?   
                 display_board
                 puts "Cats Game!"
                 draw?  
          end
end



end
