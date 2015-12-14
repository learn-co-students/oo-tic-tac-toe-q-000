class TicTacToe
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

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def position_taken?(position)
    if @board[position] == " " || @board[position] == "" || @board[position] == nil
      return false
    else
      return true
    end
  end

  def valid_move?(position)
    position = position.to_i - 1
    position_taken?(position) == false && position.between?(0, @board.length)
  end

  def move(position, token="X")
    position = position.to_i - 1
    @board[position] = token
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
      move(input, current_player)
    else
      turn()
    end
    display_board()
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      if ((@board[win_combination[0]] == "X" && @board[win_combination[1]] == "X" && @board[win_combination[2]] == "X") || 
        (@board[win_combination[0]] == "O" && @board[win_combination[1]] == "O" && @board[win_combination[2]] == "O"))
        return win_combination
      end
    end
    return false
  end

  def full?
    @board.none? { |i| i == " " }
  end

  def draw?
    return won? == false && full? ? true : false
  end

  def over?
    won? || full? || draw?
  end

  def winner
    return won? ? @board[won?[0]] : nil
  end

  def play
    until over? do
      turn()
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

end