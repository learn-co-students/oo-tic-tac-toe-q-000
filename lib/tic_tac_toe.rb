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

class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " " ," ", " ", " "]
  end
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  def move(location, token="x")
    @board[location-1] = token
  end
  def position_taken?(position)
    if position.class == String
      position = position.to_i
    end
    @board[position] == "X" || @board[position] == "O"
  end
  def valid_move?(position)
    position = position.to_i - 1
    position.between?(0,8) && !(@board[position] == "X" || @board[position] == "O")
  end
  def turn
    display_board
    puts "Please enter 1-9:"
    move = gets.strip.to_i
    valid_move?(move)
    while !valid_move?(move)
      puts "Please enter 1-9:"
      move = gets.strip.to_i
    end
    move(move, current_player)
    display_board
  end
  def turn_count
    turn_count = 0
    @board.each do |position|
      if position == "X" || position == "O"
        turn_count += 1
      end
    end
    turn_count
  end
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  def full?
    !(@board.include?("") || @board.include?(" "))
  end
  def draw?
    !won? && full?
  end
  def won?
    WIN_COMBINATIONS.detect do |combination|
      win_index_1 = combination[0]
      win_index_2 = combination[1]
      win_index_3 = combination[2]

      position1 = @board[win_index_1]
      position2 = @board[win_index_2]
      position3 = @board[win_index_3]

      if position1 == "X" && position2 == "X" && position3 == "X"
        return combination
      elsif position1 == "O" && position2 == "O" && position3 == "O"
        return combination
      else
        false
      end
    end
  end
  def over?
    full? || draw? || won?
  end
  def winner
    if won?
      @board[won?[0]]
    end
  end
  def play
    while !over?
      turn
    end
    if draw?
      puts "Cats Game!"
    elsif won?
      if winner == "X"
        puts "Congratulations X!"
      else
        puts "Congratulations O!"
      end
    end
  end
end
