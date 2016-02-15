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
    @board = Array.new(9) { ' ' }
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, value='X')
    position = position.to_i
    @board[position - 1] = value if @board[position - 1] == ' '
  end

  def position_taken?(location)
    !(@board[location].nil? || @board[location] == " ")
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    valid_move?(input) ? move(input, current_player) : turn
    display_board
  end

  def turn_count
    @board.count('X') + @board.count('O')
  end

  def current_player
    turn_count.even? ? 'X' : 'O'
  end

  def won?
    empty = @board.all? { |value| value == ' ' }
    win = WIN_COMBINATIONS.find do |group|
      @board[group[0]] == @board[group[1]] &&
      @board[group[0]] == @board[group[2]] &&
      position_taken?(group[0])
    end
    empty == true || win.nil? ? false : win
  end

  def full?
    @board.all? { |value| value == 'X' || value == 'O' }
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    won? ? @board[won?[0]] : nil
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