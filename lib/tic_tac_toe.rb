class TicTacToe

  def initialize(board=Array.new(9, " "))
    @board = board
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

  def move(move_position, player_character = "X")
    spot = move_position.to_i
    spot = spot - 1
    @board[spot] = player_character 
  end

  def position_taken?(move_position)
    if @board[move_position] == "X" || @board[move_position] == "O"
      return(true)
    else
      return(false)
    end  
  end

  def valid_move?(move_position)
    if move_position.to_i > 0 && 
       move_position.to_i < 10 &&
       position_taken?(move_position.to_i-1) == false
      return(true)
    else
        return(nil)
    end
  end

  def turn
  puts "Make your move! Choose an empty spot on the board (1-9):"
  move_locale = gets.chomp
  char = current_player
  if valid_move?(move_locale)
    move(move_locale.to_i, char)
  else
    turn
  end
  display_board
end

def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|  
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]
      if position_1 == "X" && position_2 == "X" && position_3 == "X" ||
        position_1 == "O" && position_2 == "O" && position_3 == "O"
        return true      
      end      
    end    
    if 
      position_taken?(0) &&
      position_taken?(1) &&
      position_taken?(2) &&
      position_taken?(3) &&
      position_taken?(4) &&
      position_taken?(5) &&
      position_taken?(6) &&
      position_taken?(7) &&
      position_taken?(8) &&
      position_taken?(9) &&
      false
    end
  end

def full?
  !@board.include?(" ")
end

def draw?
  if !full? || won?
    false
  else
    true
  end
end

def over?
  if draw? || won?
    true
  else
    false
  end
end


def position_taken?(position)
  if @board[position] == " " || @board[position] == "" || @board[position] == nil
    return false
  else
    return true
  end
end



def winner
  if won?
    WIN_COMBINATIONS.each do |win_combination|    
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]
    
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return "X"
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return "O"
    else
      false
    end
  end
  else
    nil
  end
end

def play
until over? == true
  turn
end
if won?
  puts "Congratulations #{winner}!"
else
  puts "Cats Game!"
end
end





end
