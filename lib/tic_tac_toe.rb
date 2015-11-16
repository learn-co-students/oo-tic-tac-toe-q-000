class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
end

  def display_board
  puts " 1 | 2 | 3 ",
       "-----------",
       " 4 | 5 | 6 ",
        "-----------",
        " 7 | 8 | 9 "
  puts "          "

  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} ",
   "-----------",
" #{@board[3]} | #{@board[4]} | #{@board[5]} ",
  "-----------",
" #{@board[6]} | #{@board[7]} | #{@board[8]} "
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

def move(position, character = "X")
  @board[position.to_i.pred] = character
end

def position_taken?(position)
  @board[position] != " " && @board[position] != ""
end

def valid_move?(position)
  position.to_i.between?(1,9) && !position_taken?(position.to_i.pred)
end

def turn
  puts "Please enter 1-9:"
  position = gets.strip
  if valid_move?(position) == true
    move(position, current_player)
    display_board
  else
    position = gets.strip
  end
end

def turn_count
  a= @board.count(" ")
   9 - a
end

def current_player
  if turn_count.even?
    "X"
  else
    "O"
  end
end

def won?

    if ["O", "X"].include?(@board[WIN_COMBINATIONS[0][0]]) && @board[WIN_COMBINATIONS[0][0]] ==  @board[WIN_COMBINATIONS[0][1]] && @board[WIN_COMBINATIONS[0][0]] ==  @board[WIN_COMBINATIONS[0][2]]
     WIN_COMBINATIONS[0]
      elsif ["O", "X"].include?(@board[WIN_COMBINATIONS[1][0]]) && @board[WIN_COMBINATIONS[1][0]] ==  @board[WIN_COMBINATIONS[1][1]] && @board[WIN_COMBINATIONS[1][0]] ==  @board[WIN_COMBINATIONS[1][2]]
     WIN_COMBINATIONS[1]
    elsif ["O", "X"].include?(@board[WIN_COMBINATIONS[2][0]]) && @board[WIN_COMBINATIONS[2][0]] ==  @board[WIN_COMBINATIONS[2][1]] && @board[WIN_COMBINATIONS[2][0]] ==  @board[WIN_COMBINATIONS[2][2]]
     WIN_COMBINATIONS[2]
elsif ["O", "X"].include?(@board[WIN_COMBINATIONS[3][0]]) && @board[WIN_COMBINATIONS[3][0]] ==  @board[WIN_COMBINATIONS[3][1]] && @board[WIN_COMBINATIONS[3][0]] ==  @board[WIN_COMBINATIONS[3][2]]
     WIN_COMBINATIONS[3]
    elsif ["O", "X"].include?(@board[WIN_COMBINATIONS[4][0]]) && @board[WIN_COMBINATIONS[4][0]] ==  @board[WIN_COMBINATIONS[4][1]] && @board[WIN_COMBINATIONS[4][0]] ==  @board[WIN_COMBINATIONS[4][2]]
     WIN_COMBINATIONS[4]
    elsif ["O", "X"].include?(@board[WIN_COMBINATIONS[5][0]]) && @board[WIN_COMBINATIONS[5][0]] ==  @board[WIN_COMBINATIONS[5][1]] && @board[WIN_COMBINATIONS[5][0]] ==  @board[WIN_COMBINATIONS[5][2]]
     WIN_COMBINATIONS[5]
elsif ["O", "X"].include?(@board[WIN_COMBINATIONS[6][0]]) && @board[WIN_COMBINATIONS[6][0]] ==  @board[WIN_COMBINATIONS[6][1]] && @board[WIN_COMBINATIONS[6][0]] ==  @board[WIN_COMBINATIONS[6][2]]
     WIN_COMBINATIONS[6]
    elsif ["O", "X"].include?(@board[WIN_COMBINATIONS[7][0]]) && @board[WIN_COMBINATIONS[7][0]] ==  @board[WIN_COMBINATIONS[7][1]] && @board[WIN_COMBINATIONS[7][0]] ==  @board[WIN_COMBINATIONS[7][2]]
     WIN_COMBINATIONS[7]

  else
      false
end
end

def full?
   !(@board.any? { |i| i == " "})
end

 def draw?
  full? == true && won? == false
end

  def over?
    draw? == true || won? != false
  end

def winner
    WIN_COMBINATIONS.each do |wincom|
      return "X" if wincom.all? { |position| @board[position] == "X"}
      return "O" if wincom.all? { |position| @board[position] == "O"}
    end
    else nil
end

 def play
   until over? != false
      turn
     end
    if draw? == true
     puts "Cats Game!"
    elsif won? != false
      puts "Congratulations #{winner}!"
    end
  end

end
