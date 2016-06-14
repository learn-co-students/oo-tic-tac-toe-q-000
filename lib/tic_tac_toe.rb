class TicTacToe
def initialize (board = nil)
  @board = board || Array.new(9, " ")
end

  WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6],
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(user_input, current_player = "X")
    @board[user_input.to_i - 1] = current_player
  end

  def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end

def valid_move?(index)
    if index.to_i.between?(1, 9) && (@board[index.to_i - 1] == " " || @board[index.to_i - 1] == "" || @board[index.to_i - 1] == nil)
      return true
  else
    return false
  end
end

  def turn
    puts "Please enter 1-9:"
    input = gets
    if valid_move?(input) == true
      move(input, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    counter = 0
    @board.each do |i|
      if i == "X" || i == "O"
        counter += 1
      end
    end
    return counter
  end

  def current_player
    if turn_count % 2 == 0 || turn_count.even? == true # it's all even
      return  "X"
    else
      return  "O"
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      win_combination.all? {|i| @board[i] == "X"} || win_combination.all?{|i| @board[i] == "O"}
    end
  end

  def full?
    if @board.all? { |i| (i == "X" || i == "O") }
      return true
    end
  end

  def draw?
    if !won? && full?
      return true
    else !won? && !full? && won?
    return false
    end
  end

  def over?
    if won?
      return true
    elsif draw?
      return true
    else
      return false
    end
  end

  def winner
    if won?
      return @board[won?[0]]
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else draw?
    puts "Cats Game!"
    end
  end

end
