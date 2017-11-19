class TicTacToe

  def initialize(board = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
    @board = board
  end

  def board= (board)
    @board = board
  end

  def board
    @board
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, token="X")
    @board[position-1] = token
  end

  def position_taken?(position)
    !(@board[position].nil? || @board[position] == " ")
  end

  def valid_move?(position)
    position = position.to_i
    if position.between?(1,9) && position_taken?(position-1) == false
      true
    end
  end

  def turn_count
    counter = 0
    @board.each do |location|
      if "#{location}" == "X" || "#{location}" == "O"
        counter += 1
      end
    end
    return counter
  end

  def turn
    puts "Please enter 1-9:"
    position = gets.to_i
    if valid_move?(position) && turn_count.even?
      move(position, token = "X")
    elsif valid_move?(position) && turn_count.odd?
      move(position, token = "O")
    else
      turn
    end
  end

  def current_player
    turn_count.odd?
      return "X"
    turn_count.even?
      return "O"
  end

  def won?
    WIN_COMBINATIONS.find do |win_combination|
      position_taken?(win_combination[0]) &&
      @board[win_combination[0]] == @board[win_combination[1]] &&
      @board[win_combination[1]] == @board[win_combination[2]]
    end
  end

  def full?
    @board.all? do |position|
      position == "X" || position == "O"
    end
  end

  def draw?
     !won? && full?
  end

  def over?
    won? || full? || draw?
  end

  def winner
    if won? && !draw?
      return @board[won?[0]]
    elsif !won?
      return nil
    end
  end

  def play
    until over? do
      turn
    end
    over? && won?
      puts "Congratulations #{winner}!"
    over? && draw?
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
