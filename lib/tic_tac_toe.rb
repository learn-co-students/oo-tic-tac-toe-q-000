class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 4, 8],
    [2, 4, 6],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    index = input.to_i - 1
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def move(index, current_player = "X")
    @board[index] = current_player
  end

  def position_taken?(index)
    !(@board[index] == nil || @board[index] == " ")
  end

  def valid_move?(index)
    !(position_taken?(index) || index < 0 || index > 9)
  end

  def turn
    puts "Please enter a number 1-9"
    input = gets.strip
    index = input_to_index(input)
    if !valid_move?(index)
      turn
      move(index, current_player)
      display_board
    else
      move(index, current_player)
      display_board
    end
  end

  def won?
    result = false
    WIN_COMBINATIONS.each do |winning_combination|
        if winning_combination.all? {|i| @board[i] == "X"} || winning_combination.all?{|i| @board[i] == "O"}
          result = winning_combination
        end
      end
    return result
  end

  def full?
    @board.all? {|i| (i == "X" || i == "O")}
  end

  def draw?
    !won? && full?
  end

  def over?
    draw? || won?
  end

  def winner
    if over?
      if won?
        return @board[won?[0]]
      else
        return nil
      end
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations " + winner + "!"
    end
    if draw?
      puts "Cat's Game!"
    end
  end


end
