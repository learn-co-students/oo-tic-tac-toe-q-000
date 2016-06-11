class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

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

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end


  # Define your WIN_COMBINATIONS constant
  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],  # Bottom row
    [0,3,6],  # Left column
    [1,4,7],  # Middle column
    [2,5,8],  # Left column
    [0,4,8],  # Diagonal 1
    [2,4,6]   # Diagonal 2
  ]

  def won?
    #check for empty board first
    if (@board.detect { |e| e=="X" || e=="O" }) == nil then return false
    end

    #otherwise check for winning combinations
    WIN_COMBINATIONS.each do |combo|

      if (@board[combo[0]]== "X" && @board[combo[1]] == "X" && @board[combo[2]]== "X") ||
      (@board[combo[0]]== "O" && @board[combo[1]] == "O" && @board[combo[2]]== "O") then return combo
      end
    end
    return false
  end

  # check for a full board, all spots used
  def full?
    @board.all?{|a| (a=="X" || a== "O")}
  end

  # check for a draw if board is full and no winner
  def draw?
    if !won? && full? then return true
    end
  end

  # check if the game is over
  def over?
    #if full?(board) || won?(board) || draw?(board) then return true
    if won? || draw? then return true
    else return false
    end
  end

  # check on X or O as winner and return "X" or "O"
  def winner
    if won? then return @board[won?[0]]
    end
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, current_player)
    @board[index] = current_player
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    token = turn_count.odd? ? "O" : "X"
    if valid_move?(index)
      move(index, token)
      display_board
    else
      turn
    end
  end

  #play the game until someone wins or board is full with no winner
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
