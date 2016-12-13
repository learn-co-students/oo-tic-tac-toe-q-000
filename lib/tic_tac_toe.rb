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

  def initialize(board = Array.new(9, " "))
    @board = board
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(location, sym="X")
    @board[location.to_i-1] = sym
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(location)
    location.to_i.between?(1,9) && !position_taken?(location.to_i)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip.to_i
    until valid_move?(input)
      puts "Invalid response, Please enter 1-9:"
      input = gets.strip.to_i
    end
    sym = current_player
    move(input, sym)
    display_board
  end

  def turn_count
    filled = @board.reject { |d| d == " " }
    return filled.count
  end

  def current_player
    return "X" if turn_count == 0
    if turn_count.even?
      return "X"
    else
      return "O"
    end
  end

  def won?
    WIN_COMBINATIONS.each do |comb|
      if (@board[comb[0]] == @board[comb[1]] && @board[comb[1]]== @board[comb[2]] && @board[comb[0]] != " ")
        return [comb[0], comb[1], comb[2]]
      end
    end
    return false
  end

  def full?
    return true if (@board.include?(" ") == false)
    false
  end

  def draw?
    return false if !!won?
    return true if full?
  end

  def over?
    return (draw?  || full? || !!won? )
  end

  def winner
    return @board[won?[0]] if won?
    nil
  end

  def play
    puts "Welcome to Tic Tac Toe!"
    display_board
    until over?
      turn
    end
    if won?
      puts "Congratulations X!" if winner == "X"
      puts "Congratulations O!" if winner == "O"
    else
      puts "Cats Game!"
    end
  end

end
