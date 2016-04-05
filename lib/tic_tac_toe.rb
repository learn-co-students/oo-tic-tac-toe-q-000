class TicTacToe
  def initialize
    @board = []
    for i in 0..8
      @board[i] = " "
    end
  end

  WIN_COMBINATIONS = [
    [0,1,2], # top row
    [0,3,6], # first column
    [0,4,8], # down diagonal
    [1,4,7], # middle column
    [6,4,2], # up diagonal
    [2,5,8], # last column
    [3,4,5], # middle row
    [6,7,8]  # bottom row
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(location, current_player = "X")
    @board[location.to_i-1] = current_player
  end

  def position_taken?(location)
    !(@board[location].nil? || @board[location] == " ")
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
  end

  def turn
    puts "#{current_player}'s turn. Please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
      move(input, current_player)
    else
      turn
    end
    display_board
  end

  def turn_count
    which_turn = 0
    @board.each do |loc|
      if loc == "X" || loc == "O"
        which_turn += 1
      end
    end
    which_turn 
  end

  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1] # load the value of the board at win_index_1
      position_2 = @board[win_index_2] # load the value of the board at win_index_2
      position_3 = @board[win_index_3] # load the value of the board at win_index_3

      x_win = position_1 == "X" && position_2 == "X" && position_3 =="X"
      o_win = position_1 == "O" && position_2 == "O" && position_3 =="O"

      x_win || o_win
    end
  end

  def full?
    @board.none? do |location|
      location == " " || location == "" || location == nil
    end
  end

  def draw?
    won? == nil && full?
  end

  def over?
    won? || full?
  end

  def winner
    if won?
      if @board[won?[0]] == "X"
        "X"
      else
        "O"
      end
    else
      nil
    end
  end

  def play
    puts "Welcome to Tic Tac Toe!"
    until over?
      # take turns
      turn
      if draw?
        break
      end
    end

    if won?
      # congratulate the winner
      puts "Congratulations #{winner}!"
    elsif draw?
      # tell the players it has been a draw
      puts "Cats Game!"
    end
  end
end