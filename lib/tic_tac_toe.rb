class TicTacToe
    def initialize(board=Array.new(9, " "))
      @board = board
    end


  WIN_COMBINATIONS = [
    [0,1,2], # top row
    [3,4,5], # middle row
    [6,7,8], # bottom row
    [0,3,6], # 1st column
    [1,4,7], # 2nd column
    [2,5,8], # 3rd column
    [0,4,8], # 1st diagnal
    [2,4,6]  # 2nd diagnal
  ]


  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end


  def move(position, token)
    index = position.to_i - 1
    @board[index] = token
  end

  def position_taken?(index)
    #index = position.to_i - 1
    if @board[index] == "X" || @board[index] == "O"
      true
    else
      false
    end
  end


  def valid_move?(position)
    index = position.to_i - 1
    if position_taken?(index) != true && index.between?(0, 8)
      return true
    else
      return false
    end
  end


  def turn
    puts "Enter an integer from 1 to 9: "
    user_input = gets.chomp
    if valid_move?(user_input)
      move(user_input, current_player)
      display_board
    else
      turn
    end
  end


  def turn_count
    count = 0
    index = 0
    while index < 10
      if position_taken?(index) == true
        count += 1
      end
        index += 1
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
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

      if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return win_combination
      end
    end
    return false
  end


  def full?
    @board.all? do |position|
      position != " "
    end
  end


  def draw?
    !won? && full?
  end


  def over?
    if draw? || won?
      return true
    else
      return false
    end
  end


  def winner
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

      if (position_1 == "X" && position_2 == "X" && position_3 == "X")
        return "X"
      elsif (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return "O"
      end
    end
    return nil
  end

  def play
    until over? == true
    turn
  end

  if won?
    puts "Congratulations #{winner}!"
  else
    puts "Cats Game!"
  end
end
end
