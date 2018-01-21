class TicTacToe
  def initialize(board = nil) 
  	@board = Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
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
  
  def move(position, token = "X")
  	@board[position.to_i - 1] = token
  end

  def position_taken?(position)
    if @board[position] == "X" || @board[position] == "O"
  	  return true
    else
  	  return false
    end
  end

  def valid_move?(position)
    if !position_taken?(position.to_i - 1) && position.to_i.between?(1, 9)
      return true
    else
      return false
    end
  end

  def turn
    puts "Please input 1-9:"
    position = gets.strip
    if valid_move?(position)
      move(position, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    @board.count {|token| token == "X" or token == "O"}
  end

  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def won?
  	WIN_COMBINATIONS.find do |combination|
      combination.all? {|position| @board[position] == "X"} or combination.all? {|position| @board[position] == "O"}
    end
  end

  def full?
    @board.all? do |position|
      position == "X" or position == "O"
    end
  end

  def draw?
    if full? && !won?
      return true
    end
  end

  def over?
    if full? or won? or draw?
      return true	
    end
  end

  def winner
    if won?
      return @board[won?.first] 
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
 
end
