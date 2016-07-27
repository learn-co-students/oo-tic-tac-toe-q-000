class TicTacToe
  # sets a new empty board
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  # a constant defining all possible win scenarios
  WIN_COMBINATIONS = [
    [0,1,2], #top row
    [3,4,5], #middle row
    [6,7,8], #bottom row
    [0,3,6], #left column
    [1,4,7], #middle column
    [2,5,8], #right column
    [0,4,8], #left diagonal
    [2,4,6], #right diagonal
  ]

  # how the board is displayed
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  # defines a move
  def move(user_input, token = "X")
    index = user_input.to_i - 1
    @board[index] = token
  end

  # determines if a position is taken
  def position_taken?(index)
    @board[index] ==  "X" || @board[index] == "O"
  end

  # determines if a move is valid
  def valid_move?(user_input)
    index = user_input.to_i - 1
    index.between?(0, 8) && !position_taken?(index)
  end

  # runs the order of turns
  def turn
    puts "#{current_player}, please enter 1-9:"
      user_input = gets.strip
    if valid_move?(user_input)
      move(user_input, current_player)
      display_board
    else
      "invalid"
      turn
    end
  end

  # keeps track of the number of turns
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  # determines whose turn it is and what token to use
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  # determines if there is a winning scenario
  def won?
    WIN_COMBINATIONS.each do |win_combination|
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
      else
        false
      end
    end
    false
  end

  # determines if the board is full
  def full?
    @board.all? {|position| position != " "}
  end

  # determines if the game is a draw
  def draw?
    ! won? && full?
  end

  # determines if the game is over
  def over?
    won? || draw? || full?
  end

  # determines who the winner is
  def winner
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
        nil
      end
    end
    nil
  end

  # determines the order of play
  def play
    until over?
      turn
    end

    if winner == "X"
      puts "Congratulations X!"
    elsif winner == "O"
      puts "Congratulations O!"
    elsif draw?
      puts "Cats Game!"
    else
      nil
    end
  end
end
