class TicTacToe
  WIN_COMBINATIONS = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]
  ]

  def initialize(board = nil)
    @board = board || Array.new(9, ' ')
    
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def position_to_index(position)
    position.to_i - 1
  end

  def move(position, token="X")
    @board[position_to_index(position)] = token
  end

  def position_taken?(position)
    !(@board[position] == ' ')
  end

  def valid_move?(position)
    position = position_to_index(position)
    return position.between?(0, @board.length) && !position_taken?(position)
  end

  def turn
    print "Enter a position: "
    position = gets.chomp
    if valid_move?(position)
      move(position, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    @board.length - @board.count(' ')
  end

  def current_player
    turn_count.even? ? 'X' : 'O'
  end

  def won?
    WIN_COMBINATIONS.each do |row|
      first = @board[row[0]]
      win = row.all? do |i|
        position_taken?(i) && @board[i] == first
      end
      if win
        return true
      end
    end
    return false
  end

  def full?
    @board.all? do |x|
      ['X', 'O'].include?(x)
    end
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw? || full?
  end

  def winner
    if !won?
      return nil
    end
    @board.count('X') > @board.count('O') ? 'X' : 'O'
  end

  def play
    until over?
      turn
    end
    puts won? ? "Congratulations #{winner}!" : "Cats Game!"
  end

end