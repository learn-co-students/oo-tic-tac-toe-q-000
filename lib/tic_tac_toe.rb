class TicTacToe
  def initialize
    @board = Array.new(9, " ")
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

  def move(input, x = "X")
    value = input.to_i - 1
    @board[value] = x
  end

  def position_taken?(position)
   !(@board[position] == " " || @board[position] == "" || @board[position] == nil)
  end

  def valid_move?(position)
   move = position.to_i - 1
   position_taken?(move) == false && move.between?(0,8)
  end 

  def turn
    puts "Please enter 1-9:"

    input = gets.strip
    if valid_move?(input)
      move(input.to_i, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    counter = 0
    @board.each_index { |x| counter += 1 if position_taken?(x) }
    counter
  end

  def current_player
    counter = turn_count
    if counter % 2 == 0
      "X"
    else counter % 2 != 0
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

      if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return win_combination # return the win_combination indexes that won.
      end
    end
    false
  end

  def full?
    turn_count == 9 
  end

  def draw?
    full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    if won?
      return @board[won?[0]]
    else
      nil 
    end 
  end

  def play
    until over?
      turn
    end
    puts "Congratulations #{winner}!" if won?
    puts "Cats Game!" if draw?
  end
end