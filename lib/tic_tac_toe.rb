class TicTacToe
  attr_accessor :board

  WIN_COMBINATIONS = [
    [0, 1, 2],  # Top row
    [3, 4, 5],  # Middle row
    [6, 7, 8],  # Bottom row
    [0, 3, 6],  # Left column
    [1, 4, 7],  # Middle column
    [2, 5, 8],  # Right column
    [0, 4, 8],  # Diagonal 1
    [6, 4, 2]   # Diagonal 2
  ]

  def initialize
    @board = Array.new(9, " ")
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

  def display_board
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def move(location, player = "X")
    @board[location.to_i-1] = player
  end

  def position_taken?(location)
    !(@board[location].nil? || @board[location] == " ")
  end

  def valid_move?(user_position)
    user_position.to_i.between?(1, 9) && !position_taken?(user_position.to_i-1)
  end 

  def turn
    puts "Please enter 1-9:"
    input = gets.chomp

    if valid_move?(input)
      move(input, current_player)
      display_board
    else
      turn
    end  
  end

  def turn_count
    @board.count{|position| position == "X" || position == "O"}
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each do |win_combo|
      if @board[win_combo[0]] == "X" && @board[win_combo[1]] == "X" && @board[win_combo[2]] == "X"
        return win_combo
      elsif @board[win_combo[0]] == "O" && @board[win_combo[1]] == "O" && @board[win_combo[2]] == "O"
        return win_combo
      end
    end
  
    return false
  end

  def full?
    @board.all?{|position| position == "X" || position == "O"}
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw? || full?
  end

  def winner
    if won?
      WIN_COMBINATIONS.each do |win_combo|
        if @board[win_combo[0]] == "X" && @board[win_combo[1]] == "X" && @board[win_combo[2]] == "X"
          return "X"
        elsif @board[win_combo[0]] == "O" && @board[win_combo[1]] == "O" && @board[win_combo[2]] == "O"
          return "O"
        end
      end
    else
      nil
    end
  end

end