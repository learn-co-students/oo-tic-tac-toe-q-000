WIN_COMBINATIONS = [
  [0,1,2],
  [0,3,6],
  [0,4,8],
  [1,4,7],
  [2,5,8],
  [3,4,5],
  [6,7,8],
  [6,4,2]
]

class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ") 
  end 

  def board
    @board
  end 

  def display_board
    puts   " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts              "-----------"
    puts   " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts              "-----------"
    puts   " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
 

  def move(location, token="X")
    @board[location.to_i-1] = token 
  end 

  def position_taken?(location)
    if !(@board[location].nil? || @board[location] == " " || @board[location] == "")
      true
    else
      false
    end
  end

  def valid_move?(location)
    location.to_i.between?(1,9) && !position_taken?(location.to_i-1)
  end

  def turn
      puts "Please enter 1-9:"
      location = gets.strip
    if valid_move?(location)
      move(location, current_player)
    else   
        turn
    end
      display_board
  end

  def turn_count
    @board.count{|turns| turns=="X" || turns=="O"}
  end

  def current_player
     turn_count % 2 == 0 ? "X" : "O"
  end

  def won?

    WIN_COMBINATIONS.each do | win_combination |

      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      end
    end
    false
  end

  def full?
    if @board.all? { |all| all == "X" || all == "O" } && !won?
      return true
    else
      return false
    end
  end

  def draw?
    full? && !won?
  end

  def over?
      draw? || won?
  end

  def winner
    WIN_COMBINATIONS.each do |win_combo|
      if win_combo.all? {|index| @board[index] == "X" }
         return "X"
      elsif win_combo.all? {|index| @board[index] == "O"}
         return  "O"
      end
      end
      nil
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

