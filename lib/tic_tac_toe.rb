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
  
  def move(location, player = "#{current_player}")
    @board[location.to_i-1] = player
  end

  def position_taken?(location)
    if @board[location] != " " && @board[location] != ""
      true
    else
      false
    end
  end

  def valid_move?(position)
    if position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
      true
    else
      false
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
      move(input)
    else
      turn
    end
    display_board
  end

  def turn_count
    @board.count{|spot| spot == "X" || spot == "O"}
  end

  def current_player
    if turn_count.even?
      "X"
    else turn_count.odd?
      "O"
    end
  end

  def full?
    if @board.detect {|spot| spot == " "}
      false
    else
      true
    end
  end

  def draw?
    if full? && !won?
      true
    else
      false
    end
  end

  def over?
    if draw? || won?
      true
    else
      false
    end
  end

  def won?
    WIN_COMBINATIONS.each do |chickendinner|
      if chickendinner.all?{|i| @board[i] == "X"} || chickendinner.all?{|i| @board[i] == "O"}
        return chickendinner
      end
    end
    false
  end

  def winner
    if won?
      @board[won?[0]]
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else draw?
      puts "Cats Game!"
    end
  end

  WIN_COMBINATIONS = [
  [0,1,2],
  [0,3,6],
  [0,4,8],
  [1,4,7],
  [2,5,8],
  [3,4,5],
  [6,7,8],
  [6,4,2]]
end
