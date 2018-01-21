class TicTacToe
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

  def move(place, char= "X")
    @board[place.to_i-1] = char
  end
  def position_taken?(pos)
    @board[pos] == "X" || @board[pos] == "O"
  end
  def valid_move?(pos)
    pos.to_i >= 1 && pos.to_i <= 9 && @board[pos.to_i-1] == " "
  end
  def turn
    begin
      puts "Input number 1-9"
      pos = gets.chomp
    end until valid_move?(pos)
  move(pos, current_player)
  end

  def turn_count
    count = 0
    @board.each do |i|
      if i != " " && i!= nil
        count = count + 1
      end
    end
    count
  end

  def current_player
    if(turn_count % 2 == 0)
      "X"
    else
      "O"
    end
  end
  def won?
    WIN_COMBINATIONS.any? {|combi|
      @board[combi[0]] != " " && @board[combi[0]] == @board[combi[1]] && @board[combi[1]] == @board[combi[2]]}
  end
  def full?
    @board.all? {|i| i != " " && i != nil}
  end
  def draw?
    if won?
      false
    elsif full?
      true
    else
      false
    end
  end
  def over?
    won? || draw?
  end
  def winner
    if won?
      @board[
      WIN_COMBINATIONS.find {|combi|
      @board[combi[0]] != " " && @board[combi[0]] == @board[combi[1]] && @board[combi[1]] == @board[combi[2]]}[0]]
    end
  end
  def play
    while !over?
      turn
    end
    if(won?)
      puts "Congratulations " + winner + "!"
    else
      puts "Cats Game!"
    end
  end
end