class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [6,4,2],
  [0,3,6],
  [1,4,7],
  [2,5,8]
  ]


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
    !(@board[location].nil? || @board[location] == " ")
  end

  def valid_move?(location)
    location.to_i.between?(1, 9) && !position_taken?(location.to_i-1)
  end

  def turn
    puts "Please enter 1-9:"
    location = gets.strip
    if !valid_move?(location)
      turn
    end
    move(location, current_player)
    display_board
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
      WIN_COMBINATIONS.find { |winning_move|
      position_taken?(winning_move[0]) &&
        @board[winning_move[0]] == @board[winning_move[1]] &&
        @board[winning_move[1]] == @board[winning_move[2]]
    }
  end

  def full?
    @board.all? { |occupied| occupied == "X" || occupied == "O" }
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    if won?
      winning_combo = won?
      @board[winning_combo[0]]
    else
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
    else
    end
  end

end