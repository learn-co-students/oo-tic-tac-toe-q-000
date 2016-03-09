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
  [0,1,2], #Top Row
  [0,3,6], #Left Row
  [2,5,8], #Right Row
  [6,7,8], #Bottom Row
  [3,4,5], #Midleft-Midright
  [1,4,7], #Topmid-Botmid
  [0,4,8], #Top-Left-Bottom-Right Diagonal
  [6,4,2] #Top-Right-Bottom-Left Diagonal
]

  def move(position, current_player)
    @board[position.to_i-1] = current_player
  end

  def position_taken?(position)
    if @board[position] == " " || @board[position] == "" || @board[position] == nil
      false
    else
      true
    end
  end

  def valid_move?(position)
  position = position.to_i - 1
    if position.between?(0,8)
      if @board[position]== " " || @board[position] == ""
        true
      end
    else
      false
    end
  end

  def turn
    puts "Please enter 1-9:"
    position = gets.chomp
    if valid_move?(position)
      move(position, current_player)
    else
      turn
    end
    display_board
  end

  def turn_count
    counter = 0
    @board.each do |random|
      if random == "X" || random == "O"
        counter +=1
      end
    end
    counter
  end

  def current_player
    if turn_count.even?
      "X"
    else
      "O"
    end
  end

  def won?
    WIN_COMBINATIONS.any? do |wincombos|
      if (@board[wincombos[0]] == "X" || @board[wincombos[0]] == "O") && @board[wincombos[0]] == @board[wincombos[1]] && @board[wincombos[1]] == @board[wincombos[2]]
        return wincombos
      end
    end
  end

  def full?
    @board.all? do |fullness|
      if fullness == "X" || fullness == "O"
        true
      end
    end
  end

  def draw?
    if !won? && full?
      true
    end
  end

  def over?
    if won? || draw? || full?
      true
    end
  end

  def winner
    if won?
      @board[won?[0]]
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations " + winner + "!"
    elsif draw?
      puts "Cats Game!"
    end
  end
end