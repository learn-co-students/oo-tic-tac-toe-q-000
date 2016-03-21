class TicTacToe
  WIN_COMBINATIONS = [[0, 1, 2], # top row
                      [3, 4, 5], # middle row
                      [6, 7, 8], # bottom row
                      [0, 3, 6], # left column
                      [1, 4, 7], # middle column
                      [2, 5, 8], # right column
                      [0, 4, 8], # diagonal top left
                      [6, 4, 2]] # diagonal top right

  def initialize(board=nil)
    @board = board || Array.new(9, " ")
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

  def turn_count
    @board.count { |element| element == "X" || element == "O" }
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
      move(input, current_player)
    else
      turn
    end
    display_board
  end

  def won?
    WIN_COMBINATIONS.each do |win_condition|
      win_index_1 = win_condition[0]
      win_index_2 = win_condition[1]
      win_index_3 = win_condition[2]

      board_index_1 = @board[win_index_1]
      board_index_2 = @board[win_index_2]
      board_index_3 = @board[win_index_3]

      if (board_index_1 == "X" && board_index_2 == "X" && board_index_3 == "X") || (board_index_1 == "O" && board_index_2 == "O" && board_index_3 == "O")
        return win_condition
      end
    end
    return false
  end

  def full?
    @board.none? { |element| !position_taken?(@board.index(element)) }
  end

  def draw?
    full? && !won? ? true : false
  end

  def over?
    full? || won? || draw? ? true : false
  end

  def winner
    winning_combo = won?

    over? ? @board[winning_combo[0]] : nil
  end

  def play
    while !over? do
      turn
    end
    if won?
      puts "Congratulations #{winner}!"

    else
      puts "Cats Game!"
    end
  end
end

# ttt = TicTacToe.new()
# ttt.display_board
# puts TicTacToe::WIN_COMBINATIONS.size
