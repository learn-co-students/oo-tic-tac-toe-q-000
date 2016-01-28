class TicTacToe

  def initialize(board = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
    @board = board
  end

  def board=(board)
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

  WIN_COMBINATIONS =[
  [0,1,2],
  [0,3,6],
  [0,4,8],
  [1,4,7],
  [2,5,8],
  [3,4,5],
  [6,7,8],
  [6,4,2]  
] 

  def move(location, player = "X")
    @board[location.to_i-1] = player
  end

  def position_taken?(position)
    @board[position] == "X" || @board[position] == "O" ? true : false
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !position_taken?(position.to_i-1) ? true : false
  end

  def turn
    puts "Please enter 1-9:"
    position = gets.strip
    valid_move?(position) ? move(position, current_player) : turn
    display_board
  end

  def turn_count
    counter = 0
      @board.each do |token| if token == "X" || token == "O"
        counter += 1
      end
    end
    counter
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each do |win_combo|
      if win_combo.all? {|index| @board[index] == "X"}
        return win_combo
      elsif win_combo.all? {|index| @board[index] == "O"}
        return win_combo
      end
    end
    false
  end

  def full?
    @board.all? {|index| index == "X" || index == "O"} && !won? ? true : false
  end

  def draw?
    !won? && full? ? true : false
  end

  def over?
    draw? || won? ? true : false
  end

  def winner
    WIN_COMBINATIONS.each do |win_combo|
      if win_combo.all? {|index| @board[index] == "X"}
        return "X"
      elsif win_combo.all? {|index| @board[index] == "O"}
        return "O"
      end
    end
    nil
  end

  def play
    until over?
      turn
    end
    if draw?
      puts "Cats Game!"
    elsif winner == "X"
      puts "Congratulations X!"
    elsif winner == "O"
      puts "Congratulations O!"
    end
  end       

end