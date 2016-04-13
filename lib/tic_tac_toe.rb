class TicTacToe
 attr_accessor :board
 
 def initialize
  @board = Array.new(9," ")
  end

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

  def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
   end

   def move(position, character="X")
   board[position.to_i - 1]=character
    end

  def position_taken?(position)
  (board[position] != " " && board[position] != "" && board[position] != nil)
   end

  def valid_move?(position)
  position = position.to_i - 1
  position.between?(0, 8) && !position_taken?(position)
  end

  def turn
  turn_count
  puts "Please enter 1-9:"
  position = gets.strip
  if valid_move?(position)
    move(position, "#{current_player}")
    display_board
  else 
    turn
  end
  end

  def turn_count
  counter = 0
  board.each do |position|
    if position == "X" || position == "O"
      counter += 1
    end
  end
  counter
  end

  def current_player
  if turn_count.odd? 
    "O"
  elsif turn_count.even?
    "X"
  end
  end
  
  def won?
    WIN_COMBINATIONS.each do |win_combination|
    position_1 = board[win_combination[0]]
    position_2 = board[win_combination[1]]
    position_3 = board[win_combination[2]]
      if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return win_combination
        end
      end
    return false
  end

  def full?
  board.all? {|position| position == "X" || position == "O"}
  end

  def draw?
  full? == true && won? == false
  end

  def over?
  won? != false || draw? == true
  end

  def winner
  winning_array = won?
  if winning_array != false
    return board[winning_array.first]
  else
    return nil
    end
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
