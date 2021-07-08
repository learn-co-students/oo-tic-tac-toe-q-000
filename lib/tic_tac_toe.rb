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

  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [6,4,2],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]

  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
      
    end
    
  end

  def move(position,current_player)
    @board[position.to_i-1] = current_player
  end

  def position_taken?(position)
      !(@board[position].nil? || @board[position] == " ")
  end  

  def valid_move?(input)
    !position_taken?(input.to_i-1) && input.to_i.between?(1,9)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if !valid_move?(input)
      turn
    end
    move(input, current_player)
    display_board
  end

  def turn_count
    @board.count { |cell| cell == "X" || cell == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.detect do |win_index|
      @board[win_index[0]] == @board[win_index[1]] &&
      @board[win_index[1]] == @board[win_index[2]] &&
      position_taken?(win_index[0])
    end
  end

  def full?
    @board.none? {|cell| cell == " " || cell == ""}
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw? 
  end

  def winner
    if win_board = won?
      @board[win_board[0]]
    end
  end

end