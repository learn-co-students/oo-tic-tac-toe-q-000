class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Right column
  [1,4,7], # Middle column
  [2,5,8], # Left column
  [0,4,8], # Diagonal \
  [6,4,2]  # Diagonal /
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-"*11
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-"*11
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, char = "X")
    location = position.to_i - 1
    @board[location] = char
  end


  def position_taken?(location)
    !(@board[location].nil? || @board[location] == " ")
  end

  def valid_move?(position)
    location = position.to_i - 1
    location.between?(0, 8) && !(position_taken?(location))
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.chomp
    if valid_move?(input)
      move(input, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    occupied = @board.select { |i| i == "X" || i == "O"}
    occupied.length
  end

  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      position_1 = @board[win_index_1] # load the value of the board at win_index_1
      position_2 = @board[win_index_2] # load the value of the board at win_index_2
      position_3 = @board[win_index_3] # load the value of the board at win_index_3
 
      markers = ["X", "O"]
      markers.each do |marker|
        if position_1 == marker && position_2 == marker && position_3 == marker
          return win_combination
        end
      end
    end
    false
  end

  def full?
    turn_count == 9
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw? || full?
  end

  def winner
    if won? 
      location = won?[0]
      char = @board[location]
    end
  end

  def play
    until over? do
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

end