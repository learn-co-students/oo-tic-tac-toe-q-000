class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],   #top row
    [3, 4, 5],   #middle row
    [6, 7, 8],   #bot row
    [0, 3, 6],   #L column
    [1, 4, 7],   #M column
    [2, 5, 8],   #R column
    [0, 4, 8],   #LD diagonal
    [6, 4, 2]    #RU diagonal
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

  # Helper Method
  def position_taken?(location)
    !(@board[location].nil? || @board[location] == " ")
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
  end


  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
      move(input, current_player)
    else
      turn
    end
    display_board
  end

  def turn_count
    counter = 0
    @board.each do |value|
      if value != " " && value != ""
        counter +=1
      end
    end
    counter
  end

  def current_player
    counter = turn_count
    counter % 2 == 0 ? "X" : "O"
  end

  def won?
    #WIN_COMBINATIONS.any? { |combo| combo.all? {|item| item == "X"} }
    winner = WIN_COMBINATIONS.detect { |combo|
      combo.all? {|item| @board[item] == "X" } || combo.all? {|item| @board[item] == "O" }
      }
    winner.nil? ? nil : winner
  end

  def full?
    is_full = WIN_COMBINATIONS.all? do |combo|
      combo.all? {|item| position_taken?(item)}
    end
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw? || full?
  end

  def winner
    won?.nil? ? nil : @board[won?[0]]
  end

  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

end
