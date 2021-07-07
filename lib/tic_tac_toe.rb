class TicTacToe
  def initialize(board=nil)
    @board = board || Array.new(9, " ")
    display_board
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

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
  def move(position, player)
    @board[position-1] = player
  end

  def position_taken?(position)
    if @board[position] == 'O' || @board[position] == 'X'
      true
    else
      false
    end
  end

  def valid_move?(position)
    if !position_taken?(position.to_i-1) && position.to_i > 0 && position.to_i < 10
      true
    else
      false
    end
  end

  def turn
    puts "Please enter 1-9"
    current_move = gets.strip
    if valid_move?(current_move)
      move(current_move.to_i, current_player)
    else
      turn
    end
    display_board
  end

  def turn_count
    @board.count{|token| token == 'X' || token == 'O'}
  end

  #returns 'X' if there's an even number of turns 'X' if odd
  def current_player
    turn_count % 2 == 0 ? 'X' : 'O'
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      x_wins = win_combination.all? do |index|
        @board[index] == 'X'
      end

      o_wins = win_combination.all? do |index|
        @board[index] == 'O'
      end

      if x_wins || o_wins
        return win_combination
      end
    end
    nil
  end

  def full?
    @board.none? do |space|
      space == ' ' || space == '' || space == nil
    end
  end

  def draw?
    full? && !won? ? true : false
  end

  def over?
    won? || draw? ? true : false
  end

  def winner
    if won?
      @board[won?[0]]
    end
  end

  def play
    while !over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cats Game!"
    end

  end
end