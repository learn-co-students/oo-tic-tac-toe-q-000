class TicTacToe

  def initialize(board = nil)
    @board = board || [" "," "," "," "," "," "," "," "," "]
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

  def move(position, char="X")
    position = position.to_i - 1
    @board[position] = char
  end

  def position_taken?(location)
    !(@board[location].nil? || @board[location] == " ")
  end

  def valid_move?(position)
    position = position.to_i - 1
    if position < 0 || position > 8
      false
    elsif @board[position] == "X" || @board[position] == "O"
      false
    else
      true
    end
  end

  def turn_count
    turns_played = 0
    @board.each do |cell|
      turns_played += 1 if cell == "X" || cell == "O"
    end
    turns_played
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    cell = gets.strip
    if valid_move?(cell)
      move(cell, current_player)
      display_board
    else
      turn
    end
  end

  def won?
    indexes = Array.new
    if WIN_COMBINATIONS.any? do |combo|
        indexes = combo
        (@board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X") \
        || (@board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O")
      end
      indexes
    else
      false
    end
  end

  def full?
    @board.none? { |cell| (cell == " " || cell == "" || cell.nil?) }
  end

  def draw?
    full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    won? ? @board[won?[0]] : nil
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
