class TicTacToe

  def initialize(board = nil)
    @board = Array.new(9," ")
  end

  WIN_COMBINATIONS =[
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

  def move(location, token= "X")
    @board[location.to_i-1] = current_player
  end

  def position_taken?(position)
    @board[position] != " " && @board[position] != ""
  end

  def valid_move?(position)
  position.to_i.between?(1,9) && !(position_taken?(position.to_i-1))
  end

  def turn
  puts "Please enter 1-9:"
  position = gets
  if valid_move?(position)
    move(position)
  else
   turn
  end
  display_board
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
  turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
  WIN_COMBINATIONS.each do |combo|
    combo_1 = @board[combo[0]]
    combo_2 = @board[combo[1]]
    combo_3 = @board[combo[2]]
    return combo if combo_1 == "X" && combo_2 == "X" && combo_3 == "X"
    return combo if combo_1 == "O" && combo_2 == "O" && combo_3 == "O"
  end
  false
  end

  def full?
  @board.include?(" ") ? false : true
  end

  def draw?
    !won? && full? ? true : false
  end


  def over?
    won? || draw? || full? ? true : false
  end

  def winner
    if combo = won?
      @board[combo[0]]
    end
  end

  def play
  puts "Welcome to Tic Tac Toe!"
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

end
