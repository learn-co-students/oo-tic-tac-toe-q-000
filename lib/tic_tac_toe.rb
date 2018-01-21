class TicTacToe
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

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def board
    @board
  end

  def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def move(location, param = 0)
  if param == 0
    @board[location.to_i-1] = current_player
  else
    @board[location.to_i-1] = param
  end
end

def position_taken?(location)
  !(@board[location].nil? || @board[location] == " ")
end

def valid_move?(position)
  position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  if valid_move?(input)
    move(input)
  else
    turn
  end
  display_board
end

def turn_count
    count = 0
    @board.each do |play|
        if (play == 'X') || (play == 'O')
            count += 1
        end
    end
    count
end

def current_player
    if turn_count % 2 == 0
        'X'
    else
        'O'
    end
end

def won? # is a mess.  refactor.
    array_of_diagonals = []
    won = false
    win_combination = false
    WIN_COMBINATIONS.each do |winning|
        array_of_diagonals = [ @board[winning[0]], @board[winning[1]], @board[winning[2]]]
        won = array_of_diagonals.all? {|f| f == 'O'}
        if won == false
            won = array_of_diagonals.all? {|f| f == 'X'}
        end
        if won == true
            win_combination = winning
        end
        break if won == true
    end
    win_combination
end

def full?
    @board.all? {|f| /[OX]/.match(f)}
end

def draw?
    full? && !won?
end

def over?
    draw? || won?
end

def winner
    if won?
        @board[won?[1]]
    else
        nil
    end
end

def play
  until over?
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  else
  puts "Cats Game!"
  end
end

end

# fred = TicTacToe.new
# print fred.board
# fred.yell