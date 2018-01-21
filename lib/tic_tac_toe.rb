class TicTacToe
  def initialize(board=nil)
    @board = board || Array.new(9," ")
  end
  def board=(board)
    @board = board
  end
  def board
    @board
  end
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, token="X")
    position = position.to_i - 1
    @board[position] = token
  end

  def position_taken?(location)
    !(@board[location].nil? || @board[location] == " ")
  end

  def valid_move?(position)
    position = position.to_i - 1
    if position.between?(0,8) == true
      if position_taken?(position) == true
        return false
      end
      return true
    end
  end

  def turn
    puts "Player #{current_player}, Please enter 1-9:"
    user_entry = gets.chomp
    if valid_move?(user_entry) == true
      move(user_entry, current_player)
      display_board
    else
      puts "Entry not valid. Try again"
      turn
    end
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
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
        puts "Congratulations X!"
        return win_combination
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        puts "Congratulations O!"
        return win_combination
      end
    end
    return false
  end

  def full?
    full = @board.none? do |cell|
      cell == " "
    end
    return full
  end

  def draw?
    if full? == true && won? == false
      return true
    elsif full? == false
      return false
    elsif full? == true && won? != false
      return false
    end
  end

  def full?
    full = @board.none? do |cell|
      cell == " "
    end
    return full
  end

  def over?
    if won? != false
      return true
    elsif draw? == true
      return true
    elsif full? == true
      return true
    else
      return false
    end
  end

  def winner
    winning_combo = won?
    if winning_combo == false
      return nil
    end
    winning_index = winning_combo[0]
    if @board[winning_index] == "X"
      return "X"
    elsif @board[winning_index] == "O"
      return "O"
    end
  end

  def play
    until over? == true do
      turn
    end
    if draw? == true
      return puts "Cats Game!"
    end
  end


end