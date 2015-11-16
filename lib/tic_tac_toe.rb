
class TicTacToe
  # Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  # ETC, an array for each win combination
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle Column
  [2,5,8], # Right Column
  [0,4,8], # Left diagonal
  [6,4,2]  # Right Diagonal
]


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

  def move(position, letter = "#{current_player(board)}")
    position = position.to_i
    @board[position-1] = letter
  end

  def position_taken?(position)
    if (@board[position] =="") || (@board[position] ==" ") || (@board[position] ==nil)
      false
      else
        if (@board[position] =="X") || (@board[position] =="O")
        true
        end
    end
  end
  
  def valid_move?(position)
  if position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
    return true
  else
    return false
  end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
      move(input,"#{current_player}")
    else
      turn
    end
    display_board
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    position_1 = @board[win_index_1] # load the value of the board at win_index_1
    position_2 = @board[win_index_2] # load the value of the board at win_index_2
    position_3 = @board[win_index_3] # load the value of the board at win_index_3

    if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return win_combination
        # return the win_combination indexes that won.
    end  
    end
    if (@board[0] == " " && @board[1] ==" " && @board[2] ==" " && @board[3] ==" " && @board[4] ==" " && @board[5] ==" " && @board[6] ==" " && @board[7] ==" " && @board[8] ==" " )
      return false
    end
    return false
  end
  
  def full?
    if @board.any?{|i| i == " "}
      return false
      else
      return true
      end
    return true
  end
  
  def draw?
    if won?.class == Array || won?
      return false
    else
      if (@board[0] == " " || @board[1] ==" " || @board[2] ==" " || @board[3] ==" " || @board[4] ==" " || @board[5] ==" " || @board[6] ==" " || @board[7] ==" " || @board[8] ==" " )
        return false
      end
    end
    return true
    end

    def over?  
      if won? == false 
        if draw?
          return true
        else
           return false
        end
      else
        return true
      end
    end

    def winner
      winning_board = won?
      if won?
        if @board[winning_board[0]] == "X"
          return "X"
        else @board[winning_board[0]]== "O"
          return "O"
        end
      else
        return nil 
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