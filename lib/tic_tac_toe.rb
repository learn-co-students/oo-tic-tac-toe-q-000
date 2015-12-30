class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ]

  def display_board
    puts (" "+@board[0]+" | "+@board[1]+" | "+@board[2]+" ")
    puts "-----------"
    puts (" "+@board[3]+" | "+@board[4]+" | "+@board[5]+" ")
    puts "-----------"
    puts (" "+@board[6]+" | "+@board[7]+" | "+@board[8]+" ")
  end

  def move(position, char="X")
    @board[position.to_i-1]=char
  end

  def position_taken?(location)
    !(@board[location].nil? || @board[location] == " ")
  end

  def valid_move?(position)
    if position.to_i>=1 && position.to_i<=9 && !position_taken?(position.to_i-1)
      return true
    else
      return false
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
    count = 0
    @board.each do |cell|
      if cell=="X" || cell=="O"
        count += 1
      end
    end
    return count
  end

  def current_player
    if turn_count%2==0
      return "X"
    else
      return "O"
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]

        position_1 = @board[win_index_1] # load the value of the board at win_index_1
        position_2 = @board[win_index_2] # load the value of the board at win_index_2
        position_3 = @board[win_index_3] # load the value of the board at win_index_3

        if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
          return win_combination
        end
    end
    return false
  end

  def full?
    @board.each do |cell|
      if !(cell=="X"||cell=="O")
        return false
      end
    end
    return true
  end

  def draw?
    if (!won?&&full?)
      return true
    else
      return false
    end
  end

  def over?
    if(draw? || won?)
      return true
    else
      return false
    end
  end

  def winner
    x_count = 0
    o_count = 0
    if won?
      @board.each do |cell|
        if cell=="X"
          x_count += 1
        end
        if cell=="O"
          o_count += 1
        end
      end
      if x_count > o_count
        return "X"
      else
        return "O"
      end
    end
  end

  def play
  # until the game is over
  #   take turns
  # end

    until over?
      turn
    end

  # if the game was won
  #   congratulate the winner
  # else if the game was a draw
  #   tell the players it has been a draw
  # end
    if won?
      puts "Congratulations "+winner+"!"
    elsif draw?
      puts "Cats Game!"
    end
  end

end