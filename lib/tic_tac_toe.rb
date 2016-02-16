class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(input, character="X")
    location = input.to_i
    newloc = location-1
    @board[newloc] = character
  end

  def position_taken?(position)
    if @board[position] == "X" || @board[position] == "O"
      return true
    else
      return false
    end
  end

  def valid_move?(position_string)
    position=position_string.to_i
    if (position < 1 || position > 9) || position_taken?(position-1)
      return false
    else
      return true
    end
  end

  def turn
    invalid = true
    while invalid
      puts "Please enter a move 1-9:"
      input = gets.strip
      if valid_move?(input)
        invalid = false
      end
    end
    move(input, current_player)
    display_board
  end

  def won?
    winning_set = nil
    won = false
    counter = 0
    position = ["", "", ""]

    WIN_COMBINATIONS.each do |i|
      counter = 0
      i.each do |m|
        position[counter] = @board[m]
        counter += 1
      end
      if (position[0] == "X" && position[1] == "X" && position[2] == "X") ||
         (position[0] == "O" && position[1] == "O" && position[2] == "O")
        won = true
      end
      if won
        winning_set = i
        break
      end
    end

    if won
      #puts 'winning_set = ' + winning_set.to_s
      return winning_set
    else return false
    end
  end#won

  def full?
    full_board = true
    @board.each do |i|
      if !(i == "X" || i == "O")
        full_board = false
      end
    end
    return full_board
  end

  def draw?
  #returns true if the board has not been won and is full
  #false if the board is not won and the board is not full
  #false if the board is won.
    if won?
      return false
    end
    if full?
      return true
    else
      return false
    end
  end

  def over?
    #returns true if the board has been won,
    #is a draw,
    #or is full
    if won? || draw?
      return true
    else
      return false
    end
  end

  def winner
    winner = won?
    if winner
      return @board[winner[0]]
    else
      return nil
    end
  end

  def play
    while !over? do
      turn
    end
    if winner
      puts "Congratulations " + winner + "!"
      elsif draw?
      puts "Cats Game!"
    end
  end

end #class TicTacToe

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
