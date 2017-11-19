class TicTacToe

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(location, current_player = "X")
    @board[location.to_i-1] = current_player
  end

  def position_taken?(location)
    !(@board[location].nil? || @board[location] == " ")
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
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
    if won?
      return won?
    end
  end



  def turn_count
    counter = 0
    @board.each do |position|
      if position != " "
        counter += 1
      end
    end
    return counter
  end

  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end


  def board_empty?
    @board.each do |position|
      if position == "X" || position == "O"
        return false
      end
    end
    return true
  end

  def three_in_a_row?(combo, mark)
    combo.each do |position|
      if @board[position] != mark
        return false
      end
    end
    return combo
  end

  def full?
    @board.each do |position|
      if position != "X" && position != "O"
        return false
      end
    end
    return true
  end

  def won?
    if board_empty?
      return false
    end
    PLAYERS.each do |mark|
      WIN_COMBINATIONS.each do |combo|
        if three_in_a_row?(combo, mark)
          return combo
        end
      end
    end
    return false
  end

  def draw?
    if full?
      if !won?
        return true
      end
    end
    return false
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
    return nil
  end

  def play
    until over?
      turn
      if won?
        break
      end
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cats Game!"
    end
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

  PLAYERS = ["X", "O"]

end