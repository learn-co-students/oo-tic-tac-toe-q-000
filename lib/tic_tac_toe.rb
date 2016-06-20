class TicTacToe
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
  def initialize(board= nil)
    @board = board || Array.new(9, " ")
  end

  #display_board draw the current state of the board
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end


  def move(position, current_player)
    position = position.to_i - 1
    @board[position] = current_player
  end

  def position_taken?(position)
    if @board[position].upcase == "X" || @board[position].upcase == "O"
      return true
    else
      return false
    end
  end

  def valid_move?(position)
    position = position.to_i - 1
    if position.between?(0, 9) && !position_taken?(position)
      return true
    else
      return false
    end
  end

  def turn
    puts "Please enter 1-9:"
    position = gets.strip
    if valid_move?(position)
      player = current_player
      move(position, player)
      display_board
    else
      turn
    end
  end

  def turn_count
    count = 0
    @board.each do |location|
      if location.upcase == "X" || location.upcase == "O"
        count = count + 1
      end
    end
    count
  end

  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end

  def won?
    won_status = false
    WIN_COMBINATIONS.each do |win_combination|
     pos_1 = @board[win_combination[0]].upcase
     pos_2 = @board[win_combination[1]].upcase
     pos_3 = @board[win_combination[2]].upcase
     puts pos_1, pos_2, pos_3
     if pos_1 == "X" && pos_2 == "X" && pos_3 == "X"
       return win_combination
     elsif pos_1 == "O" && pos_2 == "O" && pos_3 == "O"
       return win_combination
     else
       won_status = false
     end
   end
   return won_status
  end

  def full?
    board_full = @board.all? do |location|
      location.upcase == "X" || location.upcase == "O"
    end
    board_full
  end

  def draw?
    if won?
      false
    else
      if full?
        true
      else
        false
      end
    end
  end

  def over?
    if won? || draw? || full?
      true
    else
      return false
    end
  end

  def winner
    player = nil
    if won?
      win_combination = won?
      player = @board[win_combination[0]].upcase
      player
    else
      player = nil
    end
    player
  end

  def play
    win_player = nil
    until over?
      turn
    end
    if won?
      win_player = winner
      puts "Congratulations #{win_player.upcase}!"
    else
      puts "Cats Game!"
    end
  end

end
