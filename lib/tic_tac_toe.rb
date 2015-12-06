class TicTacToe
  WIN_COMBINATIONS = [[0,1,2], #Top row winner
  [3,4,5], # Middle row winner
  [6,7,8], #Bottom row winner
  [0,3,6], #Left column winner
  [1,4,7], #Middle column winner
  [2,5,8], #Right column winner
  [0,4,8], #Diagonal left-to-rigth winner
  [6,4,2]  #Diagonal right-to-left winner
  ]

  def initialize (board = Array.new(9, " "))
    @board = board
  end

  def play
    until over?
      turn
    end
    puts "Congratulations #{winner}!" if won?
    puts "Cats Game!" if draw?
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, token = "X")
    @board[position.to_i-1] = token
  end

  def position_taken?(position)
    !(@board[position].nil? || @board[position] == " ")
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
  end

  def turn_count
    @board.count {|space| space == "X" || space == "O"}
  end

  def current_player
    turn_count%2==0? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    position = gets.strip
    valid_move?(position)? move(position, current_player) : turn
    display_board
  end

  def won?
    win_combination = WIN_COMBINATIONS.find do |win_combination|
      win_combination.all? {|index| @board[index]=="X"} or win_combination.all? {|index| @board[index]=="O"}
    end
  end

  def full?
    @board.all?{|space| space =="X" || space =="O"}
  end

  def draw?
    return true if full? && !won?
  end

  def over?
    return true if won?||draw?
  end

  def winner
    if won? then @board[won?[0]] end
  end
end