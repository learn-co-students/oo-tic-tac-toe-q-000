# Helper Method
class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]


  def initialize
    @board = Array.new(9, " ")
  end

  def position_taken?(location)
    !(@board[location].nil? || @board[location] == " ")
  end



  def won?
    wc = WIN_COMBINATIONS
    wc.each do |c|
      if position_taken?(c[0])
        if @board[c[0]] == @board[c[1]] && @board[c[1]] == @board[c[2]]
          return c
        end
      end
    end
    false
  end



  def full?
    full = WIN_COMBINATIONS.all? do |wc|
      position_taken?(wc[0]) &&
      position_taken?(wc[1]) &&
      position_taken?(wc[2])
    end
  end



  def draw?
    !won? && full? ? true : false
  end



  def over?
    won? || full? || draw? ? true : false
  end



  def winner
    won? ? @board[won?[0]] : nil
  end



  def turn_count
    @board.count("X") + @board.count("O")
  end



  def current_player
     turn_count % 2 == 0 ? "X" : "O"
  end


  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end



  def move(location, current_player)
    @board[location - 1] = current_player
  end



  def valid_move?(location)
    location.to_i.between?(1,9) && !position_taken?(location.to_i - 1)
  end



  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    location = input.to_i
    if valid_move?(location)
      move(location, current_player)
      display_board
    else
      turn
    end
  end



  def play
    while !over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cats Game!"
    end
  end

end

# Define your WIN_COMBINATIONS constant
