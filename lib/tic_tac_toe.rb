class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [1, 4, 7],
    [2, 5, 8],
    [0, 3, 6],
    [0, 4, 8],
    [6, 4, 2]
  ]
def play
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    else
      until over?
        turn
        if won?
          puts "Congratulations #{winner}!"
        elsif draw?
          puts "Cats Game!"
        end
      end
    end
end

def display_board
      puts " #{@board[0]} " + "| #{@board[1]} |" + " #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} " + "| #{@board[4]} |" + " #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} " + "| #{@board[7]} |" + " #{@board[8]} "
end

def move(input, character = "X")
  input = input.to_i
  @board[(input - 1)] = character
  return @board
end

def position_taken?(position)
  if @board[position] == " " || @board[position] == "" || @board[position] == nil
     return false
  else @board[position] == "X" || @board[position] == "O"
     return true
  end
end

def valid_move?(position)
  position = position.to_i
  position = position - 1
  if position.between?(0, 10) && position_taken?(position) != true
    return true
  else
    return false
  end
end

def turn
  puts "Please enter 1-9:"
  position = gets.chomp
  if valid_move?(position) == false
    puts "Please go again"
    position = gets.chomp
  else
    position = position.to_i
    position = position - 1
    @board[position] = current_player
    puts display_board
  end
end

def turn_count
  @board.count {|token| token == "X" || token == "O"}
end

def current_player
  turn_count % 2 == 0? "X" : "O"
end

def won?

  WIN_COMBINATIONS.find do | win_combination |

    win_index_1 = win_combination[0] # 0, 3
    win_index_2 = win_combination[1] # 1, 4
    win_index_3 = win_combination[2]

    sign_1 = @board[win_index_1] # X
    sign_2 = @board[win_index_2] # O ETC
    sign_3 = @board[win_index_3]

    if sign_1 == sign_2 && sign_2 == sign_3 && sign_1 != " "
      return win_combination
    else
      false
    end
  end
end

def full?
  @board.none? {|space| space == " "}
end

def draw?
  if full? && !won?
    return true
  else
    return false
  end
end

def over?
  won? || draw?
end

def winner
  win_combination = won?
  if win_combination
    win_index = win_combination[0]
    @board[win_index]
  end
end

end
