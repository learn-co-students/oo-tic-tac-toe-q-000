class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,3,6],
    [0,4,8],
    [1,4,7],
    [2,5,8],
    [6,4,2]
  ]

  def initialize
    @board = Array.new(9) {" "}
  end


  def display_board
    board = @board
    separator = "-----------"
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "#{separator}"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "#{separator}"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def move(position, character="X")
    index = position.to_i - 1
    @board[index] = character
    return @board
  end

  def position_taken?(position)
    board = @board
    cell = board[position]
    if cell == " " || cell == "" || cell == nil
      return false
    elsif cell == "X" || cell == "O"
      return true
    end
  end

  def valid_move?(position)
    board = @board
    unless position.to_i.between?(1,9)
      return false
    end

    index = position.to_i - 1

    if position_taken?(index)
      return false
    else
      return true
    end
  end

  def turn
    board = @board
    puts "Please enter 1-9:"
    position = gets.strip

    if valid_move?(position)
      move(position, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    board = @board
    arr = board.select { |e| e == "X" || e == "O"}
    return arr.count
  end

  def current_player
    board = @board
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def won?
    board = @board
    WIN_COMBINATIONS.detect { |arr|
      unless arr.class == "Array"
        false
      end

       ((board[arr[0]] == "X" && board[arr[1]] == "X" && board[arr[2]] == "X") ||
       (board[arr[0]] == "O" && board[arr[1]] == "O" && board[arr[2]] == "O")) ?
       true : false
    }
  end

  def full?
    board = @board
    board.all? { |e| e == "X" || e == "O" }
  end

  def draw?
    won = won?
    full = full?
    if !won && full
      return true
    elsif (!won && !full) || won
      return false
    end
  end

  def over?
    won? || draw? || full?
  end

  def winner
    board = @board
    arr = won?
    arr ? board[arr[0]] : nil
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
