class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9," ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  WIN_COMBINATIONS=[
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
    ]

  def move(location, player="X")
    @board[location.to_i-1] = player
  end

  def position_taken?(location)
    if @board[location.to_i]=="X" || @board[location.to_i]=="O"
      true
    else
      false
    end
  end

  def valid_move?(position)
    position = position.to_i - 1
    if !position_taken?(position) && position.between?(0,8)
      true
    end
  end

  def turn
  puts "Enter space from 1 to 9"
    position = gets.strip
    if !valid_move?(position)
      turn
    end
    move(position, current_player)
  end

  def turn_count
    @board.count{|token| token == "X"|| token == "O"}
  end

  def current_player
    if turn_count % 2 == 0
      current_player = "X"
    else
      current_player = "O"
    end
  end

  def won?
  WIN_COMBINATIONS.each do |win|
    position1 = @board[win[0]]
    position2 = @board[win[1]]
    position3 = @board[win[2]]

    if (position1=="X" && position2 == "X" && position3 == "X")||(position1=="O" && position2 == "O" && position3 == "O")
      return win
    end
  end
  return false
end

  def full?
   turn_count == 9
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || full? || draw?
  end

  def winner
    if won?
      return @board[won?[0]]
    end
  end

  def play
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


