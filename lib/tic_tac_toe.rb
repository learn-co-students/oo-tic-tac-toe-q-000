class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
  [0,1,2], [3,4,5], [6,7,8],
  [0,3,6], [1,4,7,], [2,5,8],
  [0,4,8], [6,4,2]
  ]
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, token)
    @board[position.to_i-1] = token
  end

  def position_taken?(index)
    (@board[index] == "X" || @board[index] == "O") ? true : false
#     @board[position.to_i - 1] != " " && @board[position.to_i - 1] != ""
  end

  def valid_move? (position)
    position.to_i.between?(1,9) && !position_taken?(position.to_i - 1)
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
    n = 0
    for i in 0..8
      n+=1 if position_taken?(i)
    end
    n
  end

  def current_player
    turn_count.odd? ? "O" : "X"
  end

  def won?
    WIN_COMBINATIONS.find do |comb|
      if (position_taken?(comb[0]) && comb.all? {|i| @board[i] == @board[comb[0]]})
        $win = @board[comb[0]]
        true
      end
    end
  end

  def full?
    @board.all? {|cell| cell == "X" || cell == "O"}
  end

  def draw?
    !won? && full? ? true : false
  end

  def over?
    won? || draw? ? true : false
  end

  def winner
    ($win == "X" ? "X" : "O") if won?
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
