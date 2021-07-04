class TicTacToe

  def initialize(board = Array.new(9, " "))
    @board = board
  end

  def welcome
    puts "Welcome to Tic Tac Toe!"
  end

  def display_board
    line1 = " #{@board[0]} | #{@board[1]} | #{@board[2] } "
    divide = '-' * 11
    line2 = " #{@board[3]} | #{@board[4]} | #{@board[5] } "
    line3 = " #{@board[6]} | #{@board[7]} | #{@board[8] } "
    puts line1, divide, line2, divide, line3
  end

  def turn_count
    count = 0
    @board.each do |position|
      if position != "" && position != " " && position != nil
        count +=1
      end
    end
    return count
  end

  def current_player
    counted = turn_count
    (counted == 0 ||counted % 2 == 0)? "X" : "O"
  end

  def move(location, current_player = current_player)
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
      move(input)
    else
      turn
    end
    display_board
    end

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,4,8],  # Top left diagonal
  [6,4,2],  # Top right diagonal
  [0,3,6],  # first column
  [1,4,7],  # middle column
  [2,5,8]  # last column
  ]

  def won?
    WIN_COMBINATIONS.detect do |line|
      line.all?{|i| @board[i] == "X" } || line.all?{|i| @board[i] == "O"}
    end
  end

  def full?
    @board.all?{|position| position == "X" || position == "O"}
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw?
  end

  def winner
    if won?
    line = won?
    @board[line[0]]
    end
  end

  def play
    welcome
    display_board
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cats Game!"
    end
  end
end
