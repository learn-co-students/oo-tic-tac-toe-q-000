class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  attr_reader :board

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

  def move(pos, char="X")
    @board[pos.to_i - 1] = char
  end

  def position_taken?(pos)
    [" ","", nil].none?{|x| @board[pos.to_i] == x} 
  end

  def valid_move?(pos)
    pos.to_i.between?(1,9) && !position_taken?(pos.to_i-1)
  end

  def turn
    puts "Enter a move"
    input = gets.strip.to_i
    valid_move?(input) ? move(input,current_player) : turn
    display_board
  end

  def turn_count
    @board.count("X") + @board.count("O")
  end

  def current_player
    turn_count%2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      return combo if combo.all?{|char| @board[char] == "X"} || combo.all?{|char| @board[char] == "O"}
    end
    false
  end

  def full?
    turn_count == 9
  end

  def draw?
    return true if !won? && full?
    return false if won? || ( !won? && !full? )
  end

  def over?
    won? || full? || draw?
  end

  def winner
    return nil if won? == false
    @board[won?[0]]
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