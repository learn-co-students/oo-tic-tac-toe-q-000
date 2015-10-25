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

  def initialize(board=nil)
    @board = board || Array.new(9, " ")
  end

  def board
    @board
  end

  def display_board
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def move(pos, char='X')
    board[pos.to_i-1] = char
  end

  def position_taken?(location)
    !(board[location].nil? || board[location] == " ")
  end

  def valid_move?(pos)
    !position_taken?(pos.to_i - 1) && (1..9).include?(pos.to_i)
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    board.select {|c| c != " "}.count
  end

  def turn
    puts "Please enter 1-9:"
    pos = gets.strip

    if valid_move?(pos)
      move(pos, current_player)
      display_board
    else
      turn
    end
  end

  def won?
    winning_combo = nil

    WIN_COMBINATIONS.each do |combo|
      winning_combo = combo if combo.all? {|c| board[c] == "X"} || combo.all? {|c| board[c] == "O"}
    end

    winning_combo
  end

  def full?
    board.all? {|p| p != " " && !!p}
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    if winning_combo = won?
      board[winning_combo.first]
    end
  end

  def play
    while !over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end
end