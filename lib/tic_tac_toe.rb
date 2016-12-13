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
      [2,4,6]
    ]

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

  def move (input, value)
    @board[input-1]=value
  end

  def position_taken? (index)
    @board[index] != " " && @board[index] != ""
  end
#index assumes input-1 based upon errors. Placing "input-1" instead of index caused an error.
  def valid_move? (index)
    index.to_i.between?(1,9) && !position_taken?(index.to_i - 1)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip.to_i
    index = input
    if valid_move?(index)
      value = current_player
      move(input,value)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.find do |combo|
      if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X" ||
        @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
        true
      end
    end
  end

  def full?
    @board.all? do |position|
      position != " "
    end
  end

  def draw?
    !won? && full?
  end

  def over?
    if won? || draw? || full?
      true
    else
      false
    end
  end

  def winner
    WIN_COMBINATIONS.find do |combo|
      if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
        return "X"
      elsif  @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
        return "O"
      end
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
    end
  end
end
