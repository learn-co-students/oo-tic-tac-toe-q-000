class TicTacToe
  def initialize(board = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
    @board = board
  end

  #Helper Methods
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(index, team)
    @board[index] = team
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def valid_move? (index)
    !position_taken?(index) && index.between?(0, 8)
  end

  def position_taken?(index)
    @board[index] != " " && @board[index] != "" && @board[index] != nil
  end

  def turn_count
    turns = 0
    @board.each{|tile| turns += 1 if  tile == "X" || tile == "O"}
    turns
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  WIN_COMBINATIONS = [
    [0,1,2], #Top horizontal
    [3,4,5], #Mid horizontal
    [6,7,8], #Bot horizontal
    [0,3,6], #Left vertical
    [1,4,7], #Mid vertical
    [2,5,8], #Right vertical
    [0,4,8], #Downward diagonal
    [2,4,6] #Upward diagonal
  ]

  def won?
    WIN_COMBINATIONS.each do |combination|
      if combination.all?{|index| @board[index] == "X"} || combination.all?{|index| @board[index] == "O"}
        return combination
      end
    end
    false
  end

  def full?
    @board.all?{|tile| !(tile.nil? || tile == " " || tile == "")}
  end

  def draw?
    !won? && full?
  end

  def over?
    full? || won? || draw?
  end

  def winner
    if won? && won?.all?{|index| @board[index] == "X"}
      "X"
    elsif won? && won?.all?{|index| @board[index] == "O"}
      "O"
    end
  end


  #One turn
  def turn
    validated = false
    until validated == true
      puts "Please enter 1-9:"
      index = input_to_index(gets.strip)
      validated = valid_move?(index)
    end
    move(index, current_player)
    display_board
  end

  #Play loop
  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cats Game!"
    end
  end
end
