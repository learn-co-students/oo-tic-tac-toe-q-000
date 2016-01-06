class TicTacToe
  def initialize(board = nil)
    @board = Array.new(9," ") || board
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

  def move(position,current_player="X")
    @board[position.to_i - 1] = current_player
  end

  def position_taken?(position)
  !(@board[position].nil? || @board[position] == " ")
  end

  def valid_move?(position)
  position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
  end

  def turn
    puts "Please enter 1-9:"
    position= gets.strip
      if valid_move?(position)
        move(position, current_player)
      else
        until valid_move?(position) == true #|| turn_count(board) == 9
          puts "Please select an empty cell in range 1-9"
          position= gets.strip
        end
      end
    display_board
  end

def turn_count
  counter = 0
    @board.each do |spot|
        if spot != " "
         counter += 1
        end
    end
  return counter
end

def current_player
  if turn_count % 2 == 0
    return "X"
  elsif turn_count % 2 != 0
    return "O"
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

    if (position_1 == "X" && position_2 == "X" && position_3 == "X") #|| (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return win_combination     # return the win_combination indexes that won.
    elsif (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return win_combination
    end
  end
  return false
end

def full?
  @board.all? {|x| x == "X" || x == "O"}
end

def draw?
  full? && !won?
end

def over?
  won? || draw?
end

def winner
  if won?
  x =  won? #[0,4,8]
  y = x[2].to_i
  @board[y]
  else
    nil
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
