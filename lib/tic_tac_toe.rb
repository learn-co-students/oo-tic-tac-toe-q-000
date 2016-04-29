class TicTacToe
  def initialize(board = nil)
    @board = Array.new(9, " ")
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

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, token)
    index = position.to_i - 1
    @board[index] = token
  end

  def position_taken?(position)
    !(@board[position] == " " || @board[position] == "" || @board[position] == nil)
  end

  def valid_move?(position)
    index = position.to_i - 1

    if index > 8 || index < 0
      false
    else
      !position_taken?(index)
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
    count = @board.select {|i| i != " "}
    count.length
  end

  def current_player
    if turn_count % 2 == 0
      player = "X"
    else
      player = "O"
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


  def won?

    WIN_COMBINATIONS.detect do |win_combination|
        if win_combination.all? {|i| @board[i] == "X"} || win_combination.all? {|i| @board[i] == "O"}
          win_combination
        else
          false
        end
    end

  end

  def full?
    !(@board.include?(" ") || @board.include?(nil))
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw?
  end

  def winner
    if won?
      @board[won?[0]]
    else
      nil
    end
  end


end
