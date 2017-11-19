class TicTacToe

  def initialize(board = nil)
    @board = board ||= Array.new(9, " ")
  end

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [6,4,2], # Top right to bottom left
  [0,4,8]  # Top left to bottom right
]

  def play
    while turn_count < 9 && !over?
      turn
    end
    if over?
      if draw?
        puts "Cats Game!"
      else
        puts "Congratulations #{winner}!"
      end
    end
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, char="X")
    @board[position.to_i - 1] = char
  end

  def position_taken?(location)
    !(@board[location].nil? || @board[location] == " ")
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
  end

  def turn
    puts "Please enter 1-9:"
    position = gets.strip
    if valid_move?(position)
      move(position, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    turns = 0
    @board.each do |space|
      if space == "X" || space == "O"
        turns += 1
      end
    end
    turns
  end

  def current_player
    turns = turn_count
    if turns % 2 == 0
      "X"
    else
      "O"
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combo|
      win_index_1 = win_combo[0]
      win_index_2 = win_combo[1]
      win_index_3 = win_combo[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combo
      end
    end
    nil
  end

  def full?
    !@board.include?(" ")
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || full? || draw?
  end

  def winner
    unless won? == nil
      win_combo = won?
      @board[win_combo[0]]
    end
  end

end
