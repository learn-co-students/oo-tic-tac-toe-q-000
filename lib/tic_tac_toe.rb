class TicTacToe
  def initialize(board = nil)
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

  def move(location, player = "X")
    @board[location.to_i-1] = player
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != "" && @board[location] != nil
  end

  def valid_move?(location)
    location.to_i.between?(1,9) && !(position_taken?(location.to_i - 1))
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    player = current_player
    if valid_move?(input)
      move(input, player)
    else
      turn
    end
      display_board
  end

  def turn_count
    @board.count{|player| player == "X" || player == "O"}
  end
 

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  #Determine game status
  def won?
    WIN_COMBINATIONS.detect do |winning_combination|
      (winning_combination.all?{|position| @board[position] == "X"}) || (winning_combination.all?{|position| @board[position] == "O"})
    end
  end

  def full?
    !(@board.include?(" ") || @board.include?(nil) || @board.include?(""))
  end

  def draw?
    full? && !won?
  end

  def over?
    full? || draw? || won?
  end

  def winner
    if won?
      winning_array = won?
      return @board[winning_array[1]] 
    else
      return nil
    end
  end

  #Play loop
  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cats Game!"
    end
  end

end #end class TicTacToe


