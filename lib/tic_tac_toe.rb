# define TTT class

class TicTacToe

  def initialize(board = Array.new(9, " "))
    @board = board
  end

  # define constant with all winning combos
  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],  # Bottom row
    [0,3,6], # Left column
    [1,4,7],  # Middle column
    [2,5,8],  # Right column
    [0,4,8],  # Diagonal 1
    [6,4,2]  # Diagonal 2
  ] 

  # prints out the current state of the board
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  # method to take player's input and add it to the board
  def move(input, value = "X")
    @board[input.to_i - 1] = value
  end

  # check if the position the player took is taken
  def position_taken?(position)
    if @board[position] == " " || @board[position] == "" || @board[position] == nil
      false
    elsif @board[position] == "X" || @board[position] == "O"
      true
    end
  end

  # check if integer
  def is_number?(position)
    position.to_s == position.to_i.to_s 
  end
  
  # check if player's move is valid
  def valid_move?(position)
    if is_number?(position)
      if position.to_i.between?(0, 10)
        if position_taken?(position.to_i-1)
          false
        else
          true
        end
      else 
        false
      end
    else
      false
    end
  end

  # asks the user for their turn, display board if valid
  def turn
    puts "Please enter 1-9:"
    position = gets.chomp

    while !valid_move?(position)
      puts "Please enter 1-9:"
      position = gets.chomp
    end

    move(position, player_move = current_player)

    display_board
  end

  # takes in an argument of the board array and returns the number of turns that have been played.
  def turn_count    
    count = 0
    @board.each do |board_item|
      if board_item != " "
        count += 1
      end
    end
    count
  end

  #  check who's turn it is
  def current_player
    turn_count.even? ? "X" : "O"
  end

  # determines if there is a winner
  def won?
    WIN_COMBINATIONS.each do |combination|
      win_index_1 = combination[0]
      win_index_2 = combination[1]
      win_index_3 = combination[2]
     
      position_1 = @board[win_index_1] # load the value of the board at win_index_1
      position_2 = @board[win_index_2] # load the value of the board at win_index_2
      position_3 = @board[win_index_3] # load the value of the board at win_index_3
    
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return combination # return the win_combination indexes that won.
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return combination # return the win_combination indexes that won.
      end
    end
    false
  end

# determines if the board is full or not
def full?
  if @board.include?(" ")
    false
  else
    true
  end
end


# determines if there is a tie
def draw?
  if full? && !won?
    true
  else
    false
  end
end


# determines if the game is over
def over?
  if draw? || won?
    true
  else 
    false
  end
end


# returns the winning token
def winner
  if won?
    win_array = won?
    position = win_array[0]
    @board[position]
  else 
    nil
  end
end

# main method - responsible for the loop
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