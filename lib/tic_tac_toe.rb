class TicTacToe
  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],  # Bottom row
    [0,3,6], #left column
    [1,4,7],  #Middle column
    [2,5,8], # Right column
    [0,4,8],  # Diagnol 1
    [6,4,2]   # Diagnol 2
  ]

  attr_accessor :board

  def display_board
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def move(move, player = "X")
    @board[move.to_i-1] = player
  end

  def position_taken?(move)
    !(@board[move].nil? || @board[move] == " ")
  end

  def valid_move?(move)
    move.to_i.between?(1,9) && !position_taken?(move.to_i-1)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
      move(input, current_player)
    else
      puts "Invalid move."
      turn
    end
  end

  def turn_count
    count = 0
    for position in @board
      if position == "X" || position == "O"
        count += 1
      end
    end
    return count
  end

  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def won?
    for winning_combination in WIN_COMBINATIONS
      if position_taken?(winning_combination[0])
        if @board[winning_combination[0]] == @board[winning_combination[1]] && @board[winning_combination[1]] == @board[winning_combination[2]]
          return winning_combination
        end
      end
    end
    return false
  end

  def full?
    for position in @board
      unless position == "X" || position == "O"
        return false
      end
    end
  return true
  end

  def draw?
    if full? && !won?
      return true
    else
      return false
    end
  end

  def over?
    if won? || draw?
      return true
    end
    return false
  end

  def winner
    if won?
      return @board[won?[0]]
    end
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cats Game!"
    end
  end

end
