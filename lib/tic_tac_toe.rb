class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end


  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8], # Bottom row
    [0,3,6], # First column
    [1,4,7], # 2nd column
    [2,5,8], # 3rd column
    [0,4,8], # Diagonal
    [2,4,6]  # Diagonal
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(index,current_player = "X")
    index = index - 1
    @board[index] = current_player
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    position = index.to_i - 1
    position.between?(0,8) && !position_taken?(index.to_i - 1)
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = user_input.to_i

    if valid_move?(index)
      move(index,current_player)

      display_board
    else
      turn
    end
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?

      WIN_COMBINATIONS.each do |win|

      win_index_1 = win[0]
      win_index_2 = win[1]
      win_index_3 = win[2]

      position_1 = @board[win_index_1] # load the value of the board at win_index_1
      position_2 = @board[win_index_2] # load the value of the board at win_index_2
      position_3 = @board[win_index_3] # load the value of the board at win_index_3

        if position_1 == "X" && position_2 == "X" && position_3 == "X"
          return win # return the win_combination indexes that won.

        elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
          return win # return the win_combination indexes that won.
        end

      end
      return false
  end

  def full?
    @board.all?{|token| token == "X" || token == "O"}
  end

  def draw?
    if !won? && full?
      return true
    end
  end

  def over?
    won? || draw? || full?
  end

  def winner
    spot = won?
    if spot
    index = spot[0]
    pos = @board[index]
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
      elsif draw?
        puts "Cats Game!"
      end
  end

end
