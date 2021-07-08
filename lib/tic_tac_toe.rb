class TicTacToe

  def initialize(board = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
    @board = board
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  WIN_COMBINATIONS = [
                      [0,1,2],
                      [3,4,5],
                      [6,7,8],
                      [0,4,8],
                      [6,4,2],
                      [0,3,6],
                      [1,4,7],
                      [2,5,8]
                     ]
  def move(input, symbol = "X")
    @board[input - 1] = symbol
  end

  def position_taken?(input)
    @board[input] != " " ? true : false
  end

  def valid_move?(position)
    int = position.to_i
    if int >= 1 && int <= 9
      @board[int - 1] === " " ? true : false
    end
  end

def turn
  puts "Make a move of 1 - 9"
  input = gets.chomp.to_i
  if valid_move?(input)
    move(input, current_player)
    display_board
  else
    turn
  end
end

def turn_count
  @board.select { |cell| cell != " " }.length
end

def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

def won?
   WIN_COMBINATIONS.detect do |wc|
    p1 = @board[wc[0]]
    p2 = @board[wc[1]]
    p3 = @board[wc[2]]
    if (p1 == "X" && p2 == "X" && p3 == "X") || (p1 == "O" && p2 == "O" && p3 == "O")
      return [wc[0], wc[1], wc[2]]
    end
  end
  return false
end

def full?
  @board.none? { |cell| cell == " "}
end

def draw?
  return false if won?.is_a?(Array)
  full? ? true : false
end

def over?
  draw? || won? ? true : false
end

def winner
  won? ? @board[won?[0]] : nil
end

def play
  until over?
    turn
  end
  if draw?
    puts "Cats Game!"
   else
    puts "Congratulations #{winner}!"
  end
end

end #End of Tic Tac Toe Class