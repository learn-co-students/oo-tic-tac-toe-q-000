# tic tac toe
class TicTacToe
  def initialize(board = nil) # this argument might be pointless
    @board = board || Array.new(9, " ")
  end

  # An array of all possible win combinations
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    #[2, 4, 6],
    [6, 4, 2]
  ]

  def display_board
    horiz_line = "-----------"
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts horiz_line
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts horiz_line
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  # move method
  def move(location , player_character = "X")
    location = location.to_i
    @board[location-1] = player_character
    return @board
  end

  # position_taken method
  def position_taken?( position )
    if @board[position] == " " || @board[position] == "" || @board[position] == nil
      false
    else
      true
    end
  end

  # takes the User input position i.e. Chars from 1 to 9
  def valid_move?( position )
    position_int = position.to_i
    position_ary = position_int - 1
    if !(position_taken?( position_ary )) && position_ary.between?( 0, 8 )
      true
    else
      false
    end
  end

  # turn method prompts for user input, checks for valid move, and
  # executes a turn using move()
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?( input)
      player_character = current_player()
      move( input, player_character)
    else
      turn()
    end
    display_board()
  end

  # turn count
  def turn_count
    counter = 0
    @board.each do |element|
      if element == " " || element == ""
        #
      else
        counter += 1
      end
    end
    counter
  end

  # current_player assumes that the first player was "X"
  # it uses turn_count to calculate whose turn it is.
  def current_player()
    num_moves = turn_count()
    # using ternary operator
    num_moves % 2 == 0 ? current_player = "X" : current_player = "O"
    current_player
  end

  # returns false or nil if no win, and the winning array combo if there is a win
  def won?()
    WIN_COMBINATIONS.each do |combination| #iterate over WIN_COMBINATIONS
      if position_taken?( combination[0]) #only check for a win if the position is taken
        if @board[combination[0]] == @board[combination[1]] && @board[combination[0]] == @board[combination[2]]
          return combination
        end
      end
    end
    nil
  end

  def full?()
    @board.all? do |marker|
      marker != " " && marker != nil
    end
  end

  def draw?()
    full?() && !won?()
  end

  def over?()
    won?() || draw?()
  end

  def winner()
    win_combo = won?()
    if win_combo
      return @board[win_combo[0]]
    end
  end

  # main play method
  def play()
    until over?()
      turn()
    end
    if won?()
      #congrats
      puts "Congratulations #{winner()}!"
    else
      # it was a draw
      puts "Cats Game!"
    end
  end

end
