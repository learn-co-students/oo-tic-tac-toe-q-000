class TicTacToe

  WIN_COMBINATIONS=[
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [6, 4, 2],
    [0, 4, 8]
    ]

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display_board()
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

def move(input, player = "X")
  position = input.to_i-1
  @board[position] = player
end

def position_taken?(position)
  !(@board[position] == " " || @board[position] == nil)
end

def valid_move?(input)
  position = input.to_i-1
  position.between?(0,8) && !position_taken?(position)
end

def turn
  puts "Where would you like to move? (1-9)"
  input = gets.strip

  while !valid_move?(input)
    puts "Please enter a valid move (1-9)"
    input = gets.strip
  end
  move(input, current_player)
  display_board()
end

def turn_count
  count = 0
  @board.each do |position|
    if position == "X" or position == "O"
      count +=1
    end
  end
return count
end

def current_player()
  if turn_count() % 2 == 0
    return "X"
  else
    return "O"
  end
end

def won?
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]

    if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return win_combination
    end
  end
  false
end

def full?
  @board.all? do |position|
    position == "X" || position == "O"
  end
end

def draw?
  full? && !won?
end

def over?
  won? || draw? || full?
end

def winner
  if won?
    return @board[won?[0]]
  end
end

def play
  while !over?
    turn
  end
  if draw?
    puts "Cats Game!"
    elsif winner == "X"
      puts "Congratulations X!"
  elsif winner == "O"
    puts "Congratulations O!"
  end
end

end