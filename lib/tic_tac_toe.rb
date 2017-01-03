class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

WIN_COMBINATIONS = [
  [0,1,2],  # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6],  # Left column
  [1,4,7],  # Middle column
  [2,5,8],  # Right column
  [0,4,8],  # Down-right diagonal
  [2,4,6]   # Down-left diagonal
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, current_player = "X")
    @board[index] = current_player
  end

  def position_taken?(index)
    @board[index] != " " && @board[index] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9:"
    index = input_to_index(gets.strip)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    return turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    ["X","O"].each do |token|
      WIN_COMBINATIONS.each do |win_combination|
        if win_combination.all? { |index| @board[index] == token }
          return win_combination 
        end
      end
    end
    return false
  end

  def full?
    @board.each_with_index do |pos, i|
      if !position_taken?(i)
        return false
      end
    end
  end

  def draw?
    return !won? && full? ? true : false
  end

  def over?
    return won? || draw? || full? ? true : false
  end

  def winner
    return won? ? @board[won?[0]] : nil
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else if draw?
      puts "Cat's Game!"
    end
    end
  end

end