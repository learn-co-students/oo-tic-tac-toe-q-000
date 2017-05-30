class TicTacToe
  
  def initialize
    @board = Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
      [0, 1, 2], # top-row
      [3, 4, 5], # middle-row
      [6, 7, 8], # bottom-row
      [0, 3, 6], # first-col
      [1, 4, 7], # second-col
      [2, 5, 8], # third-col
      [0, 4, 8], # left_to_right-diagonal
      [6, 4, 2]  # right_to_left-diagonal
    ]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-" * 11
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-" * 11
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def move(position, token="X")
    @board[position - 1] = token
  end
  
  def position_taken?(position)
    @board[position] == "X" || @board[position] == "O" ? true : false
  end
  
   def valid_move?(position)
     position = position.to_i - 1
     position.between?(0, 8) && !position_taken?(position) ? true : false
  end
  
  def turn
    puts "Please enter 1-9:"
    position = gets.strip.to_i
    
    if valid_move?(position)
      move(position, current_player)
      display_board
    else
      turn
    end
  end
  
  def turn_count
    count = 0
    @board.each do |i|
      count += 1 if i == "X" || i == "O"
    end
    count
  end 
  
  def current_player
    turn_count.even? ? "X" : "O"
  end
  
  def won?
    WIN_COMBINATIONS.detect do |combo|
      combo.all? { |i| @board[i] == "X" } || 
      combo.all? { |i| @board[i] == "O" }
    end
  end
  
  def full?
    @board.all? { |i| i != " "}
  end
  
  def draw?
    full? && !won?
  end
  
  def over?
    won? || draw? || full?
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
    else
      puts "Cats Game!"
    end
  end
  
end
