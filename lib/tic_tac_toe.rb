class TicTacToe
  def initialize
    @board = Array.new(9, " ")
    end
   # Define your WIN_COMBINATIONS constant
  WIN_COMBINATIONS = [
                    [0,1,2],
                    [3,4,5],
                    [6,7,8],
                    [0,3,6],
                    [1,4,7],
                    [2,5,8],
                    [0,4,8],
                    [6,4,2]
                    ]


  def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(location, the_player = "X")
    @board[location.to_i-1] = the_player
  end


 def position_taken? (position)
  if  @board[position] == " " || @board[position] == "" || @board[position] == nil
    false
  elsif
      @board[position] == "X" || @board[position] == "O"
    true
  end
end

   def valid_move? (position)
     position = position.to_i - 1
     if !position.between?(0, 9) || position_taken?(position)
      false
      else
        true
     end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
  if !valid_move?(input)
     turn
  end
    player = current_player
    move(input, player)
    display_board
  end

   def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

def turn_count
  counter = 0
  @board.each {|turn|
     if turn == "X" || turn == "O"
       counter += 1
     end}
    counter
end

  def won?
    WIN_COMBINATIONS.detect {|win|
         win.all? {|i| @board[i] == "X" } ||
         win.all? {|r| @board[r] =="O" }}
    end

  def full?
    @board.all? { |i| i == "X" || i == "O"}
  end

  def draw?
    if full? && !won?
      return true
    end
  end

  def over?
    won? ||  draw? || full?
  end

def winner
  if won?
    return @board[won?[0]]
  end
 end


def play
   until over?
     turn
  end
   if won?
     puts "Congratulations #{winner}!"
   elsif draw?
     puts "Cats Game!"
    end
  end
end