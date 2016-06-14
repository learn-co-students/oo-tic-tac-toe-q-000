require 'pry'
class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end

    WIN_COMBINATIONS = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]
    ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(index, current_player = "X")
    index = index.to_i
    @board[index-1] = current_player
  end

  def position_taken?(location)
    if @board[location] != " " && @board[location] != ""
      true
    else
      false
    end
  end

  def valid_move?(index)
    position = index.to_i - 1
    if position.between?(0,8) && !position_taken?(position)
      true
    else
      false
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
      move(input, current_player)
      display_board
    else
      puts "Not a valid move"
      turn
    end
  end

  def turn_count
    @board.count{|x| x if x == "X" || x == "O"}
  end

  def current_player
    if turn_count.even?
      "X"
    else
      "O"
    end
  end

  def won?
    if WIN_COMBINATIONS.detect do |win_combo|
      if @board[win_combo[0]] == "X" &&  @board[win_combo[1]] == "X" && @board[win_combo[2]] == "X"
        return win_combo
      elsif @board[win_combo[0]] == "O" && @board[win_combo[1]] == "O" && @board[win_combo[2]] == "O"
        return win_combo
      end
    end
    else
      return false
    end
  end

  def full?
    if @board.detect do |i|
      if i == " "
        return false
      end
    end
    else
      true
    end
  end

  def draw?
    if full? && won? == false
      true
    else
      false
    end
  end

  def over?
    if won? || draw?
      true
    else
      false
    end
  end

  def winner
    if won? && current_player == "X"
      "O"
    elsif won? && current_player == "O"
      "X"
    end
  end

  def play
    while !over? do
     turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cats Game!"
    end
  end
end
