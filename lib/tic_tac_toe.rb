require 'pry'
class TicTacToe
  # Define your WIN_COMBINATIONS constant
 WIN_COMBINATIONS = [
   [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6],
   [1, 4, 7], [2, 5, 8], [0, 4, 8], [6, 4, 2]
  ]

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

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
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
  end

  def turn
  puts "Please enter 1-9:"
  position = gets.strip
  if valid_move?(position)
    marker = current_player
    move(position, marker)
  else
    turn
  end
    display_board
  end

  def won?
    WIN_COMBINATIONS.each do |row|
      return row if row.all? {|i| @board[i] == "X"} || row.all? {|i| @board[i] == "O"}
    end
    return false
  end

  def full?
    @board.each {|e| return false if e ==" " or e == "" }
    true
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    win_row = won?
    return @board[win_row[0]] if win_row
  end

  # Define your play method below
  def play
    while !over?
      #binding.pry
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cats Game!"
    end
  end
end