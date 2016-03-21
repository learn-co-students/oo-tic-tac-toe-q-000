class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [6, 4, 2],
  [0, 4, 8]
]
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

  def turn
    puts "Please enter 1-9:"
    position = gets.strip
      if valid_move?(position) == true

        char = current_player

        move(position, char)
        display_board
      else
        turn
      end
  end

  def turn_count
    counter = 0
    @board.each do |spots|
    if spots == "X" || spots == "O"
      counter += 1
    end
    end
    return counter
  end

  def current_player
    x_id = "X"
    o_id = "O"
    if turn_count == 0
      return x_id
    elsif turn_count % 2 == 0
      return x_id
    else
      return o_id
    end
  end

  def won?
    WIN_COMBINATIONS.each do |first|
      win_index_1 = first[0]
      win_index_2 = first[1]
      win_index_3 = first[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
        winarray = Array.new
        winarray << win_index_1 << win_index_2 << win_index_3
        return true
      end
    end
    return false
  end

  def full?
    @board.all? do |spot|
      spot == "X" || spot == "O"
    end
  end

  def draw?
    if won? == false && full? == true
      return true
    elsif won? == false && full? == false
      return false
    elsif won? == true
      return false
    end
  end

def over?
  if won? == true || full? == true || draw? == true
    return true
  else
    return false
  end

end

  def winner
    x_item = 0
    o_item = 0
    @board.select do |spots|
      if spots == "X"
        x_item += 1
      elsif spots == "O"
        o_item += 1
      end
    end
    if x_item > o_item
      return "X"
    elsif o_item > x_item
      return "O"
    end
  end

  def play
    if won? == false
      while over? != true
        turn
      end
    end

    if draw? == true
      puts "Cats Game!"
    end

    win = winner
    puts "Congratulations #{win}!"

  end


end