class TicTacToe

  def initialize(board = Array.new(9, " "))
    @board = board
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


  def move(position, char = "X")
    position_in_array = position.to_i - 1
    @board[position_in_array] = char
  end

  def position_taken?(position)
    position_i = position.to_i
    @board[position_i] == "X" || @board[position_i] == "O"
  end

  def valid_move?(position)
    position_ii = position.to_i
    position_taken?(position_ii - 1) == false && position_ii.between?(1,9)
  end

  def turn
    puts "Please enter 1-9:"
    position = gets.strip
    if valid_move?(position) && current_player == "X"
      move(position, char = "X")
    elsif valid_move?(position) && current_player == "O"
      move(position, char = "O")
    else
      turn
    end
    display_board
  end

  def turn_count
  player_turns = 0
    @board.each do |array_index|
      if array_index == "X" || array_index == "O"
        player_turns += 1
      else
        player_turns += 0
      end
    end
    player_turns
  end

  def current_player
    if turn_count % 2 == 0
      return "X"
    elsif turn_count % 2 != 0
      return "O"
    end
  end

  def won?
  winner = false
  WIN_COMBINATIONS.each do |combination|
    if @board[combination[0]] == "X" && @board[combination[1]] == "X" && @board[combination[2]] == "X"
      winner = combination
    elsif @board[combination[0]] == "O" && @board[combination[1]] == "O" && @board[combination[2]] == "O"
      winner = combination
    end
  end
  winner
  end

  def full?
    @board.all? do |index|
      index == "X" || index == "O"
    end
  end

  def draw?
    draw = false
    if full? && won? == false
      draw = true
    end
    draw
  end

  def over?
    over = false
    if full? || won? || draw?
      over = true
    end
    over
  end

  def winner
    winning_player = nil
    WIN_COMBINATIONS.each do |combination|
      if @board[combination[0]] == "X" && @board[combination[1]] == "X" && @board[combination[2]] == "X"
        winning_player = "X"
      elsif @board[combination[0]] == "O" && @board[combination[1]] == "O" && @board[combination[2]] == "O"
        winning_player = "O"
      end
    end
    winning_player
  end

  def play
    while won? == false && full? == false && draw? == false && over? == false
      turn
    end
    if draw?
      puts "Cats Game!"
    end
    if won? && winner == "X"
      puts "Congratulations X!"
    elsif won? && winner == "O"
      puts "Congratulations O!"
    end
  end

end