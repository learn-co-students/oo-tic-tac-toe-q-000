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
  def initialize
    @board = Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(location, token="X")
    @board[location.to_i - 1] = token
  end

  def position_taken?(position)
    @board[position] != " " and @board[position] != ""
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
  end

  def turn
    puts "Please enter a number 1-9:"
    input = gets.chomp
    if valid_move?(input)
      move(input, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    number_of_turns = 0
    @board.each do |position|
      if position.to_s != "" and position.to_s != " "
        number_of_turns += 1
      end
    end
    number_of_turns
  end

  def current_player
    if turn_count % 2 == 0 or turn_count == 0
      "X"
    else
      "O"
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]

    if position_taken?(win_index_1) && position_taken?(win_index_2) && position_taken?(win_index_3)
      if (position_1 == "X" and position_2 == "X" and position_3 == "X") || (position_1 == "O" and position_2 == "O" and position_3 == "O")
        return win_combination
      else
        false
      end
      false
    end
    false
  end
  false
  end

  def full?
    if @board.all? {|space| space == "X" or space == "O"}
      true
    else
      false
    end
  end

  def draw?
    if !won? and full?
      true
    elsif won?
      false
    end
  end

  def over?
    if won? or draw? or full?
      true
    else
      false
    end
  end

  def winner
    winning_index = won?
    if won?
      if @board[winning_index[0]] == "X" and @board[winning_index[1]] == "X" and @board[winning_index[2]] == "X"
        "X"
      elsif @board[winning_index[0]] == "O" and @board[winning_index[1]] == "O" and @board[winning_index[2]] == "O"
        "O"
      end
    else
      nil
    end
  end

  def play
    while !over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

end