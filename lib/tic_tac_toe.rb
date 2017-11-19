class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
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

  def move(location, player = "X")
    @board[location.to_i-1] = player
  end

  def position_taken?(location)
    !(@board[location].nil? || @board[location] == " ")
  end

  def valid_move?(location)
    location.to_i.between?(1,9) && !position_taken?(location.to_i-1)
  end

  def turn
    puts "Please enter 1-9:"
    location = gets.strip
    if !valid_move?(location)
      turn
    end
    move(location, current_player)
    display_board
  end

  def turn_count
    counter = 0
    @board.each do |player|
      if player == "X" || player == "O"
        counter += 1
      end
    end
    counter
  end

  def current_player
    if turn_count.even?
     return "X"
    else
     return "O"
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] &&
      @board[combo[1]] == @board[combo[2]] &&
      position_taken?(combo[0])
    end
  end

  def full?
    @board.all?{|token| token == "X" || token == "O"}
  end

  def draw?
   full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    if winning_combo = won?
      @board[winning_combo.first]
    end
  end

  def play
    while !over?
      turn_count
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end
end