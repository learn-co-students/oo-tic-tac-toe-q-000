class TicTacToe

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

  def initialize
    @board = [' '] * 9
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
    !(@board[location].nil? or @board[location] == " ")
  end

  def valid_move?(position)
    position.to_i.between?(1,9) and !position_taken?(position.to_i-1)
  end

  def turn_count
    @board.select { |i| i == 'X' or i == 'O'}.count
  end

  def current_player
    turn_count % 2 == 0 ? 'X' : 'O'
  end

  def won?
    WIN_COMBINATIONS.each do |i|
      subboard = @board[i[0]..i[0]] + @board[i[1]..i[1]] + @board[i[2]..i[2]]
      return i if subboard.all? { |j| j == 'X' } or subboard.all? { |j| j == 'O' } 
  end
    false
  end

  def full?
    @board.all? { |i| i == 'X' or i == 'O' }
  end

  def draw?
    full? and !won?
  end

  def over?
    full? or won? or draw?
  end

  def winner
    won? ? @board[won?[0]] : nil
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
      move(input, current_player)
      display_board
    else
      turn
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