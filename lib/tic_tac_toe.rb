class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, player = "X")
    @board[position.to_i-1] = player
  end

  def position_taken?(position)
    @board[position] == "X" || @board[position] == "O" ? true : false
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
  end

  def turn_count
    turn_num = 0
    @board.each do |position|
      if position == "X" || position == "O"
        turn_num += 1
      end
    end
    turn_num
  end

  def current_player
    turn_count.even? ? player = "X" : player = "O"
  end

  def won?
    WIN_COMBINATIONS.any? do |win_combination|
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
      else
        false
      end
    end
  end

  def full?
    @board.include?(" ") ? false : true
  end

  def draw?
    full? && !won? ? true : false
  end

  def over?
    draw? || won? ? true : false
  end

  def winner
    if won?
      win_array = won?
      win_index = win_array[0]
      @board[win_index]
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
      player = current_player
      move(input, player)
    else
      puts "Sorry, that move is invalid."
      turn
    end
    display_board
  end

  def greeting
    puts "Welcome to Tic Tac Toe!"
    puts "Would you like to play a game?"
    display_board
  end

  def play
    greeting
    until over?
      turn
    end
    if won?
      champ = winner
      puts "Congratulations #{champ}!" # Should really be: "Congrats, #{champ}! :D"
    elsif draw?
      puts "Cats Game!" # Should really be: "It's a draw! :/ Better luck next time."
    end
  end

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

end