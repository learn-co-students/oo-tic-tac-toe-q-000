class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def position_to_index(position)
    #position is a string from "1" to "9", output is an integer from 0 to 8
    position.to_i - 1
  end

  def move(position, current_player = "X")
    index = position_to_index(position)
    @board[index] = current_player
  end

  def position_taken?(index)
    # index:Integer in [0,8]
    !(@board[index].nil?|| @board[index] == " ")
  end

  def valid_move?(position)
    index = position_to_index(position)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count()
    turns = 0
    @board.each { |pos| if pos == "X" or pos == "O" then turns += 1 end }
    turns
  end

  def current_player()
    turn_count.even? ? "X" : "O"
  end

  def won?()
    WIN_COMBINATIONS.any? do |w|
      if position_taken?(w[0]) and
        @board[w[0]] == @board[w[1]] and @board[w[1]] == @board[w[2]] then
        return w
      end
    end
    false
  end

  def full?()
    (0..8).all? { |i| position_taken?(i) } 
  end
  
  def draw?()
    #full? and !won? # that's annoying
    !won? and full?
  end
  
  def over?()
    won? or draw? #or full? there is no full which isn't win or draw.
  end
  
  def winner()
    w = won?
    if w then @board[w[0]] end
  end 
  
  def turn()
    puts "Please enter 1-9:"
    position = gets.strip
    if valid_move?(position)
      move(position, current_player)
      display_board
    else
      turn
    end
  end

  def play()
    until over?
      turn
    end
    if draw? then
      puts "Cats Game!"
    end
    if won? then
      puts "Congratulations #{winner}!"
    end 
  end

end

=begin

def other_player(@board)
  turn_count(@board).even? ? "O" : "X"
end

=end
