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
    @board = Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts '-----------'
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts '-----------'
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(location, token = "X")
    @board[location.to_i-1] = token
  end

  def position_taken?(position)
    @board[position] == " " || @board[position] == "" ? false : true
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
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

  def turn_count
    @board.count {|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def won?
     WIN_COMBINATIONS.find do |combo|
     @board[combo[0]] == @board[combo[1]] && @board[combo[0]] == @board[combo[2]] && position_taken?(combo[0]) 
    end
  end

  def full?
    @board.all? do |value|
      value == "X" || value == "O"
    end
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || full? || draw?
  end

  def winner
    win_index = won?
    if won?
      @board[win_index[0]]
    else
      nil
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
