class TicTacToe
  def initialize()
    @board = Array.new(9," ")
  end
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  def input_to_index(user_input)
    user_input.to_i-1
  end
  def move(user_input,value="X")
    index = input_to_index(user_input)
    @board[index] = value
  end
  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" or @board[index] == nil
      false
    else
      true
    end
  end
  def valid_move?(user_input)
    index = input_to_index(user_input)
    if index >= 0 && index<9 && !position_taken?(index)
      true
    else
      false
    end
  end
  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    until valid_move?(user_input)
      puts "Invalid move, please enter 1-9:"
      user_input = gets.strip
    end
    move(user_input,current_player)
    display_board
  end
  def turn_count
    counter = 0
    @board.each do |position|
      if position == "X" || position =="O"
        counter +=1
      end
    end
    return counter
  end
  def current_player
    counter = turn_count
    if counter%2==0
      return "X"
    else return "O"
    end
  end
  def won?
    WIN_COMBINATIONS.detect {|win_combination| (@board[win_combination[0]]=="X" && @board[win_combination[1]]=="X" && @board[win_combination[2]]=="X")||(@board[win_combination[0]]=="O" && @board[win_combination[1]]=="O" && @board[win_combination[2]]=="O")}
  end

  def full?
    return !(@board.detect {|i| i==" "||i.nil?})
  end

  def draw?
    !won?&&full?
  end

  def over?
    won?||full?||draw?
  end

  def winner
    wincombo = won?
    if wincombo
      return @board[wincombo[0]]
    else
      return wincombo
    end

  end

  def play
    until over? do
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cats Game!"
    end
  end
end
