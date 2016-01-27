class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # First column
  [1,4,7], # Second column
  [2,5,8], # Third column
  [0,4,8], # Downward diagonal
  [6,4,2]  # Upward diagonal
]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, character = "X")
    @position = position.to_i - 1
    @board[(@position)] = character
  end

  def position_taken?(position)
    position = position.to_i
    !((@board[position] == " ") || (@board[position] == "") || (@board[position] == nil))
  end

  def valid_move?(position)
    position = position.to_i - 1
    (position.between?(0,8)) && !(position_taken?(position))
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    loop do 
      puts "Please enter 1-9:"
      @position = gets.strip.to_i
      if valid_move?(@position)
        move(@position, current_player)
        display_board
        break  
      else 
        puts "Invalid position"
      end
    end
  end

  def won?
    win_combination = []
    WIN_COMBINATIONS.each do |line|
      if line.all? { |pos| @board[pos] == "X" }
        win_combination = line
      end
      if line.all? { |pos| @board[pos] == "O" }
        win_combination = line
      end
    end
    if win_combination != []
      win_combination
    else
      false
    end
  end

  def full?
    [*0..(@board.length - 1)].all? do |location|
      position_taken?(location)
    end
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || full? || draw?
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
    end
    if draw?
      puts("Cats Game!")
    end
  end

end