class TicTacToe

  WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 4, 8],
  [6, 4, 2],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8]
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

  def move(position, player="X")
    @board[position.to_i-1] = player
  end

  def position_taken?(position)
    @board[position] != " " && @board[position] != ""
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
  end

  def turn
    puts "Please enter 1-9:"
    position = gets.chomp
    if valid_move?(position)
      move(position, current_player)
    else
      turn
    end
    display_board
  end

  def turn_count
    @board.count { |position| position == "X" || position == "O" }
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end  

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      board_values = Array.new
      win_combination.each { |location| board_values.push(@board[location]) }
      return win_combination if board_values.all? { |value| value == "O" }
      return win_combination if board_values.all? { |value| value == "X" }
    end
    false
  end

  def full?
    @board.all? { |value| value == "O" || value == "X" }
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    won? ? @board[won?[0]] : nil
  end

  def play
    while !over?
      turn
    end
    puts winner ?  "Congratulations #{winner}!" : "Cats Game!"
  end

end