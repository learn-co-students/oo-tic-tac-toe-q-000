class TicTacToe
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

  def move(location, player="X")
    @board[location.to_i - 1] = player
  end

  def position_taken?(position)
    if @board[position] == " " || @board[position] == "" || @board[position] == nil
      false
    else
      true
    end
  end

  def valid_move?(position)
    if position_taken?(position.to_i - 1) == true
      false
    elsif position.to_i - 1 > 9 || position.to_i - 1 < 0
      false
    else
      true
    end
  end

  def turn
    puts "Please enter 1-9:"
    position = gets.strip
    if valid_move?(position) == true
      move(position, current_player)
    else
      turn
    end
    display_board
  end

  def turn_count
    counter = 0
    @board.each do |position|
      if position == "X" || position == "O"
        counter += 1
      end
    end
    counter
  end

  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win = win_combination.all? do |position|
        @board[position] == "X"
      end
      if win
        return win_combination
      end
      win = win_combination.all? do |position|
        @board[position] == "O"
      end
      if win
        return win_combination
      end
    end
    return false
  end

  def full?
    @board.none? do |position|
      position == " " || position.nil?
    end
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw?
  end

  def winner
    if won?
      @board[won?[0]]
    end
  end


  def play
    until over? do
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end
end