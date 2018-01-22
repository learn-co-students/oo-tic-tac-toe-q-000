class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2],
    ]

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

#   def board
#     @board
#   end

#   def position
#     position = @input - 1
#   end



  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, current_player = "X")
    @board[position - 1] = current_player
  end

  def position_taken?(position)
    @board[position] != " " && @board[position] != ""
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !position_taken?(position.to_i - 1)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip.to_i
    if valid_move?(input)
      move(input, current_player)
    else
      turn
    end
    display_board
  end

  def turn_count
    count = 0
    @board.each {|spot| count += 1 if (spot == "O" || spot == "X")}
    return count
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.any? do |win_combination|
      if win_combination.all? {|pos| @board[pos] == "X"} || win_combination.all? {|pos| @board[pos] == "O"}
        return win_combination
      else
        false
      end
    end
  end

  def full?
    (0..8).to_a.all? {|pos| position_taken?(pos)}
  end

  def draw?
    full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    @board[won?[0]] if won?
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
