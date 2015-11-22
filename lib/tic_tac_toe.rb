class TicTacToe

  WIN_COMBINATIONS = [
  [0,1,2],[3,4,5],
  [6,7,8],[0,3,6],
  [1,4,7],[2,5,8],
  [0,4,8],[6,4,2]
  ]

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

def move(location, char = "X")
  @board[location.to_i-1] = char
end

def position_taken?(location)
  !(@board[location].nil? || @board[location] == " ")
end

def valid_move?(location)
    if location == "invalid"
    false
    elsif @board[location.to_i-1] == " "
    true
else false
end
end

def turn_count
    @board.count {|item| item == "X" || item == "O"}
end

  def current_player
    if turn_count.even? || turn_count == 0
      return "X"
    else return"O"
  end
  end

def turn
  puts "Please enter 1-9:"
  location = gets.strip
  if !!(valid_move?(location))
    then
    if current_player == "O" then char = "O"
    else char = "X"
    end
    move(location, char)
else
      turn
end
    puts display_board
  end

    def full?
    if (@board.count {|item| item == "X" || item == "O"}) == 9
        then true
    else false
    end
 end

def draw?
  if won? == true
    false
  elsif won? == false && full? == true
    true
  else false
  end
end

      def won?
  WIN_COMBINATIONS.each do |combo|
lotto = [@board[combo[0]], @board[combo[1]], @board[combo[2]]]

    if lotto.all? {|a| a == "X"} || lotto.all? {|a| a == "O"}
    return combo
end
end
else false
end

def over?
    if !!won? || !!draw? == true
      true
    else false
    end
  end

    def winner
  WIN_COMBINATIONS.each do |combo|
lotto = [@board[combo[0]], @board[combo[1]], @board[combo[2]]]

    if lotto.all? {|a| a == "X"} == true
      return "X"
    elsif lotto.all? {|a| a == "O"} == true
      return "O"
    end
  end
else nil
end

  def play
until over? == true
    turn
end
if won? == true
  winner
elsif draw? == true
  puts "Cats Game!"
end
  if winner == "X"
  puts "Congratulations X!"
  elsif winner == "O"
  puts "Congratulations O!"
end
end

end