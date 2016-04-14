class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  WIN_COMBINATIONS = [
    [0,1,2], # Top Row
    [3,4,5], # Middle Row
    [6,7,8], # Bottom Row
    [0,3,6], # First Column
    [1,4,7], # Second Column
    [2,5,8], # Third Column
    [0,4,8], # First Diagonal
    [6,4,2] #Second Diagonal
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, character = "X")
    position = position.to_i - 1
    @board[position] = character
  end

  def position_taken?(location)
    !(@board[location].nil? || @board[location] == " ")
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
      move(input, current_player)
    else
      turn
    end
    display_board
  end

  def current_player
    counter = turn_count
    counter % 2 == 0 ? "X" : "O"
  end

  def turn_count
  count = 0
    @board.each do |position|
      if position == "X" || position == "O"
        count += 1
      end
    end
    count
  end

  def full?
    @board.all? do |check|
      check != " "
    end
  end

  def draw?
    full? && !won?
  end

  def over?
    full? || won? || draw?
  end
   
  def winner
    if won?
      @board[won?[0]]
    end
  end

  def won?
    if (@board.all? { |e| (e == " " || e == "")})
      false
    else
      WIN_COMBINATIONS.detect do |win_combination|
       win_combination.all? { |e| (@board[e] == "X") } || win_combination.all? { |e| (@board[e] == "O") }
      end
    end
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