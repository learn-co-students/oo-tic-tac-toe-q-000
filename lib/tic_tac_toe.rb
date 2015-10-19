class TicTacToe
  WIN_COMBINATIONS = [
  [0,1,2], #Top row
  [3,4,5], #Middle row
  [6,7,8], #Bottom row
  [0,3,6], #left column
  [1,4,7], #Middle Column
  [2,5,8], #Right COlumn
  [0,4,8], #Diagonal 1
  [6,4,2]  #Diagonal 2
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

  def move(position, char="X")
    @board[position.to_i-1] = char
  end

  def position_taken?(location)
    !(@board[location].nil? || @board[location] == " ")
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
  end

  def turn_count
    turns = 0
    @board.each do |pos|
      if pos == "X" || pos == "O"
        turns += 1
      end
    end
    turns
  end

  def current_player
    played = turn_count
    if played % 2 == 0
      return "X"
    else
      return "O"
    end
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


  def full?
    return (position_taken?(0) && position_taken?(1) && position_taken?(2) && position_taken?(3) && position_taken?(4) && position_taken?(5) && position_taken?(6) && position_taken?(7) && position_taken?(8))
  end

  def empty?
    return (!position_taken?(0) && !position_taken?(1) && !position_taken?(2) && !position_taken?(3) && !position_taken?(4) && !position_taken?(5) && !position_taken?(6) && !position_taken?(7) && !position_taken?(8))
  end

  def won?
    if empty?
      return false
    end

    WIN_COMBINATIONS.each do |entry|
      positions_taken = (position_taken?(entry[0]))
      positions_equal = ((@board[entry[0]] == @board[entry[1]]) && (@board[entry[1]] == @board[entry[2]]))
      if (positions_taken && positions_equal)
        return entry
      end
    end
    return false
  end


  def draw?
    return (full? == true && won? == false)
  end

  def over?
    return (won? || draw? || full?)
  end

  def winner
    w = won?
    if w == false
      return nil
    end
    return @board[w[1]]
  end

  def play
    while over? == false
      turn
    end
    if won? != false
      char = winner
      puts "Congratulations #{char}!"
    end
    if draw? == true
      puts "Cats Game!"
    end
  end

end
