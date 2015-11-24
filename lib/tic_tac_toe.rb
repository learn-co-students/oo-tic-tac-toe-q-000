class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ") # Sets board equal to 9 entries of " "
  end
    # Array of winning combinations in tic-tac-toe
  WIN_COMBINATIONS = [
    [0, 1, 2], # First row
    [3, 4, 5], # Second row
    [6, 7, 8], # Third row
    [0, 3, 6], # First column
    [1, 4, 7], # Second column
    [2, 5, 8], # Third column
    [0, 4, 8], # \ diagonal \
    [6, 4, 2]  # / diagonal /
    ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} |"
    puts "------------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} |"
    puts "------------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} |"
  end

  def move(position, player = "X")
    @board[position.to_i-1] = player
  end

  def position_taken?(position)
  @board[position.to_i] != " " && @board[position.to_i] != ""
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
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
    TicTacToe::WIN_COMBINATIONS.each do |combination|
      position_1 = @board[combination[0]]
      position_2 = @board[combination[1]]
      position_3 = @board[combination[2]]

      if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return combination
      else
        false
      end
    end
    false
  end

  def full?
    @board.detect{|entry| entry==" "}==nil ? true : false
  end

  def draw?
    won? == false && full? == true ? true : false
  end

  def over?
    won? != false || draw? == true || full? == true ? true : false
  end

  def winner
    array = won?
    if array == false
      nil
    else
      @board[array[0]] == "X" ? "X" : "O"
    end
  end

  def play
    until over? != false
      turn
    end
    if won?!= false
      puts "Congratulations #{winner}!"
    elsif draw? == true
      puts "Cats Game!"
    end
  end

end