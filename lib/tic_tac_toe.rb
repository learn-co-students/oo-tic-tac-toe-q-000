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
    @board[location] != " " && @board[location] != ""
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
    counter = 0
    @board.each do |spot|
      if spot == "X" || spot == "O"
        counter+= 1
      end
    end
    counter
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
  x_o = ["X", "O"]
  x_o.detect do |player|
    WIN_COMBINATIONS.detect do |line|
      if @board[line[0]] == player && @board[line[1]] == player && @board[line[2]] == player
        return line
      end
    end
  end
end


  def full?
    all_full = @board.all? do |contents|
      contents == "X" || contents == "O"
    end
  end

  def draw?
    if full? && !won?
      true
    end
  end

  def over?
    won? || draw?
  end

  def winner
    if won?
      @board[won?.first]
    end
  end

end

