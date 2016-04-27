class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]
  ]
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  def move(position, character)  
    position -= 1  
    @board[position] = character  
  end
  def position_taken?(location)
    !(@board[location].nil? || @board[location] == " ")
  end
  def valid_move?(position)
    position = position.to_i - 1
    !position_taken?(position) && position.between?(0, 8)
  end
  def turn_count
    turn = 0
    @board.each do |position|    
      if position == "X" || position == "O"
        turn += 1
      end
    end  
    turn
  end
  def current_player
    turn_count.even?  ? "X" : "O"  
  end
  def turn
    puts "It is now #{current_player}'s turn. Please enter 1-9:"
    position = gets.strip.to_i  
    if valid_move?(position.to_s)
      move(position, current_player)
      display_board
    else
      turn
    end
  end
  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] &&
      @board[combo[1]] == @board[combo[2]] &&
      position_taken?(combo[0])
    end
  end
  def full?
    @board.none? do |position|
      position == " " || position.nil?
    end
  end
  def draw?
    full? && !won?   
  end
  def over?
    won? || draw?
  end
  def winner  
    if won?
      winning_position = won?[0]
      if @board[winning_position] == "X"
        return "X"
      elsif @board[winning_position] == "O"
        return "O"
      end
    end
  end
  def play
    until over?
      turn
    end
    if draw?
      puts "Cats Game!"
    elsif won?
      puts "Congratulations #{winner}!"
    end
  end
end