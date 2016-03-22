
class TicTacToe

  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
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

  def move(position, character = "X")
  @board[position.to_i - 1] = character
  end

  def position_taken?(position)
  !(@board[position.to_i].nil? || @board[position.to_i] == " ")
  end

  def valid_move?(position)
  !position_taken?(position.to_i-1) && (position.to_i).between?(1,9)
  end

  def turn_count
    @board.count do |board_spot|
      board_spot == "X" || board_spot == "O"
    end
  end

  def current_player
  turn_count.even? ? "X" : "O"
  end

  def turn
  puts "Please enter 1-9:"
  position = gets.strip
    if !valid_move?(position)
      turn
    else
      move(position, current_player)
      display_board
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combo_set|
      if @board[combo_set[0]] == "X" && @board[combo_set[1]] == "X" && @board[combo_set[2]] == "X"
        return combo_set
      elsif @board[combo_set[0]] == "O" && @board[combo_set[1]] == "O" && @board[combo_set[2]] == "O"
        return combo_set
      end
    end
    false
  end

  def full?
    @board.none?{|board_space| board_space == " " }
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw?
  end

  def winner
    if won?
    @board[won?[0]]
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
