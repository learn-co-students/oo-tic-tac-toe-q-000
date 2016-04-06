
class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

WIN_COMBINATIONS = [
  [0,1,2], #TOP ROW WIN
  [3,4,5], #MID ROW WIN
  [6,7,8], #BOT ROW WIN   #  0 | 1 | 2
  [0,3,6], #LEFT WIN      #  ---------
  [1,4,7], #MID WIN       #  3 | 4 | 5
  [2,5,8], #RIGHT WIN     #  ---------
  [0,4,8], #L2R WIN       #  6 | 7 | 8
  [6,4,2]  #R2L WIN
]

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

  def move(input, player = "X")
    @board[input.to_i-1] = player
  end

  def position_taken?(location)
    !(@board[location].nil? || @board[location] == " ")
  end

  def valid_move?(position)
    position = position.to_i
   if position.between?(1,9) && (position_taken?(position-1) == false) 
      valid_move = true
   else 
      valid_move = false
   end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
      move(input, current_player)
    else
      until valid_move?(input)
        puts "Move is invalid, please try again"
        input = gets.strip
      end
    end
    display_board
  end

  #WON METHOD
  def won?
   WIN_COMBINATIONS.detect do |sequence|
    @board[sequence[0]] == @board[sequence[1]] &&
    @board[sequence[1]] == @board[sequence[2]] &&
    position_taken?(sequence[0])
   end
  end

#FULL METHOD
  def full?
     @board.all? do |characters|
     characters == "X" || characters == "O"
    end 
  end

#DRAW METHOD
  def draw?
      full? && !won?
  end

#OVER METHOD
  def over?
    won? || draw?
  end

#WINNER METHOD
  def winner
     if winning_sequence = won?
        @board[winning_sequence.first]
     end
  end

  def play
    while !over?
      turn
    end
       if won? 
         puts "Congratulations #{winner}!"
       elsif draw?
         puts "Cats Game!"
       end
    end
end



##MOVE


##POSITION_TAKEN?


##VALID_MOVE


##TURN 


##PLAY





