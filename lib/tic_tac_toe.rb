class TicTacToe
  def initialize
    @board = [' ', ' ', ' ',' ', ' ', ' ',' ', ' ', ' ']
  end

  WIN_COMBINATIONS = [
    [0,1,2], # Top Row
    [3,4,5], # Middle Row
    [6,7,8], # Bottom Row
    [0,3,6], # Left Row
    [1,4,7], # Center Row
    [2,5,8], # Right Row
    [0,4,8], # Right Diagonal
    [2,4,6]  # Left Diagonal
  ]

  def display_board
    row = '-----------'
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts row
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts row
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, character)
    @board[index] = character
  end

  def position_taken?(index)
    !(@board[index] == ' ' || @board[index] == '' || @board[index] == nil)
  end

  def valid_move?(index)
    index.between?(0, 8) && !position_taken?(index)
  end

  def turn
    puts 'Please enter 1-9:'
    user_input = gets.strip
    index = input_to_index(user_input)

    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    count = 0

    @board.each_with_index do |location, index|
      if position_taken?(index)
        count = count + 1
      end
    end

    count
  end

  def current_player
    turn_count.even? ? 'X' : 'O'
  end

  def won?
    if @board.all? { |place| place == ' ' }
      return false
    end
    for combo in WIN_COMBINATIONS
      if combo.all? { |index| @board[index] == 'X' }
        return combo
      elsif combo.all? { |index| @board[index] == 'O' }
        return combo
      end
    end
    false
  end

  def full?
    @board.all? { |place| place != ' ' }
  end

  def draw?
    full? && !won?
  end

  def over?
    if won?
      return true
    end

    draw? || full?
  end

  def winner
    if won?
      @board[won?[0]]
    end
  end
  # TicTacToe.rb
  def play
    # until the game is over
    until over?
      # take turns
      turn
    end

    # if the game was won
    if won?
      # congratulate the winner
      puts 'Congratulations ' + winner + '!'
    # else if the game was a draw
    elsif draw?
      # tell the players it has been a draw
      puts "Cat's Game!"
    end
  end
end
