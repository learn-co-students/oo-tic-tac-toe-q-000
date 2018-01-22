class TicTacToe

  # #initialize & @board
  def initialize
    @board = Array.new(9, " ")
  end

  # #display_board
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  # WIN_COMBINATIONS
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

  # #turn_count
  def turn_count
    @board.select{|square| square != " "}.length
  end

  # #current_player
  def current_player
    turn_count % 2 == 0 ? "X" : "O" 
  end

  # #move
  def move
    @board[@position] = current_player
    display_board
  end

  # #position_taken? 
  def position_taken?
    @board[@position] == "X" || @board[@position] == "O"
  end 

  # #valid_move?
  def valid_move?
    @position.between?(0,8) && !position_taken?
  end

  # #turn
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    @position = input.to_i - 1
    valid_move? ? move : turn
  end

  # #play
  def play
    while !over?
      turn
    end
    if draw? 
      puts "Cats Game!" 
    else puts "Congratulations #{winner}!"
    end
  end

  # won?
  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] && 
      @board[combo[1]] == @board[combo[2]] &&
      @board[combo[0]] != " "
    end
  end

  # full?
  def full?
    @board.none?{|spot| spot == " "}
  end

  # draw?
  def draw?
    full? && !won?
  end

  # over?
  def over?
    won? || draw?
  end

  # winner -- can i take away this clunky if statement?
  def winner
    won? ? @board[won?.last] : nil
  end

end