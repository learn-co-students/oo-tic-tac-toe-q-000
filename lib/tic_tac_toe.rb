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
    @board = board || @board = Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, mark="X")
    @board[(position.to_i) - 1] = mark
  end

  def position_taken?(position)
    !(@board[position].nil? || @board[position] == " ")
  end

  def valid_move?(position)
    if position == "invalid"
      return false
    end
    if (position.to_i) - 1 <= 8 && !self.position_taken?((position.to_i) - 1)
      return true
    else
      return false
    end
  end

  def turn(mark="X")
    mark = self.current_player
    puts "Please enter 1-9:"
    input = gets.strip
    while !self.valid_move?(input)
      puts "Please enter 1-9:"
      input = gets.strip
    end
    self.move(input, mark)
  end

  def turn_count
    @board.count{ |token| token == "X" || token == "O" }
  end

  def current_player
    self.turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      position1 = @board[combo[0]]
      position2 = @board[combo[1]]
      position3 = @board[combo[2]]

      if (position1 == "X" && position2 == "X" && position3 == "X") || (position1 == "O" && position2 == "O" && position3 == "O")
        return combo
      end
    end
    return false
  end

  def full?
    !@board.any?{ |i| i == " " || i.nil? }
  end

  def draw?
    if self.full? && !self.won?
      return true
    else
      return false
    end
  end

  def over?
    if self.draw? || self.won?
      return true
    else
      return false
    end
  end

  def winner
    if self.won?
      return @board[self.won?[0]]
    else
      return nil
    end
  end

  def play
    while !self.over?
      self.turn
    end
    if self.draw?
      puts "Cats Game!"
    end
    if self.winner == "X"
      puts "Congratulations X!"
    end
    if self.winner == "O"
      puts "Congratulations O!"
    end
  end
end