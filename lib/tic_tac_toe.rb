class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
end


WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end


def welcome
  puts "Welcome to Tic Tac Toe!"
end

def empty_board
     puts "  |  |  \n-----------\n  |  |  \n-----------\n  |  |  \n"
 end


def input_to_index(input)
   input.to_i - 1
end

def position_taken?(index)
  if @board[index.to_i] == " "
    return false
  elsif @board[index.to_i] == ""
    return false
  elsif @board[index.to_i] == nil
    return false
  else
    return true
end
end


def valid_move?(index)
  if (input_to_index(index)).between?(0,8) == false
    return false
  elsif index == "invalid"
    return false
  elsif position_taken?(index.to_i - 1) == false && input_to_index(index).between?(0,8)
      return true
  else
    return false
end
end

def move(input, token)
  @board[input - 1] = token
  display_board
end


def turn
  puts "Please enter 1-9:"
  index = gets.to_i

  if valid_move?(index) == true
    token = current_player
    move(index, token)
  elsif valid_move?(index) == false
    while valid_move?(index) == false
    puts "Invalid move. Please enter 1-9:"
    index = gets.to_i
    end
    token = current_player
    move(index, token)
   end

end

def turn_count
  count = @board.select {|move| move == "X" || move == "O"}
  return count.size
end



def current_player
  if turn_count == 0
    return "X"
  elsif turn_count == 1
    return "O"
 elsif turn_count == 3
   return "X"
 elsif
    turn_count % 2 == 0
    return "X"
  else
    return "O"
  end
end



def current_player
  if turn_count == 0
    return "X"
  elsif turn_count % 2 == 0
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

        if position_1 == "X" && position_2 == "X" && position_3 == "X"
          return true
        elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
          return true
        end
  end
  return false
end

def full?
  if @board.any? {|i| i == " "}
    return false
  else
    return true
end
end

def draw?
  if full? == true && won? == false
    return true
  elsif won? == true
    return false
  else
    return false
  end
end

def over?
  if full? == true || draw? == true || won? == true
    return true
  end
end

def winner
    WIN_COMBINATIONS.each do |win_combination|
          win_index_1 = win_combination[0]
          win_index_2 = win_combination[1]
          win_index_3 = win_combination[2]

          position_1 = @board[win_index_1]
          position_2 = @board[win_index_2]
          position_3 = @board[win_index_3]

          if position_1 == "X" && position_2 == "X" && position_3 == "X"
            puts "Congratulations X!"
            return "X"
          elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
            puts "Congratulations O!"
            return "O"
          end
    end
    return nil
  end

 #def initialize2(play)
  # @play = play
 #end


  #def play=(new_game)
  #  @play = new_game

#  end

  def play

    until over? == true
        turn
      end
    if won? == true
      winner
    end
    if draw? == true
      puts "Cats Game!"
    end
  end

end
