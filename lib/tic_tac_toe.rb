class TicTacToe

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

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  # Run the game utill a player wins or there is a draw
  def play
    while !over?
      turn()
    end

    if won?
      puts "Congratulations #{winner()}!"
    elsif draw?
      puts "Cats Game!"
    end
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
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
  end

  # Return current player
  def current_player()
    (turn_count() % 2 == 0)? "X" : "O"
  end

  def turn
    print "Please enter 1-9: "
    input = gets.strip
    if valid_move?(input)
      move(input, current_player())
    else
      puts "Wrong move buddy!"
      turn()
      return
    end
    display_board()
  end

  # Count number of current moves
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end


  # Check if game is won.
  def won?
    WIN_COMBINATIONS.each do |combo|
      match = combo.all? { |i| @board[i] == "X" } || combo.all? { |i| @board[i] == "O" }
      if match then return combo end
    end

    false
  end

  # Check if board is full
  def full?
    @board.all? { |cell| !(cell.nil? || cell == " ") }
  end

  # Ckeck for draw
  def draw?
    full? && !won?
  end

  # Check if the is over
  def over?
    won? || draw?
  end

  # Return winning token
  def winner
    if combo = won?
      @board[combo[0]]
    end
  end

end
