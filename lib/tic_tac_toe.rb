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
    [0, 1, 2], #top row
    [3, 4, 5], #middle row
    [6, 7, 8], #bottom row
    [0, 3, 6], #left column
    [1, 4, 7], #middle column
    [2, 5, 8], #right column
    [0, 4, 8], #downward diagonal
    [6, 4, 2]  #upward diagonal
  ]

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
    input = gets.strip
    if valid_move?(input)
      move(input, current_player)
    else
      turn
    end
    display_board
  end

  def turn_count
    count = 0
    @board.each do |b|
      if b != " "
        count += 1
      end
    end
    count
  end

  def current_player
    player = turn_count
    if player.even?
      player = "X"
    else
      player = "O"
    end
    player
  end

  def won?
    array = []
    WIN_COMBINATIONS.each do |win_comb|
    if @board[win_comb[0]] == "X" && @board[win_comb[1]] == "X" && @board[win_comb[2]] == "X"
      array = win_comb
      break
    elsif @board[win_comb[0]] == "O" && @board[win_comb[1]] == "O" && @board[win_comb[2]] == "O"
      array = win_comb
      break
    else
      array = false
    end
  end
    array
  end

  def full?
    @board.all?{ |token| token == "X" || token == "O"}
  end

  def draw?
    if won? == false && full? == true
      true
    end
  end

  def over?
    if won? || draw? == true
      true
    end
  end

  def winner
    if win_comb = won?
      @board[win_comb.first]
    end
  end

  def play
    until over?
      turn
    end
    if draw?
      puts "Cats Game!"
    else
      puts "Congratulations #{winner}!"
  end
end
end