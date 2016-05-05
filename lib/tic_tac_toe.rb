class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  TicTacToe::WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
    ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(input, current_player)
    @board[input.to_i - 1] = current_player
  end

  def position_taken?(input)
    @board[input.to_i] != " " && @board[input.to_i] != ""
  end

  def valid_move?(input)
    (input.to_i - 1).between?(0,8) && !position_taken?(input.to_i - 1)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
      move(input, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.detect do |win_conbination|
      win_index_1 = win_conbination[0]
      win_index_2 = win_conbination[1]
      win_index_3 = win_conbination[2]
      @board[win_index_1] == @board[win_index_2] && @board[win_index_2] == @board[win_index_3] && @board[win_index_1] != " "
    end
  end

  def full?
    @board.none? {|position| position == " "}
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw?
  end

  def winner
    win_conbination = won?
    if win_conbination != nil
      winning_location = win_conbination[0]
      @board[winning_location]
    else
      nil
    end
  end

  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    else draw?
      puts "Cats Game!"
    end
  end

end
