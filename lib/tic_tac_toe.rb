class TicTacToe


  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
 #   puts "Welcome to Tic Tac Toe!"
 #   play
  end

  def new

  end

  WIN_COMBINATIONS= [
      [0,1,2],  #top row
      [3,4,5], #middle row
      [6,7,8],  #bottom row
      [0,3,6],  #left column
      [1,4,7],  #middle column
      [2,5,8],  #right column
      [0,4,8],  #diagonal 1
      [6,4,2]   #diagonal 2
  ]

  def won?
    $winner = nil
    returnable = []
    WIN_COMBINATIONS.each do |win_combo|
      if @board[win_combo[0]] == "X" && @board[win_combo[1]] == "X" && @board[win_combo[2]] == "X"
        $winner = "X"
        returnable = win_combo
        break
      elsif @board[win_combo[0]] == "O" && @board[win_combo[1]] == "O" && @board[win_combo[2]] == "O"
        $winner = "O"
        returnable = win_combo
        break
      else
        returnable = false
      end
    end
    returnable
  end

  def full?
    full = @board.include?(" ")
    !full
  end

  def draw?
    if full? == true && won? == false
      true
    end
  end

  def over?
    if draw? || won?
      true
    end
  end

  def winner
    over?
    $winner
  end

  def turn_count
    counter = 0
    @board.each do |p|
      if p != " "
        counter += 1
      end
    end
    counter
  end

  def current_player
    player = turn_count
    if player.even?
      player = "X"
    else
      player = "O"
    end
    player
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(location, current_player)
    @board[location.to_i-1] = current_player
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets
    if valid_move?(input)
      move(input, current_player)
    else
      turn
    end
    display_board
  end


  def play
    until over?
      turn
    end
    if draw?
      puts "Cats Game!"
    else
      puts "Congratulations #{$winner}!"
    end
  end

end