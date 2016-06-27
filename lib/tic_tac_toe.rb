class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6],
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(index, current_player = "X")
    @board[index-1] = current_player
  end

  def valid_move?(index)
   if !position_taken?(index.to_i) && index.to_i.between?(0,8)
    return true
  end
end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(input.to_i)
      cur = current_player
      move(input.to_i, cur)
      display_board
    else
      turn
    end
  end

  def turn_count
    counter = 0
    @board.each do |turn|
      if turn != " "
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

  def won?
    win_combo = false
    WIN_COMBINATIONS.each do |arr|
      position_1 = arr[0]
      position_2 = arr[1]
      position_3 = arr[2]

      wpos1 = @board[position_1]
      wpos2 = @board[position_2]
      wpos3 = @board[position_3]
      if (wpos1 == "X" && wpos2 == "X" && wpos3 == "X") || (wpos1 == "O" && wpos2 == "O" && wpos3 == "O")
        win_combo = arr
      end
    end
    return win_combo
  end

  def full?
    if @board.all? { |e| e == "X" || e == "O" }
      return true
    end
  end
  # Helper Method
  def position_taken?(index)
    if !(@board[index.to_i] == " " || @board[index.to_i] == "")
      return true
    end
  end

  def draw?
    !won? && full?
  end

  def over?
    if (won? || full? || draw?)
      return true
    else
      return false
    end
  end

  def winner
    if !won?
    return nil
  elsif won?
      arr = won?
      pos = arr[1]
      return @board[pos]
   end
  end

  def play
    counter = 1
    while counter < 10 && !over?
      turn
      counter += 1
    end
    if won?
      winnerp = winner
      puts "Congratulations #{winnerp}!"
    elsif draw?
      puts "Cats Game!"
    end
  end
end
