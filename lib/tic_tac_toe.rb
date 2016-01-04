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
  [6,4,2]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(location, char = "X")
    @location = location
    @board[@location.to_i - 1] = char
  end

  def position_taken?(position)
    @board[position] == "X" || @board[position] == "O" ? true : false
  end

  def valid_move?(position)
    @position = (position.to_i - 1)
    !position_taken?(@position) && @position.between?(0,8) ? true : false
  end

  def turn
    puts "Enter 1-9"
    input = gets.strip
    if valid_move?(input)
      move(input, current_player)
    else
      turn
    end
  end

  def turn_count
    @count = 0
    @board.each do |pos|
      if pos == "X" || pos == "O"
        @count +=1
      else
        next
      end
    end
      @count
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.detect do |win|
      if @board[win[0]] == @board[win[1]] && @board[win[1]] == @board[win[2]] && position_taken?(win[0])
        return win
      end
    end
  end

  def full?
    @board.all? {|char| char == "X" || char == "O"} ? true : false
  end

  def draw?
    full? && !won? ? true : false
  end

  def over?
    won? || full? || draw? ? true : false
  end

  def winner
    if win = won?
      @board[win[0]]
    end
  end

  def play
    while !over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

end