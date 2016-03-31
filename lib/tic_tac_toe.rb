class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-------------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-------------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, current_player = "X")
    @board[position - 1] = current_player
  end

  def position_taken?(position)
    (@board[position] == "X" || @board[position] == "O") ? true : false
  end

  def valid_move?(position)
    (position.to_i.between?(1,9) && !position_taken?(position.to_i - 1)) ? true : false
  end

  def turn
    puts "Please enter 1-9:"
    position = gets.chomp.to_i
    valid_move?(position) ? move(position, current_player) : turn
    display_board
  end

  def turn_count
    @board.count { |token| token == "X" || token == "O" }
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each do |combination|
      win_array = []

      combination.each do |item|
        win_array.push(@board[item])
      end

      successX = win_array.all? do |token|
        token == "X"
      end
      successO = win_array.all? do |token|
        token == "O"
      end

      if successX || successO
        return combination
      end
    end #close the WIN_COMBINATIONS each iterator
    false
  end

  def full?
    full = @board.all? { |token| token == "X" || token == "O" }
    full ? true : false
  end

  def draw?
    if won? != false
      false
    elsif full? && won? == false
      true
    else
      false
    end
  end

  def over?
    if won? != false || draw? || full?
      true
    else
      false
    end
  end

  def winner
    won? != false ? @board[won?[0]] : nil
  end

  def play
    until over?
      turn
    end

    if won? != false
      puts "Congratulations #{winner}!"
    elsif
      puts "Cats Game!"
    end
  end

end