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

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, char = "X")
    @board[position.to_i - 1] = char
  end

  def position_taken?(position)
    !(@board[position].nil? || @board[position] == " ")
  end

  def valid_move?(position)
    index = position.to_i - 1 
    if index < 0 || position_taken?(index) || index > @board.count - 1 
      return false
    end
    return true
  end

  def turn
   puts "Please enter 1-9:"
    user_input = gets.chomp 
    if valid_move?(user_input) 
      move(user_input, current_player)
      display_board
    else
      turn
    end
  end

  def play
    display_board
    puts "Where would you like to go?"
    counter = 0
    while counter < 9
      if over?
        break
      end
      turn
      counter += 1
    end
  end

  def won?
    WIN_COMBINATIONS.each do |winning|
    if @board[winning[0]].eql?("X") && @board[winning[1]].eql?("X") && @board[winning[2]].eql?("X")
      puts "Congratulations X!"
      return winning
    elsif @board[winning[0]].eql?("O") && @board[winning[1]].eql?("O") && @board[winning[2]].eql?("O")
      puts "Congratulations O!"
        return winning
    end
    end
    return nil
  end

  def full?
    return !@board.include?(" ")
  end

  def draw?
    if !full? && !won?
      return false
    elsif won?
      return false
    elsif !full?
      return false
    end
    puts "Cats Game!"
    return true
  end

  def over?
    if full? || won? || draw?
      return true
    end
    return false
  end

  def winner
    winning_indexes = won?
    if winning_indexes != nil && winning_indexes.count == 3
      return @board[winning_indexes[0]]
    end
    return nil
  end

end
