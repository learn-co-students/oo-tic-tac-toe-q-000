class TicTacToe
  def initialize
    @board = Array.new(9, " ")
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
                        [0,3,6],
                        [1,4,7],
                        [2,5,8],
                        [0,4,8],
                        [6,4,2]
  ]

  def move(position, char)
    @board[position-1] = char
  end

  def position_taken?(position)
    !(@board[position] == " " || @board[position] == nil)
  end

  def valid_move?(position)
    if (position.to_i).between?(1,9) && position_taken?((position.to_i)-1) != true
      return true
    else
      return false
    end
  end

  def turn
    puts "Please enter 1-9"
    input = gets.chomp.to_i

    if valid_move?(input) == true
      move(input, current_player)
    else
      turn
    end
  end

def turn_count
  count = 0
  @board.each do |char|
    if char == "X" || char == "O"
      count += 1
    end
  end
  return count
end

def current_player
  if turn_count % 2 == 0
    return "X"
  else
    return "O"
  end
end

def won?
  WIN_COMBINATIONS.each do |win_combination|
    xo1 = win_combination[0]
    xo2 = win_combination[1]
    xo3 = win_combination[2]

    if (@board[xo1] == "X" && @board[xo2] == "X" && @board[xo3] == "X") ||
       (@board[xo1] == "O" && @board[xo2] == "O" && @board[xo3] == "O")
       return win_combination
    end
  end
  return false
end

def full? 
  x = @board.all? { |value| value != " " }
  return x
end

def draw?
  if !!(full? &&  !(won?))
    return true
  end
end

def over?
  if  (draw? == true || won? != false)
    return true
  end
end 

def winner
  if won? != false
    x = won?[0]
    return @board[x]
  end
end

  def play
    puts "Welcome to Tic Tac Toe!"
    display_board
    while over? != true
      turn
      display_board
    end
    if draw? == true
      puts "Cats Game!"
    else
      puts "Congratulations #{winner}!"
    end
  end
end

