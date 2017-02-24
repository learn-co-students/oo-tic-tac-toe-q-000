class TicTacToe
  WIN_COMBINATIONS = [
  [0, 1, 2], [3, 4, 5], [6, 7, 8], #rows    0 1 2
  [0, 3, 6], [1, 4, 7], [2, 5, 8], #cols    3 4 5
  [0, 4, 8], [6, 4, 2]             #diags   6 7 8
  ]

  def initialize(board = nil)
    @board = board || Array.new(9, ' ')
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
    !(@board[location].nil? || @board[location] == " ")
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
  end

  def move(location, current_player = "X")
    @board[location.to_i-1] = current_player
  end

  def current_player
    return turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
   return  @board.count { |b| b == "O" || b == "X"}
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

  def won?
    WIN_COMBINATIONS.each do |combination|
      if combination.all? { |c| position_taken?(c) && @board[c] == @board[combination[0]]}
        return combination
      end
    end
    return false
  end

  def winner
  winner = won?
  if winner
    return @board[winner[0]]
  else
    return nil
  end  
end


  def full?
    !@board.any? {|b| b == " "}
  end

  def draw?
    return full? && !won?
  end

  def over?
    return won? || draw?
  end

def play
  until over? 
    turn
  end

  if draw?
    puts "Cats Game!"
  elsif (winner =="X")
    puts "Congratulations X!"
  else
    puts "Congratulations O!"
  end
      
end
























end