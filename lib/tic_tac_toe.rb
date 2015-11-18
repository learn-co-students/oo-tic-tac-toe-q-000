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

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(input, current_player = "X")
    @board[input.to_i-1] = current_player
  end

  def position_taken?(position)
    @board[position] == "X" || @board[position] == "O"
  end

  #ugh this position name inconsistency is making me crazy
  def valid_move?(position)
    position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
  end

  def turn
    puts ""
    puts "Player #{current_player}, make your move! (Pick a position 1-9.)"
    input = gets.strip
    
    if !valid_move?(input) && position_taken?(input.to_i-1)
        puts ""
        puts "Invalid move! (Position is already filled.)"
        turn
    elsif !valid_move?(input) && !position_taken?(input.to_i-1)
        puts ""
        puts "Invalid move!"
        turn
    else
        move(input, current_player)
        display_board
    end
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.find do |combo|
      position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
    end
  end

  def full?
    @board.all?{|token| token == "X" || token == "O"}
  end

  def draw?
    !won? && full?
  end

  def over?
    draw? || won?
  end

  def winner
    if winning_combo = won?
      return @board[winning_combo[0]]
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