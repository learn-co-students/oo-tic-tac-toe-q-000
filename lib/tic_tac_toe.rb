class TicTacToe

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
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
  end

  def turn_count
    count = 0
    @board.each do |b|
      if b=="X" || b=="O"
        count+=1
      end
    end
    return count
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
      # grab each index from the win_combination that composes a win.

      position_1 = @board[win_combination[0]] # load the value of the board at win_index_1
      position_2 = @board[win_combination[1]] # load the value of the board at win_index_2
      position_3 = @board[win_combination[2]] # load the value of the board at win_index_3

      if ((position_1 == "X" && position_2 == "X" && position_3 == "X") ||
          (position_1 == "O" && position_2 == "O" && position_3 == "O"))
        return win_combination # return the win_combination indexes that won.
      end
    end
    return nil
  end


  def full?
    @board.count{ |b| b=="X" || b=="O" }==9 ? true : false
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || full? || draw?
  end

  def winner
    win_combination = won?
    win_combination != nil ? @board[win_combination[0]] : nil
  end

  def play
    until over?
      turn
    end
    if won? != nil
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

end
