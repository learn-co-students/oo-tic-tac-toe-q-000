class TicTacToe
  def initialize(board = nil)
    @board = Array.new(9," ")
  end

  def board
    @board
  end

  WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #left column
  [1,4,7], #middle column
  [2,5,8], #right column
  [0,4,8], #top left to bottom right diagonal
  [6,4,2], #bottom left to top right diagonal
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, character = "X")
    @board[position.to_i - 1] = character
  end

  def position_taken?(position)
    @board[position] == "X" || @board[position] == "O"
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !position_taken?(position.to_i - 1)
  end

  def turn_count
    turns = 0
    board.each do |space|
      if space == "X" || space == "O"
        turns += 1
      end
    end
    return turns
  end

  def current_player
    turn_count.even? ? "X" : "O"
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

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      x_wins = win_combination.all? do |indexes|
        board[indexes] == "X"
      end
      o_wins = win_combination.all? do |indexes|
        board[indexes] == "O"
      end
      if x_wins || o_wins
        return win_combination
      end
    end
    else return false
  end

  def full?
    full = board.none? do |location|
      location == " " || location == nil
    end
  end

  def draw?
    full? && !won?
  end

  def over?
    full? || won? || draw?
  end

  def winner
    if won?
        return board[won?[0]]
      else return nil
    end
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