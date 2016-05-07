
class TicTacToe

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

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
    def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(location, token = "X")
    location = location.to_i - 1
    @board[location] = token
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(location)
    location = location.to_i - 1
    location.between?(0,8) && !position_taken?(location)
  end

  def turn
    puts "Please enter 1-9:"
   number = gets.strip
    if valid_move?(number)
      player = current_player
      move(number, player)
      display_board
    else 
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.find {|combo|
      win_index_1 = combo[0]
      win_index_2 = combo[1]
      win_index_3 = combo[2]

      position_1 = @board[win_index_1] 
      position_2 = @board[win_index_2] 
      position_3 = @board[win_index_3]      

      if position_1 ==  position_2 && position_2 ==  position_3 && position_1 != " "
        return combo
      else
        false
      end
    }
  end

def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
 
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def full?
    !@board.include?(" ")
  end

def draw?
  !won? && full?
end

def over?
  won? || draw? || full?
end

def winner
if  (@board[0] == "X" && @board[1] == "X" && @board[2] == "X") || 
    (@board[3] == "X" && @board[4] == "X" && @board[5] == "X") || 
    (@board[6] == "X" && @board[7] == "X" && @board[8] == "X") || 
    (@board[0] == "X" && @board[3] == "X" && @board[6] == "X") || 
    (@board[1] == "X" && @board[4] == "X" && @board[7] == "X") || 
    (@board[2] == "X" && @board[5] == "X" && @board[8] == "X") || 
    (@board[0] == "X" && @board[4] == "X" && @board[8] == "X") || 
    (@board[2] == "X" && @board[4] == "X" && @board[6] == "X") 
  return "X"

    elsif 
      (@board[0] == "O" && @board[1] == "O" && @board[2] == "O") || 
      (@board[3] == "O" && @board[4] == "O" && @board[5] == "O") || 
      (@board[6] == "O" && @board[7] == "O" && @board[8] == "O") || 
      (@board[0] == "O" && @board[3] == "O" && @board[6] == "O") || 
      (@board[1] == "O" && @board[4] == "O" && @board[7] == "O") || 
      (@board[2] == "O" && @board[5] == "O" && @board[8] == "O") || 
      (@board[0] == "O" && @board[4] == "O" && @board[8] == "O") || 
      (@board[2] == "O" && @board[4] == "O" && @board[6] == "O")
      return "O"
    else
      return nil
    end
    end

def play
  until over?
    turn
    draw?
    won?
  end
    if won?
      player = winner
      puts "Congratulations #{player}!"
  elsif draw?
    puts "Cats Game!"

  end
end
end