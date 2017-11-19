class TicTacToe

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

  def initialize
    @board = Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(slot, value = "X")
    @board[slot.to_i-1] = value
  end

  def position_taken?(position)
    @board[position] == "X" or @board[position] == "O"
  end

  def valid_move?(slot)
    slot.to_i.between?(1,9) and !position_taken?(slot.to_i-1)
  end

  def turn
    puts "Please enter 1-9:"
    slot = gets.strip
    if !valid_move?(slot)
      turn
    end
    move(slot, current_player)
    display_board
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def turn_count
    counter = 0
    @board.each do |move|
      if move.include? "X" or move.include? "O"
       counter += 1
      end
    end
    counter
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] &&
      @board[combo[1]] == @board[combo[2]] &&
      position_taken?(combo[0])
    end
  end

  def full?
    @board.all?{|item| item == "X" or item == "O"}
  end

  def draw?
    full? and !won?
  end

  def over?
    full?
  end

  def winner
    winning_moves = won?
    winning_moves ?  @board[winning_moves[0]] : nil
  end

end