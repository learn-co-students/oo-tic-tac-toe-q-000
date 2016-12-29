class TicTacToe
  WIN_COMBINATIONS = [[0,1,2],
                      [3,4,5],
                      [6,7,8],
                      [0,3,6],
                      [1,4,7],
                      [2,5,8],
                      [0,4,8],
                      [6,4,2]]

  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(loc,token="X")
    @board[loc-1] = token
  end

  def position_taken?(loc)
    @board[loc] != " " && @board[loc] != ""
  end

  def valid_move?(loc)
    !position_taken?(loc.to_i-1) && loc.to_i.between?(1,9)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
      move(input.to_i,current_player)
    else
      turn
    end
    display_board
  end

  def turn_count
    @board.count {|t| t == "X" || t == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.detect {|combo| match?(combo)}
  end

  def match?(combo)
    a,b,c = combo
    return @board[a] == @board[b] && @board[b] == @board[c] if move_char?(@board[a])
    false
  end

  def move_char?(char)
    char == "X" || char == "O"
  end

  def full?
    @board.all?{|x| move_char?(x)}
  end

  def draw?
    !won? && full?
  end

  def over?
    draw? || won?
  end

  def winner
    won? ? @board[won?[0]] : nil
  end

  def play
    until over?
      turn
    end
    puts won? ? "Congratulations #{winner}!" : "Cats Game!"
  end

end
