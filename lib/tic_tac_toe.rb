class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,3,6], # First column
    [1,4,7], # Second column
    [2,5,8], # Third column
    [0,4,8], # Diagonal left-top to right-botton
    [6,4,2]  # Diagonal left-bottom to right-top
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(input, current_player = "X")
    location = input.to_i - 1
    @board[location] = current_player
  end

  def position_taken?(location)
    !(@board[location].nil? || @board[location] == " ")
  end

  def valid_move?(location)
    location = location.to_i - 1
    location.between?(0, 8) && !position_taken?(location)
  end

  def turn
    puts "Please enter 1-9:"
    location = gets.chomp
    if valid_move?(location)
      move(location, current_player)
    else
      turn
    end
    display_board
  end

  def turn_count
  counter = 0
  @board.each do |element|
    if element == "X" || element == "O"
      counter += 1
    end
  end
  counter
  end

  def current_player
  turn_count.even? ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.find do | win_combination |

      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      else
        false
      end
    end
  end

  def full?
    @board.all? { | index | index == "X" || index == "O"}
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw? || full?
  end

  def winner
    if won?
      return @board[won?[0]]
    else
      nil
    end
  end

  def play
    display_board
    if !over?
      turn
      play
    else 
      if !over?
        play
      elsif over?
        if draw? || full?
          puts "Cats Game!"
        elsif won?
          puts "Congratulations #{winner}!"
        else
          puts "Adam's error"
        end
      end
    end
  end

end
