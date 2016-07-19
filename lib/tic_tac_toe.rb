class TicTacToe

  def initialize(board = Array.new(9, " "))
    @board = board
  end

  WIN_COMBINATIONS = [
    [0, 1, 2], # Top row = WIN_COMBINATIONS[0]
    [3, 4, 5], # Middle row = WIN_COMBINATIONS[1]
    [6, 7, 8], # Bottom row = WIN_COMBINATIONS[2]
    [0, 3, 6], # Left column = WIN_COMBINATIONS[3]
    [1, 4, 7], # Middle column = WIN_COMBINATIONS[4]
    [2, 5, 8], # Right column = WIN_COMBINATIONS[5]
    [0, 4, 8], # Left-to-right Diagonal = WIN_COMBINATIONS[6]
    [2, 4, 6] # Right-to-left Diagonal = WIN_COMBINATIONS[7]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(player_move, character = "X")
    index = player_move.to_i - 1
    @board[index] = character
  end

  def position_taken?(player_move)
    !(@board[player_move.to_i].nil? || @board[player_move.to_i] == " ")
  end

  def valid_move?(player_move)
    player_move = player_move.to_i - 1
    !position_taken?(player_move) && player_move.between?(0, 8)
  end

  def turn
    puts "Please enter 1-9:"
    player_move = gets.strip
    character = current_player
      if valid_move?(player_move)
        move(player_move, character)
        display_board
      else
        puts "This move is invalid. Please enter a number from 1-9 for a space that isn't already taken."
        turn
      end
  end

  def turn_count
    counter = 0
    @board.each do |position|
      if position == "X" || position == "O"
      counter += 1
      end
    end
    counter
  end

  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      @board[win_combo[0]] == @board[win_combo[1]] && 
      @board[win_combo[1]] == @board[win_combo[2]] && 
      position_taken?(win_combo[0])
    end
  end

  def full?
    @board.all? {|character| character == "X" || character == "O"}
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw?
  end

  def winner
    if winning_combo = won?
      @board[winning_combo.first]
    end
  end

  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    else
      puts "I can't even tell what happened!"
    end
  end

end