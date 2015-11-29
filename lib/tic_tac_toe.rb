class TicTacToe
  def initialize(board = nil)
    @board= board || Array.new(9," ")
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
    ]


  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end


def move(location, token = "X" )
  @board[location.to_i-1] = token
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(position)
    position= position.to_i - 1

    if position_taken?(position)
      return false

    elsif position.between?(0,8)
      return true
    elsif position < 0 || position > 8
      return false
   end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
      token = current_player
      move(input, token)
    else
      turn
    end
    display_board
  end

  def turn_count
    occupied_positions = 0
    @board.each do |countocc|
    if countocc == "X" || countocc == "O"
      occupied_positions += 1
    end
    end
    return occupied_positions
  end

def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] &&
      @board[combo[1]] == @board[combo[2]] &&
      position_taken?(combo[0])
    end
  end

  def full?
   @board.none? do |open|
    (open == "") || (open ==" ") || (open== nil)
   end
  end

  def draw?
    if !(won?)
      if full?
        true
      else
        false
      end
    end
  end

  def over?
    if won? || draw?
      true
    else
      false
    end
  end


  def winner
    winning_combo = won?
    puts" WC-- #{winning_combo}"
    if won?
      if @board[winning_combo[0]] == "X"
        "X"
      else
        "O"
      end
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



