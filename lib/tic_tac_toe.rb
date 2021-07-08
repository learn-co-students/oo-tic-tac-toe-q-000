class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
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

  def move(position, current_player = "X")
    @board[position.to_i-1] = current_player
  end

  def position_taken?(position)
    @board[position] != " " && @board[position] != "" && @board[position] != nil
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
  end

  def turn()
    puts "Please enter 1-9:"
    position = gets.chomp
    if valid_move?(position)
      move(position, current_player())
    else
      turn()
    end
    display_board()
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.any? do |combination|
      if (@board[combination[0]] == "X" || @board[combination[0]] == "O") && @board[combination[0]] == @board[combination[1]] && @board[combination[1]] == @board[combination[2]]
      return combination
      end
    end
  end

  def full?
    @board.all? {|spot| spot == "X" || spot == "O"}
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw? || full?
  end

  def winner
    win_array = won?()
    win_array ? @board[win_array[0]] : nil
  end
 
  def play()
    until over?()
      turn()
    end
    if won?()
      puts "Congratulations #{winner}!"
    elsif draw?()
      puts "Cats Game!"
  end

end
 


end