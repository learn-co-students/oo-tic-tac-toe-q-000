class TicTacToe

  def initialize(board = nil)
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  WIN_COMBINATIONS =
  [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [6,4,2],
  [0,3,6],
  [1,4,7],
  [2,5,8]
  ]

  def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def move (location, player ="X")
      @board[(location.to_i) -1 ]=player
      puts "#{@board}"
    end

    def position_taken?(position)
      if @board[position] == "" || @board[position] == " " || @board[position] == nil
      return false
    elsif @board[position] == "X" || @board[position] == "O"
      return true
    end
  end

  def valid_move?(position)
  index = position.to_i-1
  if index.between?(0,8) && !position_taken?(index)
    return true
   else
    return false
   end
  end

  def turn
  puts "Please enter 1-9:"
  user_input = gets
  if valid_move?(user_input)
    move(user_input, current_player)
    display_board
  else
    turn
  end
end

def turn_count
    counter = 0
    @board.each do | occupied_positions |
      if  occupied_positions == "X" ||  occupied_positions =="O"
        counter+=1
      end
    end
     counter
end

def current_player
  turn_count
  if turn_count % 2 == 0
     return "X"
   else
     return "O"
  end
end

def won?
  WIN_COMBINATIONS.detect do | win_combination |
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]

    if position_1 ==  position_2 && position_2 ==  position_3 && position_1 != " "
      return win_combination
    else
      false
    end
  end
end

def full?
  @board.none? do | position |
    position == " "
  end
end

def draw?
  !won? && full?
end

def over?
  won? || draw?
end

def winner
  win_combination = won?
  if win_combination
    win_index = win_combination[0]
    @board[win_index]
  end
end


def play
  while !over?
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cats Game!"
  end
end


end
