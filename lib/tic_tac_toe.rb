class TicTacToe
  def initialize
    @board =  Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  WIN_COMBINATIONS=[
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]]

  def move (location, player = "X")

    @board[location.to_i-1] = player

  end

   def position_taken?(location)
    !(@board[location].nil? || @board[location] == " ")
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !position_taken?( position.to_i-1)
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

    def turn_count
  counter = 0
  @board.each do |turn|
    if turn == "X" || turn == "O"
      counter += 1
    end
  end
    counter
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

    def won?

    WIN_COMBINATIONS.detect do |win|
    if position_taken?(win[0]) && position_taken?(win[1]) && position_taken?(win[2]) && @board[win[0]] ==
      @board[win[1]] && @board[win[0]] == @board[win[2]]
      [win[0],win[1], win[2]]
    end
    end
  end

    def full?
    unless @board.include?(" ")
      return true
    end
  end

    def draw?
    if full? && !won?
      true
    end
  end

  def over?
    if won? || draw?
      true
    end
  end

  def winner
    if win = won?
      return @board[win[0]]
    else
       nil
    end
  end

  def play

  until over?
    turn

  end

  if won?
    winner
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cats Game!"
  end
end
end