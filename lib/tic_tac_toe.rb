class TicTacToe
  def initialize(board = nil)
    @board = board || [" "," "," "," "," "," "," "," "," "]
  end

  def play
    while !over?
      turn
    end

    #Check for Coditions that end the Game
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
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
    [2,4,6]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(index, player)
    user_input = index.to_i

    user_input -= 1

    @board[user_input] = player
  end

  def valid_move?(index)
    user_input = index.to_i

    if user_input.to_s != index
      return false
    else
      !position_taken?(user_input - 1)
    end
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
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
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip

    if valid_move?(user_input)
      move(user_input,current_player)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do |winning_line|
      if @board[winning_line.first] != " " && (@board[winning_line[0]] == @board[winning_line[1]]) && (@board[winning_line[1]] == @board[winning_line[2]])
        return winning_line.to_a
      end
    end

    return false
  end

  def full?
    return !@board.include?(" ")     # If board has at least one ' ', it is not full
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw?
  end

  def winner
    if winning_line = won?
      @board[winning_line.first]
    end
  end
end
