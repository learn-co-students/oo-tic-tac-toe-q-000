

class TicTacToe

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

  def initialize(board = Array.new(9," "))
    @board = board
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(pos, token = "X")
    @board[pos.to_i - 1] = token
  end

  def position_taken?(pos)
    @board[pos] != " "
  end

  def valid_move?(pos)
    pos = pos.to_i - 1
    pos.between?(0,8) && !position_taken?(pos)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
      move(input, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    @board.count {|x| x != " "}
  end

  def current_player
    (turn_count % 2 == 0) ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.detect do |comb|
      @board[comb[0]] == @board[comb[1]] && @board[comb[1]] == @board[comb[2]] && position_taken?(comb[0])
    end
  end

  def full?
    @board.none? {|x| x == " "}
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || full? || draw?
  end


  def winner
    if x = won?
      @winner = pos(x.first)
    end
  end

  def pos(place)
    @board[place.to_i]
  end

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










end
