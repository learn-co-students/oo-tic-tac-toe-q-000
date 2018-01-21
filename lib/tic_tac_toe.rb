class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

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

  def move(location, current_player="X")
    @board[location.to_i - 1] = current_player
  end

  def play
    until over?
      turn

      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cats Game!"
      end
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
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
    @board.select { |location| location == "O" || location == "X" }.length
  end

  def winner
    sequence = won?
    sequence.is_a?(Array) ? @board[sequence[0]] : nil
  end

  def draw?
    if full? && !won?
      true
    end
  end

  def full?
    @board.select { |location| location != " " }.length == 9 ? true : false
  end

  def over?
    if full? || draw? || won?
      true
    end
  end

  def position_taken?(location)
    !(@board[location].nil? || @board[location] == " " || @board[location] == "")
  end

  def won?
    WIN_COMBINATIONS.any? do |combination|
      if combination.all? { |x| @board[x] == "X" } || combination.all? { |o| @board[o] == "O"}
        return combination
      end
    end
  end

  def valid_move?(location)
    location.to_i.between?(1,9) && !position_taken?(location.to_i - 1)
  end
end