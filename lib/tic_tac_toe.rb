class TicTacToe
  def initialize
    @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end

  WIN_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [6, 4, 2]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(location, token = current_player)
    @board[location.to_i - 1] = token
  end

  def position_taken?(position)
    !(@board[position].nil? || @board[position] == " ")
  end

  def valid_move?(position)
    position.to_i.between?(1, 9) && !position_taken?(position.to_i - 1)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
      move(input)
      display_board
    else
      turn
    end
  end

  def turn_count
    turn = 0
    @board.each_index {|i| turn += 1 if position_taken?(i)}
    turn
  end

  def current_player
    return 'X' if turn_count % 2 == 0
    return 'O' if turn_count % 2 != 0
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination| 

      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

      if position_1 == position_2 && position_2 == position_3 && position_taken?(win_combination[0])
        return win_combination
      else
        false
      end

    end
    false
  end

  def full?
    @board.all? {|x| x == 'X' || x == 'O'}
  end

  def draw?
    if !won? && full?
      true
    else
      false
    end
  end

  def over?
    if won? || draw? || full?
      true
    else
      false
    end
  end

  def winner
    if WIN_COMBINATIONS.any? {|x| @board[x[0]] == 'X' && @board[x[1]] == 'X' && @board[x[2]] == 'X'}
      'X'
    elsif WIN_COMBINATIONS.any? {|x| @board[x[0]] == 'O' && @board[x[1]] == 'O' && @board[x[2]] == 'O'}
      'O'
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