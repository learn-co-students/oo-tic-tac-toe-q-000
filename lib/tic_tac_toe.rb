class TicTacToe
  WIN_COMBINATIONS = [[0, 1, 2],
                    [3, 4, 5],
                    [6, 7, 8],
                    [0, 3, 6],
                    [1, 4, 7],
                    [2, 5, 8],
                    [0, 4, 8],
                    [6, 4, 2]]

  @board = nil

  def initialize(board = nil)
    @board = board || Array.new(9, ' ')
  end

  def display_board()
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, player='X')
    @board[position.to_i - 1] = player
  end

  def position_taken?(position)
    if (@board[position] == 'X' || @board[position] == 'O')
      return true
    end
    return false
  end

  def valid_move?(position)
    if (position.to_i < 1 || position.to_i > 9)
      return false
    end
    return !position_taken?(position.to_i - 1)
  end

  def turn()
   loop do
      puts 'Please enter 1-9:'
      input = gets.strip
      if valid_move?(input)
        move(input, current_player())
        display_board()
        break
      end
    end
  end

  def turn_count()
    count = 0
    @board.each do |brd|
      if brd == 'X' || brd == 'O'
        count +=  1
      end
    end
    return count
  end

  def current_player()
    if turn_count() == 0 || turn_count() % 2 == 0
      return 'X'
    end
    return 'O'
  end

  def won?()
    WIN_COMBINATIONS.each do |win|
      if ((@board[win[0]] == 'X' &&
           @board[win[1]] == 'X' &&
           @board[win[2]] == 'X') || (@board[win[0]] == 'O' &&
                                      @board[win[1]] == 'O' &&
                                      @board[win[2]] == 'O'))
        return win
      end
    end
    return false
  end

  def full?()
    @board.each do |pos|
        if !(pos == 'X' || pos == 'O')
          return false
        end
    end
    return true
  end

  def draw?()
    if !won?() && full?()
      return true
    end
    return false
  end

  def over?()
    if won?() || draw?()
      return true
    end
    return false
  end

  def winner()
    if won?()
      return @board[won?()[0]]
    end
    return
  end

  def play()
    until over?()
      turn()
    end

    if won?()
      puts "Congratulations #{winner()}!"
    elsif draw?()
      puts 'Cats Game!'
    else
      puts 'Game Over! Nobody won.'
    end
  end

end