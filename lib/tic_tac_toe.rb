class TicTacToe

  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end

  def board
    @board
  end

  WIN_COMBINATIONS = [
    [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]
  ]

  def display_board
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(input, current_player)
    index = input_to_index(input)
    board[index] = current_player
  end

  def position_taken?(location)
    board[location] != " " && board[location] != ""
  end

  def valid_move?(input)
    index = input_to_index(input)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn
    current = current_player
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
      move(input, current)
      display_board
    else
      turn
    end
  end

  def turn_count
    counter = 0
    board.each do |position|
      if (position == "X") || (position == "O")
        counter += 1
      end
    end
    return counter
  end

  def current_player
    counter = turn_count
    if counter % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      index_one = win_combination[0]
      index_two = win_combination[1]
      index_three = win_combination[2]

      position_one = board[index_one]
      position_two = board[index_two]
      position_three = board[index_three]

      (position_one == "X" && position_two == "X" && position_three == "X") ||
        (position_one == "O" && position_two == "O" && position_three == "O")
    end
  end

  def full?
    board.all? do |position|
      position == "X" || position == "O"
    end
  end

  def draw?
    if won?
      return false
    elsif full?
      return true
    else
      return false
    end
  end

  def over?
    if draw? || won?
      return true
    else
      return false
    end
  end

  def winner
    if !won? || draw?
      return nil
    else
      winning_board = won?
      win_index = winning_board[0]
      return board[win_index]
    end
  end

  def play
    until over?
      turn
    end
    if draw?
      puts "Cats Game!"
    end
    if won?
      puts "Congratulations #{winner}!"
    end
  end

end
