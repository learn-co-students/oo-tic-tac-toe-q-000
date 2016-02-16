class TicTacToe

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [6,4,2]
  ]

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

  def move(position, player)
    @board[position.to_i-1] = player
  end

  def position_taken?(position)
    !(@board[position].nil? || @board[position] == " ")
  end

  def valid_move?(position)
    (position.to_i.between?(1,9) && !position_taken?(position.to_i-1))
  end

  def turn
    puts "Please enter 1-9:"
    player_move = gets.strip

    if !valid_move?(player_move)
      puts "Please enter 1-9:"
      player_move = gets.strip
    else
      move(player_move, current_player)
      display_board
    end
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    turns = 0
    @board.each do |space|
      if space == "X" || space == "O"
        turns += 1
      end
    end

    turns
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      combo.all? { |pos| position_taken?(pos) } && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
    end
  end

  def full?
    @board.all? { |pos| !(pos.nil? || pos == " ") }
  end

  def draw?
    !won? && full? 
  end

  def over?
    won? || draw?
  end

  def winner
    @board[won?[0]] if won?
  end

  def play
    turn until over?

    puts (won? ? "Congratulations #{winner}!" : "Cats Game!")
  end
end