class TicTacToe

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

  def initialize
    @board = Array.new(9) {" "}
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-------------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-------------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(board_pos, mark="X")
    @board[board_pos - 1] = mark
  end

  def position_taken?(location)
    !(@board[location].nil? || @board[location] == " ")
  end

  def valid_move?(position)
    position = position.to_i - 1
    [0,1,2,3,4,5,6,7,8].include?(position) && !position_taken?(position)
  end
      
  def turn
    puts "Please enter a number from 1-9"
    pos = "invalid"
    while !valid_move?(pos)
      pos = gets.strip
    end
    move(pos.to_i, current_player)
    display_board
  end

  def turn_count
    @board.reject{|i| !["X", "O"].include?(i)}.count
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def draw?
    full? && !won?
  end

  def won?
    result = false
    WIN_COMBINATIONS.each do |win_combo|
      subset = [@board[win_combo[0]], @board[win_combo[1]], @board[win_combo[2]]]
      if subset.all? {|i| i == "X"} || subset.all? {|i| i == "O"}
        result = subset
      end
    end
    result
  end

  def full?
    @board.reject{|i| ["X", "O"].include?(i)}.count == 0 ? true : false
  end

  def over?
    draw? || won?
  end

  def winner
    x = won?
    x ? x[0] : nil
  end

  def play
    ## Keep going until the game ends
    until over?
      turn
    end

    # ## Tell the user what happened after the game ends
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

end