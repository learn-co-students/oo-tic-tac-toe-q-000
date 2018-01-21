class TicTacToe
  def initialize
    @board = Array.new(9, " ")
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
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, character = "X")
    @board[position.to_i - 1] = character
  end

  def position_taken?(position)
    !(@board[position].nil? || @board[position] == " ")
  end

  def valid_move?(position)
    position.to_i.between?(1, 9) && !position_taken?(position.to_i - 1)
  end

  def turn
    puts "Please enter 1-9:"
    position = gets.strip
    if valid_move?(position)
      move(position, current_player)
    else
      turn
    end
    display_board
  end

  def turn_count
    @board.inject(0) { |total, position| position == "X" || position == "O" ? total + 1 : total }
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def won?
    TicTacToe::WIN_COMBINATIONS.each do |combination|
      if @board[combination[0]] == "X" && @board[combination[1]] == "X" && @board[combination[2]] == "X" ||
         @board[combination[0]] == "O" && @board[combination[1]] == "O" && @board[combination[2]] == "O"
         return combination
       end
    end
    return false
  end

  def full?
    @board.all? { |position| position == "X" || position == "O" }
  end

  def draw?
    if !won? && full?
      return true
    elsif !won? && !full?
      return false
    end
  end

  def over?
    won? || draw? || full?
  end

  def winner
    @board[won?[0]] if won?
  end

  def play
    turn until over?
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end
end