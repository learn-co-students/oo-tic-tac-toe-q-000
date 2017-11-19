class TicTacToe

  def initialize(game_board = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
    @board = game_board
  end

  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [6, 4, 2]]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, character = "X")
    @board[position.to_i-1] = current_player
  end

  def position_taken?(position)
    !(@board[position].nil? || @board[position] == " ")
  end

def valid_move?(position)
    position_i = position.to_i - 1
    if position_i.between?(0, 8)
      !position_taken?(position_i)
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
      move(input, current_player)
    else
      turn
    end
    display_board
  end

  def turn_count
    counter = 0
    @board.each do |space|
      if space == "X" || space == "O"
        counter += 1
      end
    end
    return counter
  end

  def current_player
    if turn_count % 2 == 0
      return "X"
    elsif turn_count % 2 == 1
      return "O"
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |winning_array|
      @board[winning_array[0]] == @board[winning_array[1]] && @board[winning_array[1]] == @board[winning_array[2]] && position_taken?(winning_array[0])
    end
  end

  def full?
    !@board.include?(" "||""||nil)
  end

  def draw?
    if won?
      return false
    elsif full?
      return true
    end
  end

  def over?
    full? || won? || draw?
  end

  def winner
    if draw?
      false
    elsif won?
      @board[won?[0]]
    end
  end

  def play
    until over?
      turn
    end
    if draw?
      puts "Cats Game!"
    elsif won?
      puts "Congratulations #{winner}!"
    end
  end
end