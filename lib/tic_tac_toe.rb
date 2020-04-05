class TicTacToe
  attr_accessor :board
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]
  def initialize
    @board = Array.new(9, " ")
  end

  def display_board
    puts " #{board[0]} | #{board[1]} | #{board[2]}    "
    puts "----------- "
    puts " #{board[3]} | #{board[4]} | #{board[5]}    "
    puts "----------- "
    puts " #{board[6]} | #{board[7]} | #{board[8]}    "
  end

def move(position, current_player)
  board[position.to_i - 1] = current_player
    board
  end

  def play
    while !over? && !draw?
      turn
    end
    puts "Congratulations #{winner}!" if winner
    puts "Cats Game!" if draw?
  end

  def over?
    return false unless won? || full?
    return true
  end

  def position_taken?(position)
    return false if [nil, "", " "].include?(board[position])
    return true if board[position] == "X" || board[position] == "O"
  end

  def valid_move?(move)
    if (1..9).to_a.include?(move.to_i)
      return true if board[move.to_i - 1] == " "
    else
      return false
    end
  end

  def turn
    begin
      puts "Please enter 1-9:"
      input = gets.strip
    end until valid_move?(input)
    move(input, current_player)
    display_board
  end

  def turn_count
    board.select {|position| position != " "}.count
  end

  def current_player
    return "X" if turn_count % 2 == 0
    return "O" if turn_count % 2 != 0
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      return combo if combo.all? {|position| board[position] == 'X'}
      return combo if combo.all? {|position| board[position] == 'O'}
    end
    return false if board.all? { |position| position != " "}
    return false if board.all? { |position| position == " "}
  end

  def full?
    return true if board.none? {|position| position == " "}
  end

  def draw?
    return false unless full? && !won?
    return true unless won?
  end

  def winner
    return nil unless won?
    return 'X' if board[won?[0]] == 'X'
    return 'O' if board[won?[0]] == 'O'
  end

  def play
    while !over? && !draw?
      turn
    end
    puts "Congratulations #{winner}!" if winner
    puts "Cats Game!" if draw?
  end
end