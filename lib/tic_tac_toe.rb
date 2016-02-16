class TicTacToe

  board = [" "," "," "," "," "," "," "," "," "]

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  WIN_COMBINATIONS = [
    # Horizontal wins:
    [0,1,2], [3,4,5], [6,7,8], 
    # Vertical wins:
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    # Diagonal wins:
    [0, 4, 8], [6, 4, 2]
  ]

  def move(position, player = "X")
  @board[position.to_i-1] = player
  end

  position = position.to_i-1

  def position_taken?(position)
    if (@board[position] == "X" || @board[position] == "O")
      return true
    else
      return false
    end
  end

  def valid_move?(position)
    if position.to_i.between?(1,9) == true && !position_taken?(position.to_i-1)
      true
    else
      false
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

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      position_1 = @board[win_combination[0]]
      position_2 = @board[win_combination[1]]
      position_3 = @board[win_combination[2]]

      if (position_1 == "X" && position_2 =="X" && position_3 =="X") || (position_1 == "O" && position_2 =="O" && position_3 =="O")
        return win_combination
      end
    end
    return false
  end

  def full?
    @board.all?{|token| token == "X" || token == "O"}
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw?
  end

  def winner
    win = won?
      return @board[win[0]] if win
      nil
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
