class TicTacToe
  #................initialize
  def initialize
    @board = Array.new(9, " ")
  end

  def board=(board)
    @board = board
  end

  def board
    @board
  end

  #...............WIN_COMBINATIONS
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]
  #.............................display_board
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  #...........................input
  def inpot_to_index(input)
    location = input.to_i-1
    return location
  end
  #..........................move
  def move( location, current_player)
    location = inpot_to_index(location)
    @board[location] = current_player
  end
  #...............................position_taken
  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end
  #...............................valid_move
  def valid_move?(location)
    if location.is_a?(String)
      location = inpot_to_index(location)
    end
    location.between?(0,8) && !position_taken?(location)
  end
  #...............................turn
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    location = input
    if valid_move?(location)
      move(location , current_player)
      display_board
    else
      turn
    end
  end
  #.........................turn_count
  def turn_count
    counter = 0
    @board.each do |loc|
      if loc != " "
        counter += 1
      end
    end
    return counter
  end
  #.........................current_player
  def current_player
    return (turn_count % 2 == 0)? "X": "O"
  end
  #........................won
  def won?
    WIN_COMBINATIONS.each do |list|
      check = false
      list.each do |loc|
        if position_taken?(loc)
          check = true
        else
          check = false
        end
      end
      if (check) && (list.all? { |state| @board[state] == "X" }) || (list.all? { |state| @board[state] == "O" })
        return list
      end
    end
    return false
  end
  #..........................full
  def full?
    return @board.all? { |state|  state == "X" || state == "O" }
  end
  #..............................draw
  def draw?
    temp1 = full?
    temp2 = won?
    return (temp1 && temp2 == false)? true : false
  end
  #...........................over
  def over?
    return (full? || won? != false || draw?) ? true : false
  end
  #............................winner
  def winner
    temp  = won?
    return (temp == false) ? nil : @board[temp[0]]
  end
  #........................play
  def play

    until over?
      turn
    end
    if won? != false
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end
  #...........................

end
game = TicTacToe.new
board = ["X", "X", "X", " ", " ", " ", " ", " ", " "]
game.board = board
game.play
