class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def board
    @board
  end

  def board=(new_board)
    @board = new_board
  end

  # Define your WIN_COMBINATIONS constant
  WIN_COMBINATIONS  = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]
  #method that prints the current board representation based on the board argument passed to the method.
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

#oo move
  def move(position, character="X")
    @board[position.to_i-1] = character
  end

  def input_to_index(user_input)
    user_input.to_i
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(position)
    (position.to_i-1).between?(0, 8) &&
    !position_taken?(position.to_i-1)
  end

  def turn
    puts "Please enter a location 1-9: 1 is the top left position, 9 is the bottom right."
    user_input = gets.strip
    until valid_move?(user_input) == true
      puts "dumbass...learn how to count! Use an empty location 1 through 9"
      puts "Please enter 1-9:"
      user_input = gets.strip
    end
    move(user_input, current_player)
    display_board
  end

#OO turn count
  def turn_count
    @board.count {|player| player == "X" || player == "O"}
  end

#oo current_player
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.detect do |win_index|
      @board[win_index[0]] == @board[win_index[1]] &&
      @board[win_index[1]] == @board[win_index[2]] &&
      position_taken?(win_index[0])
    end
  end

  def full?
    @board.all? do |position|
      position == "X" || position =="O"
    end
  end

  def draw?
    !won? && @board.all? {|position| position == "X" || position == "O"}
  end

  def over?
    won? || draw?
  end

  def winner
    if win_index = won?
    @board[win_index.first]
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
