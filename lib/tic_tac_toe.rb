class TicTacToe
  def initialize
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
    #each array below is referred to as a win_combo
    [0, 1, 2], #top row
    [3, 4, 5], #middle row
    [6, 7, 8], #bottom row
    [0, 3, 6], #left col
    [1, 4, 7], #middle col
    [2, 5, 8], #right col
    [0, 4, 8], #left-right diag
    [6, 4, 2], #right-left diag
  ]

  def position_taken?(position)
    #if position is nil or empty string, returns false (not taken)
    !(@board[position].nil? || @board[position] == " " || @board[position] == "")
  end

  def move(position, current_player="X")
    @board[position.to_i - 1] = current_player
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !position_taken?(position.to_i - 1)
  end

  def turn_count
    #count each space that has "X" or "O"
    @board.count do |space|
      space == "X" || space == "O"
    end
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    #prompts player
    puts "Enter 1 - 9"
    #gets player input
    input = gets.strip
    #if move is NOT valid based on input
    if !valid_move?(input)
      #make recursive call to turn
      turn
    else
      #otherwise process move using current player
      move(input, current_player)
    end
    #display board after move made
    display_board
  end

  def won?
    #detect if a win_combo occurs
    WIN_COMBINATIONS.detect do |win_combo|
      #if a win_combo on @board contains all Xs or Os
      #returns that win_combo
      #else returns nil (falsey)
      win_combo.all?{|position| @board[position] == "X"} || 
      win_combo.all?{|position| @board[position] == "O"}
    end
  end

  def full?
    @board.all?{|position| position == "X" || position == "O"}
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

  def winner
    if won?
      start_of_win_combo = won?[0]
      #returns letter at 1st index of the win_combo
      @board[start_of_win_combo]
    else
      nil
    end
  end

  def play
    until over?
      turn_count
      current_player
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    end

    if draw?
      puts "Cats Game!"
    end
  end

end #TicTacToe end




























