class TicTacToe

  attr_accessor :board

  def initialize
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  #bottom row
  [0,4,8],  #diagonal win
  [6,4,2],  #diagonal win
  [0,3,6],  #row 1 win
  [1,4,7],  #row 2 win
  [2,5,8]  #row 3 win
  ]
   # ETC, an array for each win combination

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  
  def move(location, current_player= "X")
    @board[location.to_i-1] = current_player
  end

  def position_taken?(location)
     @board[location] != " " && @board[location] != ""
  end

  def valid_move?(position)
  position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
  end    

  def turn
  puts "Please enter 1-9:"
  input = gets.strip
  if valid_move?(input)
    move(input, current_player)
  else
    turn
    end
      display_board
  end

  def turn_count
    @board.count{|board| !(board.strip.empty?)}
  end

  def current_player
    if turn_count % 2 == 0
     return "X"
      else return "O"
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      position_taken?(win_combination[0]) && board[win_combination[0]] == 
        board[win_combination[1]] && board[win_combination[1]] == 
      board[win_combination[2]]
    end
  end

  def full?
    if turn_count == 9
      return true
    end
  end

  def draw?
      if full? == true && !won? == true
        return true
      else return false
    end
  end

  def over?
    if draw? == true || !won? == false
        return true
      else return false
    end
  end

  def winner
    if win_array = won? 
      return board[win_array[0]]
      else return nil
    end
  end

  def play
      until over? == true do
        turn
      end

    if won?
        puts "Congratulations #{winner}!"
          elsif draw?
            puts  "Cats Game!"
        else return nil
      end
    end
   

end
