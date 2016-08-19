class TicTacToe
  def initialize(board = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
    @board = board
  end

  def display_board
    line = "-----------"
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts line
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts line
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

  def move(location, current_player = "X")
      @board[location.to_i - 1] = current_player
  end

  def position_taken?(location)
    if @board[location] == "X" || @board[location] == "O"
      true
    else
      false
    end
  end

  def valid_move?(location)
    place = location.to_i - 1
    if place.between?(0,8) && position_taken?(location.to_i - 1) == false
      true
    else
      false
    end
  end

 def turn
  puts "Please enter 1-9:"
  position = gets.chomp
  if valid_move?(position) then
    move(position,current_player)
    display_board
  else
    puts "Invalid move, try again"
    turn
  end
end

  def turn_count
    counter = 0
    @board.each do |space|
      if space == "X" || space == "O"
        counter += 1
      end
    end
    return counter
  end

  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end

  def won?
    WIN_COMBINATIONS.any? do |win_combo|
      @check = [@board[win_combo[0]], @board[win_combo[1]], @board[win_combo[2]]]
      if @check == ["X", "X", "X"] || @check == ["O", "O", "O"]
        true
      else
        false
      end
    end
  end

  def full?
    if turn_count == 9
      true
    elsif turn_count < 9 && won? == false
      false
    end
  end

  def draw?
    if full? == true && won? == false
      true
    else
      false
    end
  end

  def over?
    if won? == true || draw? == true
      true
    else
      false
    end
  end

  def winner
    if won? == true
      return @check[0]
    else
      nil
    end
  end

  def play
    until over?
      turn
    end
    if won? == true
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end


end