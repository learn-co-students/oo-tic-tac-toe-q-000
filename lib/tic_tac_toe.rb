class TicTacToe
  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  ]
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

  def move(index, player = "X")
    @board[index - 1] = player
  end

  def position_taken?(index)
    @board[index]== "X" || @board[index]== "O"
  end

  def valid_move?(index)
    index = index.to_i
    index -= 1
    index.between?(0, 8) && !position_taken?(index)  
  end

  def turn
    puts "Please enter 1-9:"
    index = gets.strip.to_i
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    count = 0
    @board.each do |x|
      if x == "X" || x == "O"
        count += 1
      end
    end
    count
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each do |win|
      winnr = ""
      win.each do |pos|
        if @board[pos] == "X"
          winnr << "X"
        elsif @board[pos] == "O"
          winnr << "O"
        end
        if winnr == "XXX" || winnr == "OOO"
          return win
        end
      end
    end
    return false
  end

  def full?
    @board.all?  { |element|  element == "X" || element == "O" }
  end

  def draw?
    full = full?
    won = won?
    if won != false
      return false
    elsif full
      return true 
    end
      return false 
  end
  
  def over?
    if draw? || won?
      return true
    else
      return false
    end
  end

  def winner
    if won? != false
      winner = @board[won?[0]]
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

