class TicTacToe
  def initialize(board=nil)
    @board = board || Array.new(9, " ")
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

  def move(location, token="X")
    @board[location.to_i-1] = token
  end

  def position_taken?(position)
    if @board[position] == "X" || @board[position] == "O"
      return true
    else
      false
    end
  end

  def valid_move?(position)
    if !position_taken?(position.to_i-1) && position.to_i.between?(1,9)
      true
    else
      false
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip.to_i
    if valid_move?(input)
      move(input, current_player)
      display_board
    else
      turn
    end
  end

  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end

  def won?

    @board.all? do |space|
      space != " "
    end

    WIN_COMBINATIONS.find do |combo|
      win_index_1 = combo[0]
      win_index_2 = combo[1]
      win_index_3 = combo[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return combo
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return combo
      else
        false
      end
    end
  end

  def full?
    @board.none? {|space| space == " "}
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw? || full?
  end

  def winner
    if won?
      win_combo = won?
      position = win_combo[0]
      token = @board[position]
      return token
    else 
      return nil
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

  def turn_count
    num = 0
    count = 0
    @board.each do
      if @board[num] == "O" || @board[num] == "X"
        count += 1
      end
      num += 1
    end
    return count
  end

end











