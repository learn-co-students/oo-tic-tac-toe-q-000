class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

    WIN_COMBINATIONS = [
  [0, 1, 2], # top
  [3, 4, 5], # middle
  [6, 7, 8], # bottom
  [0, 3, 6], # left
  [1, 4, 7], # center
  [2, 5, 8], # right
  [6, 4, 2], # diogonal 1
  [0, 4, 8], # diagonal 2
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  # MOVE

  def move(input, value = "X")
    @board[input.to_i - 1] = value
    display_board 
  end

  # POSITION CHECK

  def position_taken?(position)
    if @board[position] == "" || @board[position] == " " || @board[position] == nil
      return false
    else
      true
    end
  end

  # MOVE VALIDATION

  def valid_move?(position)
    position = (position.to_i - 1)
    if position.between?(0, 8) && !position_taken?(position)
      return true
    end
    if position_taken?(position)
      return false
    end
  end


  # CURRENT PLAYER & COUNT

  def turn_count
    counter = 0
    @board.each do |turn|
      if turn == "X" || turn == "O"
        counter += 1
      end
    end
    counter
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end


  # GAME STATUS

  def won?
    for win_comb in WIN_COMBINATIONS
      win_index = [ @board[win_comb[0]], @board[win_comb[1]], @board[win_comb[2]] ] # creates array with winning indexes on the board
      if win_index.all? { |v| v == "O"} || win_index.all? { |v| v == "X"}
        return win_comb
      end
    end
    return false
  end


  def full?
    if @board.any? {|value| value == " "}
      return false
    else
      return true
    end
  end


  def draw?
    if won?
      return false
    elsif !full? && !won?
      return false
    elsif full? && !won?
      return true
    end
  end


  def over?
    if won?
      puts "Congratulations #{winner}!"
      return true
    elsif draw?
      puts "Cats Game!"
      return true
    end
  end


  def winner
    if won?
      winner_index = won?
   
      winner_array = [ @board[winner_index[0]], @board[winner_index[1]], @board[winner_index[2]] ]
      if winner_array.all? {|value| value == "X" }
        return "X"
      elsif winner_array.all? {|value| value == "O" }
        return "O"
      end
    return nil
    end 
  end


  # TURN

  def turn
    puts "Please enter 1-9:"
    position = gets.strip
      if valid_move?(position)
        move(position, current_player)
      else
        puts "Invalid move!"
        turn
      end
  end

# PLAY

  def play
    until over?
      turn
    end
  end
end
