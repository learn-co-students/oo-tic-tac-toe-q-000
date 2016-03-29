class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], # top win
    [3,4,5], # middle win
    [6,7,8], # bottom win
    [0,3,6], # left win
    [1,4,7], # center win
    [2,5,8], # right win
    [0,4,8], # left diagonal win
    [2,4,6]  # right diagonal win
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, player = "X")
    position = position.to_i
    position = position - 1

    @board[position] = player
  end

  def position_taken?(position)
    if @board[position] == " " || @board[position] == "" || @board[position] == nil
      false
    elsif @board[position] == "X" || @board[position] == "O"
      true
    end
  end

  def valid_move?(position)
    position = position.to_i
    position = position - 1

    if position.between?(0,8)
      final_outcome = position_taken?(position)
      !final_outcome
     else
      false
    end
  end

  def turn()
    puts "Please enter 1-9:"
    position = gets.strip

    is_valid_move = valid_move?(position)

    if is_valid_move
      player = current_player()
      move(position, player)
      display_board()
    else
      turn()
    end
  end

  def turn_count()
    turns_taken = []
    turns_taken = @board.select{|i| i != " "}
    turns_taken.length
  end

  def current_player()
    turns_taken = turn_count()

    if turns_taken % 2 == 0
      "X"
    else
      "O"
    end
  end

  def won?()
    counter = 0
    winning_combo = false
    WIN_COMBINATIONS.each do |win_combination|
      counter += 1

      win_index1 = win_combination[0]
      win_index2 = win_combination[1]
      win_index3 = win_combination[2]

      position1 = @board[win_index1]
      position2 = @board[win_index2]
      position3 = @board[win_index3]

     if (position1 == "X" && position2 == "X" && position3 == "X") ||
          (position1 == "O" && position2 == "O" && position3 == "O")
        winning_combo = win_combination
      end
    end

    return winning_combo
  end

  def full?()
    all_full = @board.all? do |character|
      character == "X" || character == "O"
    end
  end

  def draw?()
    # returns true if the board has not been won and is full
    # return false if the board is not won and the board is not full
    # return false if the board is won

    if !won?() && full?()
      true
    elsif !won?() && !full?()
      false
    elsif won?()
      false
    end
  end

  def over?()
    # returns true if the board has been won, is a draw, or is full
    if won?() || draw?() || full?()
      true
    end
  end

  def winner()
    winning_number = won?()

    if !winning_number
      nil
    else
      @board[winning_number[0]]
    end
  end

  def play()
    until over?()
      turn()
    end

    if won?()
      winning_player = winner()
      puts "Congratulations #{winning_player}!"
    else
      puts "Cats Game!"
    end
  end
  
  
end