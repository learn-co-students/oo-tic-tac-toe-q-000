class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

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

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [6,4,2],
    [0,4,8]
  ]

  def move(location, character = "X")
    @board[location.to_i - 1] = character
  end

  def position_taken?(location)
    !(@board[location.to_i] == "" || @board[location.to_i] == " ")
  end

  def valid_move?(location)
    location.to_i.between?(1,9) && !(position_taken?(location.to_i - 1))
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

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      end
    end
    return nil
  end

  def full?
    turn_count == 9
  end

  def draw?
    full? && !(won?)
  end

  def over?
    won? || draw? || full?
  end

  def winner
    if (won?)
      @board[won?[0]]
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
    else
      puts "Cats Game!"
    end
  end
end