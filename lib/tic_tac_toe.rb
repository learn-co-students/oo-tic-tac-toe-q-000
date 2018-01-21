class TicTacToe

 #this is a constant, not a variable bc it's all caps?
  WIN_COMBINATIONS = [
  [0, 1, 2], #top row
  [3, 4, 5], #middle row
  [6, 7, 8], #bottom row
  [0, 4, 8], #diagonal left to bottom right
  [6, 4, 2], #diagonal right to bottom left
  [0, 3, 6], #left column
  [1, 4, 7], #center column
  [2, 5, 8], #right column
]

  def initialize(board=nil)
    @board = board || Array.new(9, " ")
  end

  def display_board
    separator = "-----------"
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts separator
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts separator
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def valid_move?(position)
    position = position.to_i - 1
    position_taken?(position) == false && position.between?(0,8)
  end

  def move(position, player = "X")
    position = position.to_i - 1
    @board[position] = current_player
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
      move(input)
      display_board
    else
      turn
    end
  end

  def turn_count
    @board.count {|x| x == "X" || x == "O" }
  end

  def position_taken?(position)
     !(@board[position] == " " || @board[position] == nil)
  end

  def current_player
    if turn_count.even? 
      return "X" 
    else
      "O"
    end
  end

  def won?
    won_or_not = false
    WIN_COMBINATIONS.each do |combo|
      first = combo[0]
      second = combo[1]
      third = combo[2]
      if @board[first] == "X" && @board[second] == "X" && @board[third] == "X"
        return combo
      elsif @board[first] == "O" && @board[second] == "O" && @board[third] == "O"
        return combo
      end
    end
    won_or_not
  end

  def full?
    @board.all? {|x| x != " "}
  end

  def draw?
    won? == false && full?
  end

  def over?
    won? || full? || draw?
  end

  def winner
    #won? basically gives you combo EX:[1,2,3]
    if won?
      position = won? 
      index = position[0]
      return @board[index]
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
