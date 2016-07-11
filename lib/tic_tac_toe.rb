class TicTacToe
  WIN_COMBINATIONS = [[0, 1, 2],
                [3, 4, 5],
                [6, 7, 8],
                [0, 3, 6],
                [1, 4, 7],
                [2, 5, 8],
                [0, 4, 8],
                [2, 4, 6]]

  def initialize board = Array.new(9, ' ')
    @board = board
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(index, current_player)
    @board[index - 1] = current_player
  end

  def position_taken? index
    @board[index] != " " && @board[index] != ""
  end

  def valid_move? index
    index = input_to_index(index) - 1
    index.between?(0,8) && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index input
    if valid_move? input
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def input_to_index user_input
    user_input.to_i
  end

  def play
    until over? do
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

  def turn_count
    @board.count { |pos| pos == 'X' || pos == 'O'}
  end

  def current_player
    turn_count.even? ? 'X' : 'O'
  end

  def won?
    WIN_COMBINATIONS.each do |indexes|
      x, y, z = indexes
      if @board[x] != " " && (@board[x] == @board[y] && @board[y] == @board[z])
        return indexes
      end
    end
    false
  end

  def full?
    @board.all? { |index| index == "X" || index == "O"}
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw?
  end

  def winner
    x, y, z = won?
    @board[x] if over?
  end
end
