class TicTacToe
  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],

  [0,3,6], #verticals
  [1,4,7],
  [2,5,8],

  [0,4,8], #diagonals
  [6,4,2]
  ]

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
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
    !(@board[location].nil? || @board[location] == " ")
  end

  def position_taken2?(item)
    !(item.nil? || item == " ")
  end

  def character_check(location, character)
    @board[location] == character
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
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
      return "X"
    else
      return "O"
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      if combo.all?{|i| character_check(i, "X")} || combo.all?{|i| character_check(i, "O")}
        return combo
      end
    end
    return false
  end

  def full?
    @board.all? do |i|
      position_taken2?(i)
    end
  end

  def draw?
    if !won? && full?
      return true
    elsif !won? && !full?
      return false
    elsif won?
      return false
    end
  end

  def over?
    if won? || draw?
      return true
    else
      return false
    end
  end

  def winner
    result = won?
    if result == false
      return nil
    else
      return @board[result[0]]
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