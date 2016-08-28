
class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
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
    @board[index - 1] = current_player
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index)
    index = index.to_i - 1
    index.between?(0,8) && !position_taken?(index.to_i)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input.to_i
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    @board.count {|token| token == "X"|| token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?

    WIN_COMBINATIONS.each do |win_combo|
      if (@board[win_combo[0]] == "X" && @board[win_combo[1]] == "X" && @board[win_combo[2]] == "X") || (@board[win_combo[0]] == "O" && @board[win_combo[1]] == "O" && @board[win_combo[2]] == "O")
        return win_combo
      end
    end
    return false
  end

  #ternary syntax
  def full?
    @board.all? {|full| full == "X" || full == "O"} ? true : false
  end

  def draw?
    if full? == true && won?  == false
      return true
    else
      return false
    end
  end

  def over?
    won? || draw?
  end

  def winner
    return nil if !won?
    position = won?[0]
      if @board[position] == "X"
        return "X"
      elsif @board[position] == "O"
        return "O"
    end
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
