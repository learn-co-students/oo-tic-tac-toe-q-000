class TicTacToe
  WIN_COMBINATIONS=[
    [0,1,2],
    [0,3,6],
    [0,4,8],
    [1,4,7],
    [2,5,8],
    [6,4,2],
    [3,4,5],
    [6,7,8]
   ]

  def initialize
    @board=Array.new(9," ")
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
    @board[location] != " " && board[location] != ""
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
    turn_count=0
    @board.each do |mark|
      if mark=="X"||mark=="O"
        turn_count+=1
      end
    end
    turn_count
  end

  def current_player
    if turn_count%2==0
      "X"
    else
      "O"
    end
  end

  def position_taken?(location)
    !(@board[location].nil? || @board[location] == " ")
  end

  def x_won?(combo)
    combo.all?{|position| @board[position]=="X"}
  end

  def y_won?(combo)
    combo.all?{|position| @board[position]=="O"}
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      x_won?(combo)||y_won?(combo)
    end
  end

  def full?
    @board.all? {|element| element=="X"||element=="O"}
  end

  def draw?
    full?&&!won?
  end

  def over?
    draw?||won?
  end

  def winner
    if won?
      if @board[won?[0]]=="X"
        "X"
      else
        "O"
      end
    end
  end

  # Define your play method below
  def play
    until over?
      turn
    end
    if draw?
      puts "Cats Game!"
    elsif won?
      puts "Congratulations #{winner}!"
    end

  end
end