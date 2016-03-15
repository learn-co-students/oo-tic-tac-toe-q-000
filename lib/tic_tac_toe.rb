class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end


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


  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end


  def move(position, character = "X")
    @board[position.to_i-1] = character
  end


  def position_taken?(location)
    !(@board[location].nil? || @board[location] == " ")
  end


  def valid_move?(position)
    position.to_i.between?(1, 9) && !position_taken?(position.to_i - 1)
  end


  def turn_count
    count = 0

    @board.each do |turn|
      if turn == "X" || turn == "O"
        count += 1
      end
    end
    return count
  end


  def current_player
    turn_count.even? ? "X" : "O"
  end


  def turn
    puts "Please enter 1-9:"
    position = gets.strip
    character = current_player

    until valid_move?(position) == true
      puts "Sorry, that's not a valid move."
      puts "Please enter 1-9 again:"
      position = gets.strip
    end

    move(position, character)
    display_board
  end


  def won?
    WIN_COMBINATIONS.each do |win_array|
      position_1 = @board[win_array[0]]
      position_2 = @board[win_array[1]]
      position_3 = @board[win_array[2]]

      if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O" 
        return win_array
      end
    end
    false
  end


  def full?
    @board.all? do |position|
      position == "X" || position == "O"
    end
  end


  def draw?
    if !won? && full?
      return true
    elsif won? && full? || !(won? && full?)
      return false
    end
  end


  def over?
    if won? || draw? || full?
      return true
    else
      return false
    end
  end

  def winner
    if won?
      token = won?[0]

      return @board[token]
    end
  end


  def play
    until over?
      turn
    end
   
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cats Game!"
    end
  end

end























































