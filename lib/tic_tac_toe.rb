class TicTacToe

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

  #initialize method
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  #display_board method
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]}  "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]}  "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]}  "
  end

  #move method
  def move(loc, choice = "X")
    loc = loc.to_i
    @board[loc-1] = choice
  end

  #position_taken? method
  def position_taken?(position)
    if @board[position] == " " || @board[position] == "" || @board[position] == nil
      false
    elsif @board[position] == "X" || @board[position] == "O"
      true
    end
  end

#valid_move? method
  def valid_move?(position)
    position = position.to_i
    if position_taken?(position-1)
      false
    elsif position.between?(1,9) == false
      false
    else
      true
    end
  end

  #turn method
  def turn
    puts "Please enter 1-9:"
    input = gets.strip

    if valid_move?(input)
      move(input, current_player)
      display_board
    else
      while (input.to_i).between?(1,9) == false
        puts "Please enter 1-9:"
        input = gets.strip
      end
    end
  end

  #turn_count method
  def turn_count
    count = 0

    @board.each do|position|
      if position == "X" || position == "O"
        count += 1
      end
    end

    return count
  end

  #current_player method
  def current_player

    if turn_count % 2 == 0
      return "X"
    elsif turn_count % 2 == 1
      return "O"
    end
  end

  #won? method
  def won?

    WIN_COMBINATIONS.each do |combo|
      win_index_1 = combo[0]
      win_index_2 = combo[1]
      win_index_3 = combo[2]

      position_1 = @board[win_index_1] # load the value of the board at win_index_1
      position_2 = @board[win_index_2] # load the value of the board at win_index_2
      position_3 = @board[win_index_3] # load the value of the board at win_index_3

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return combo
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return combo
      end
    end
    return false
  end

  #full? method
  def full?
    @board.all? do |move|
      move == "X" || move == "O"
    end
  end

  #draw? method
  def draw?
    if !won? && full?
      return true
    elsif !won? && !full?
      return false
    elsif won?
      return false
    end
  end

  #over? method
  def over?
    if won? || draw? || full?
      return true
    else
      return false
    end
  end

  #winner method
  def winner
    array = won?

    if won? != false
      if @board[array[0]] == "X"
        return "X"
      elsif @board[array[0]] == "O"
        return "O"
      end
    elsif draw?
      return nil
    end
  end

  #play method
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

