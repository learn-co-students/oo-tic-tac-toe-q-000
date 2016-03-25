class TicTacToe
  #initialize 
  def initialize(board = nil)
    @board = board || Array.new(9," ")
  end

  #display board
  def display_board
    print " #{@board[0]} | #{@board[1]} | #{@board[2]} \n-----------\n #{@board[3]} | #{@board[4]} | #{@board[5]} \n-----------\n #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  #move
  def move(pos,char)
    pos=pos.to_i
    @board[pos-1] = char
  end

  #position taken
  def position_taken?(position)
    position = position.to_i

    if @board[position] == " "
      return false
    elsif @board[position] == "X" || @board[position] == "O"
      return true
    end
  end

  #valid move
  def valid_move?(position)
    pos= position.to_i - 1

    while pos >= 0 && pos <= 8 
      if @board[pos] == " "
        return true
      elsif @board[pos] == "X" or @board[pos] == "O"
        return false
      end
    end
  end

  #turn
  #returns position for valid moves
  def turn 

    puts "Please enter a position between 1-9. \n"

    position = gets

    if !position_taken?(position) && valid_move?(position)
      move(position,current_player)
      display_board
    elsif position_taken?(position) || !valid_move?(position)
      puts "Invalid move. Please re-enter a position between 1-9. \n"
      position = gets
    end
  end

  #turn count
  def turn_count
    count = 0
    @board.each do |player| 
      if player == "X" || player == "O"
        count += 1
      end
    end
    count
  end

  #full?
  def full?
    @board.all?{|i| i == "X" || i == "O"} 
  end


  #current player
  def current_player
    if turn_count%2 == 0
      return "X"
    else 
      return "O"
    end
  end

  #won?
  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]] && position_taken?(combo[0])
    end
  end

  #draw?
  def draw?
    full? && !won?
  end

  #over?
  def over?
    won? || draw?
  end

  #Win Combinations
  WIN_COMBINATIONS = [
  [0,1,2],[3,4,5],[6,7,8], #horizontal
  [0,3,6],[1,4,7],[2,5,8], #vertical
  [0,4,8],[6,4,2]] #diagonal

  #winner
  def winner
    if combo = won?
      return @board[combo.first]
    end
  end

  #play
  def play
    while !over?
      turn
      turn_count
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end 
  end
end








