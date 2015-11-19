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

  def move(input, player = "X")
    @board[input.to_i - 1] = player
  end

  def position_taken?(position)
  if @board[position] == " " || @board[position] == "" || @board[position] == nil
    return false
  elsif @board[position] == "X" || @board[position] == "O"
    return true
  end
  end

  def valid_move?(position)
  index = position.to_i-1
  if position_taken?(index) == true
    return false
  elsif position_taken?(index) == false
    if index > 8 || index < 0
      return false
    else return true
    end
  end
  end

  def turn
  puts "Please enter 1-9:"
  position = gets.strip
  if valid_move?(position)
    move(position, current_player)
    return display_board
  else
  until valid_move?(position)
    puts "Invalid move, please try again."
    position = gets.strip
  end
  move(position, current_player)
    display_board
  end
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
      if @board == [" "," "," "," "," "," "," "," "," "]
        return false
      end
    WIN_COMBINATIONS.each do |win|
      if @board[win[0]] == "X" && @board[win[1]] == "X" && @board[win[2]] == "X"
        return true
      elsif @board[win[0]] == "O" && @board[win[1]] == "O" && @board[win[2]] == "O"
        return true
      else false
      end
    end
    return false
  end

  def full?
    if @board.any?{|value| value == " "}
      false
    else return true
    end
  end

  def draw?
    if full?
      if won?
          return false
      else
          return true
      end
    else return false
    end
    return false
  end

  def over?
    if won?
      return true
    elsif draw?
      return true
    else return false
    end
  end

  def winner
    WIN_COMBINATIONS.each do |win|
      if @board[win[0]] == "X" && @board[win[1]] == "X" && @board[win[2]] == "X"
        return "X"
      elsif @board[win[0]] == "O" && @board[win[1]] == "O" && @board[win[2]] == "O"
        return "O"
      end
    end
    return nil
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