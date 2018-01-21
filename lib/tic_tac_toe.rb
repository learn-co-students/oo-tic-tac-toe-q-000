class TicTacToe
  def initialize(board=nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [[0,1,2],
                      [3,4,5],
                      [6,7,8],
                      [0,3,6],
                      [1,4,7],
                      [2,5,8],
                      [0,4,8],
                      [6,4,2]]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def play
    until over? do
      display_board
      turn
    end
    if draw?
      puts "Cats Game!"
    else
      puts "Congratulations #{winner}!"
    end
  end

  def turn
    puts "Please enter 1-9:"
    location = gets.strip
    valid_move?(location) ? move(location, player = "X") : turn
    display_board
  end

  def valid_move?(location)
    location = location.to_i - 1
    !position_taken?(location) && location.between?(0,8)
  end

  def position_taken?(location)
    !(@board[location].nil? || @board[location] == " ")
  end

  def move(location, player = "X")
    player = current_player
    location = location.to_i - 1
    @board[location] = player
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def won?
    WIN_COMBINATIONS.each do |winning_trio|
        if (@board[winning_trio[0]] == "X" &&
            @board[winning_trio[1]] == "X" &&
            @board[winning_trio[2]] == "X") ||
           (@board[winning_trio[0]] == "O" &&
            @board[winning_trio[1]] == "O" &&
            @board[winning_trio[2]] == "O")
#           return true
          return winning_trio
        end
      end
      return false
  end

  def full?
    !@board.any?{|i| i == " "} && !@board.any?{|i| i == ""} && !@board.any?{|i| i == nil}
  end

  def draw?
    !won? && full?
  end

  def over?
   draw? || won? || full?
  end

  def winner
#    if over? && won? && !draw?
#    if over?

      if @board.count("X") > @board.count("O")
        return "X"
      elsif @board.count("O") > @board.count("X")
        return "O"
      else
        return nil
      end
#    end
  end
end #end of TicTacToe class