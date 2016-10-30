class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
      [0,1,2], # Top row
      [3,4,5],  # Middle row
      [6,7,8], #bottom row
      [0,3,6], #first column
      [1,4,7], #second column
      [2,5,8], #third column
      [0,4,8], #diagonal right
      [2,4,6], #diagonal left
    ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, current_player = "X")
    @board[position - 1] = current_player
  end

  def position_taken?(position)
    @board[position] != " " && @board[position] != ""
  end

  def current_player
    if turn_count(@board) % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def turn_count
    counter = 0
    @board.each do |space|
      if space != " "
        counter += 1
      end
    end
    counter
  end

  def valid_move?(position)
    position = position.to_i - 1
    position.between?(0,8) && !position_taken?(position)
  end

  def input_to_index(input)
   input.to_i - 1
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    position = input_to_index(input)
    if valid_move?(position)
      move(position, current_player)
      display_board
    else
      turn
    end
  end
end




#

#

#

#

#

#

#

#

#

#
# def won?(board)
#   WIN_COMBINATIONS.each do |combo|
#     if board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X"
#       return combo
#     elsif board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O"
#       return combo
#     end
#   end
#   false
# end
#
# def full?(board)
#   board.all? do |index|
#     index == "X" || index == "O"
#   end
# end
#
# def draw?(board)
#   !won?(board) && full?(board)
# end
#
# def over?(board)
#   won?(board) || draw?(board) || full?(board)
# end
#
# def winner(board)
#   WIN_COMBINATIONS.each do |combo|
#     if board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X"
#       return "X"
#     elsif board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O"
#       return "O"
#     end
#   end
#   nil
# end
#
# def play(board)
#   until over?(board)
#     turn(board)
#   end
#   if won?(board)
#     puts "Congratulations #{winner(board)}!"
#   elsif draw?(board)
#     puts "Cats Game!"
#   end
# end
