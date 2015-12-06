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
  def move(position, value="X")
    @board[position.to_i-1] = value
  end
  def position_taken?(position)
    @board[position] == " " ? false : true
  end
  def valid_move?(position)
    position = position.to_i
    position.between?(1,9) && position_taken?(position-1) == false ? true : false
  end
  def turn
    puts "Please enter 1-9:"
    position = gets.strip
    until valid_move?(position)
      puts "Please enter 1-9:"
      position = gets.strip
      puts "Please try entering a number again:"
    end
    move(position, value=current_player)
    display_board
  end
  def turn_count
    new_b = []
    @board.select do |x|
    x != " " ? new_b << x : (nil)
    end
    return new_b.count
  end
  def current_player
    turn_count % 2 == 0 ? (return "X") : (return "O")
  end
  def won?
    @board.none? ? false : nil
    WIN_COMBINATIONS.each do |x|
      if position_taken?(x[0]) && position_taken?(x[1]) && position_taken?(x[2])
        if (@board[x[0]] == "X" && @board[x[1]] == "X" && @board[x[2]] == "X") || (@board[x[0]] == "O" && @board[x[1]] == "O" && @board[x[2]] == "O")
          return x
        end
      end
    end
    return false
  end
  def full?
    not @board.include?(" ")
  end
  def draw?
    (full?) && (not won?)
  end
  def over?
    draw? || won? || full?
  end
  def winner
    if won?
      won?.select do |x|
        @board[x] == "X" ? (return "X") : (return "O")
      end
    end
  end
  def play
    until over?
      turn
    end
    if won?
      winner == "X" ? (puts "Congratulations X!") : (puts "Congratulations O!")
    elsif draw?
      puts "Cats Game!"
    end
  end
end