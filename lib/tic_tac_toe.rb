class TicTacToe

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [6, 7, 8],
    [2, 5, 8],
    [0, 3, 6],
    [1, 4, 7],
    [3, 4, 5],
    [0, 4, 8],
    [6, 4, 2]
  ]

  def initialize()
    @board = @board || Array.new(9, " ")
  end

  def play
    while !won? && !over? && !draw?
        turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!" 
    end
  end

  def turn
  puts "Please enter 1-9:"
  @pos = gets.strip

  # TODO: implement recursion
  until valid_move?(@pos)
    puts "Please enter 1-9:"
    @pos = gets.strip
  end

  move(@pos, current_player)
  display_board  
end

def current_player    
  turn_count % 2 == 0 ? "X" : "O"
end

def move(pos, player = "X")
  @board[pos.to_i-1] = player
end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end


  def won?
    WIN_COMBINATIONS.find do |win_combo|
      x_wins = win_combo.all? { |pos| @board[pos] == "X" }
      o_wins = win_combo.all? { |pos| @board[pos] == "O" }
      win_combo if x_wins || o_wins
    end
  end

  def position_taken?(pos)
    @board[pos.to_i] != " " && @board[pos.to_i] != "" # removed decrement
  end

  def valid_move?(pos)
    pos.to_i.between?(1,9) && !position_taken?(pos.to_i-1)
  end

  def winner
    won? ? @board[won?[0]] : nil
  end

  def full?
    @board.all? { |pos| pos == "X" || pos == "O" }
  end

  def draw?
    full? && !won?
  end

  def over?
    draw? || won?
  end

  def turn_count
    count = 0
    @board.each { |pos| count +=1 if pos == "X" || pos == "O" }
    count
  end

end