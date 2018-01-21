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

  def move(input, player="X")
    index = input.to_i - 1
    @board[index] = player
  end

  def position_taken?(position)
    if (@board[position] == " " || @board[position] == "" || @board[position] == nil)
      false
    else
      true
    end
  end

  def valid_move?(position)
    position = position.to_i
    index = position - 1
    if(!position_taken?(index) && position.between?(1, 9))
      true
    else
      false
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if !valid_move?(input)
      turn
    end
    move(input, current_player)
    display_board
  end

  def turn_count
    @board.count {|token| token == "X" or token == "O"}
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  # Helper Method
  def position_taken?(location)
    !(@board[location].nil? || @board[location] == " ")
  end

  def won?
    WIN_COMBINATIONS.any? do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

      if ((position_1 == "X" and position_2 == "X" and position_3 == "X") or
          (position_1 == "O" and position_2 == "O" and position_3 == "O"))
        return win_combination
      else
        false
      end
    end
  end

  def full?
    !(@board.include?(" ") or @board.include?("") or @board.include?(nil))
  end

  def draw?
    (!won? and full?) and !(!won? and !full?) and !(won?)
  end

  def over?
    won? or draw? or full?
  end

  def winner
    if won? != false
      winner_array = won?
      @board[winner_array[0]]
    else
      nil
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