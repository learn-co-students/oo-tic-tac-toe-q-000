class TicTacToe

  def initialize(board = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
    @board = board
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  WIN_COMBINATIONS = [
    [0,1,2], # top row
    [3,4,5], # middle row
    [6,7,8], # bottom row
    [0,3,6], # left column
    [1,4,7], # middle column
    [2,5,8], # right column
    [0,4,8], # diagonal from top left
    [6,4,2]  # diagonal from top right
  ]

  def move(input, current_player = "X")
    @board[input.to_i-1] = current_player
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(position)
   int = position.to_i
     if int >= 1 && int <= 9
       @board[int - 1] === " " ? true : false
     end
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

  def turn_count
    @board.count{|space| space == "O" || space == "X"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each do |wincombo|
      win1 = wincombo[0]
      win2 = wincombo[1]
      win3 = wincombo[2]

      position1 = @board[win1]
      position2 = @board[win2]
      position3 = @board[win3]

      if position1 == "X" && position2 == "X" && position3 == "X"
        return wincombo
      elsif position1 == "O" && position2 == "O" && position3 == "O"
        return wincombo
      end
    end
    false
  end

  def full?
    @board.all? do |index|
      index == "X" || index == "O"
    end
  end

  def draw?
    return false if won?.is_a?(Array)
    full? ? true : false
  end

  def over?
    draw? || won? ? true : false
  end

  def winner
    won? ? @board[won?[0]] : nil
  end

  def play
    until over?
      turn
    end
    if draw?
      puts "Cats Game!"
     else
      puts "Congratulations #{winner}!"
    end
  end

end
