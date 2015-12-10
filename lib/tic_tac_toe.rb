class TicTacToe

  def initialize(board = [" "," "," "," "," "," "," "," "," "])
    @board = board
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


 def turn
    puts "Please enter 1-9:"
    input = gets.strip
    token = current_player
    if valid_move?(input)
      move(input, token)
    else
      turn
    end
    display_board
  end


  def turn_count
    turn = 0
    @board.each do |spot|
      if spot == "X" || spot == "O"
        turn += 1
      end
    end
    return turn 
  end

  def current_player
    if turn_count.even?
      return "X"
    else return "O"
    end
  end


  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      win_combo.all? { |index| @board[index] == "X" } || win_combo.all? { |index| @board[index] == "O" }  
    end
  end

  def full?
    @board.none? { |position| position == " " || position == nil }
  end

  def draw?
    if full? == true && won? == nil
      return true
    elsif won? != nil || full? == false
      return false
    end
  end

  def over?
    if draw? == false && won? == nil
      return false
    else return true
    end
  end

  def winner
    if won? == nil
      return nil
    else win_combo = won? 
      @board[win_combo[0]]
    end
  end

  def play
    until over? == true do
      turn
    end
    if won? != nil
        puts "Congratulations #{winner}!"
    elsif draw? == true
        puts "Cats Game!"
    end
  end
end