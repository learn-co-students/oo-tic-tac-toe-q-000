class TicTacToe
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

  def initialize(board = Array.new(9, " "))
    @board = board
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(index, current)
    index = index - 1
    @board[index] = current
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(position)
    position = position.to_i
    position = position - 1
    position.between?(0,8) && !position_taken?(position)
  end

  def turn
    input = gets.strip
    position = input.to_i
    if valid_move?(position)
      current = current_player
      move(position, current)
      display_board
    else
      puts "Choose an unoccupied space!"
      turn
    end
  end

  def turn_count
    turns = 0
    @board.each do |pos|
      if pos == "X" || pos == "O"
        turns += 1
      end
    end
    turns
  end

  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end

  def won?
    board_x = @board.each_index.select{ |i| @board[i] == "X" }
    board_o = @board.each_index.select{ |i| @board[i] == "O" }
    result = false
    WIN_COMBINATIONS.each do |win_combination|
      if win_combination.all?{ |w| board_x.include?(w) } || win_combination.all?{ |w| board_o.include?(w)}
        result = win_combination
        break;
      end
    end
    result
  end

  def full?
    @board.all?{ |b| b != " " && b != "" && b != nil}
  end

  def draw?
    full? && won? == false
  end

  def over?
    won? || draw?
  end

  def winner
    if won? != false
      @board[won?[0]]
    else
      nil
    end
  end

  def play
    display_board
    while !over?
      puts "Please enter 1-9:"
      turn
    end
    if draw?
      puts "Cats Game!"
    else
      puts "Congratulations #{winner}!"
    end
  end

end
