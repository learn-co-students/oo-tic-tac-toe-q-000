class TicTacToe
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
  def initialize
    @board = Array.new(9," ")
  end
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  def move(position,player)
    @board[position-1] = player
  end
  def position_taken?(position)
    (@board[position] == " " || @board[position] == "" || @board[position] == nil) ? false : true
  end
  def valid_move?(position)
    !position_taken?(position.to_i-1) && position.to_i.between?(1,9) ? true : false
  end
  def turn
    position = "Z"
    while !position.to_i.between?(1,9)
      puts "Enter a number 1-9:"
      position = gets.strip
    end
  end
  def turn_count
    @board.count do |move|
      move == 'X' || move == 'O'
    end
  end
  def current_player
    turn_count % 2 == 0 ? 'X' : 'O'
  end
  def won?
    WIN_COMBINATIONS.each do |combos|
      if (@board[combos[0]] == 'X' && @board[combos[1]] == 'X' && @board[combos[2]] == 'X') ||
         (@board[combos[0]] == 'O' && @board[combos[1]] == 'O' && @board[combos[2]] == 'O')
        return true
      end
    end
    false
  end
  def full?
    @board.each do |move|
      return false  if move != 'X' && move != 'O'
    end
    true
  end
  def draw?
    full? && !won? ? true : false
  end
  def over?
    return true if draw? || won?
  end
  def winner
    WIN_COMBINATIONS.each do |combo|
      if (@board[combo[0]] == 'X' && @board[combo[1]] == 'X' && @board[combo[2]] == 'X') ||
         (@board[combo[0]] == 'O' && @board[combo[1]] == 'O' && @board[combo[2]] == 'O')
         return @board[combo[0]]
      end
    end
    nil
  end
  def play
    while !over?
      position = nil
        while !valid_move?(position)
          puts "Enter a move 1-9:"
          position = gets.strip
        end
      @board[position.to_i-1] = current_player
    end
    if draw?
      puts "Cats Game!"
    end
    if won?
      puts "Congratulations #{winner}!"
    end
  end
end