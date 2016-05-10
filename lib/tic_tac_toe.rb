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
    i = 0
    until i == 9
      turn(board)
      i += 1
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

def position_taken?(board, position)
  if @board[position] == " " || @board[position] == "" || @board[position] == nil
     return false
  else @board[position] == "X" || @board[position] == "O"
     return true
  end
end

def valid_move?(board, position)
  position = position.to_i
  position = position - 1
  if position.between?(0, 10) && position_taken?(board, position) != true
    return true
  else
    return false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  position = gets.chomp
  if valid_move?(board, position) == false
    puts "Please go again"
    puts turn(board)
  else
    position = position.to_i
    position = position - 1
    board[position] = "X"
    puts display_board(board)
  end
end

def turn_count(board)
  board.count {|space| space == "X" || space == "O"}
end

def current_player(board)
  turn_count % 2 == 0? "X" : "O"
end

def won?(board)

  WIN_COMBINATIONS.find do | win_combination |

    win_index_1 = win_combination[0] # 0, 3
    win_index_2 = win_combination[1] # 1, 4
    win_index_3 = win_combination[2]

    sign_1 = board[win_index_1] # X
    sign_2 = board[win_index_2] # O ETC
    sign_3 = board[win_index_3]

    if sign_1 == sign_2 && sign_2 == sign_3 && sign_1 != " "
      return win_combination
    else
      false
    end
  end
end

def full?(board)
  board.none? {|space| space == " "}
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  else
    return false
  end
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  win_combination = won?(board)
  if win_combination
    win_index = win_combination[0]
    board[win_index]
  end
end



end
