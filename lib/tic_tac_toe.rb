class TicTacToe

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,4,8], [2,4,6], [0,3,6], [1,4,7], [2,5,8]]

  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end
   def board=(board)
     @board = board
   end
   def board
     @board
   end

  def display_board
       puts " #{ @board[0]} | #{ @board[1]} | #{ @board[2]} "
       puts "-----------"
       puts " #{ @board[3]} | #{ @board[4]} | #{ @board[5]} "
       puts "-----------"
       puts " #{ @board[6]} | #{ @board[7]} | #{ @board[8]} "
  end

  def move(location, character = "X")
    @board[input_to_index(location)] = character
  end

  def input_to_index(input)
    index = input.to_i - 1
    return index
   end

  def valid_move?(index)
    input_to_index(index).between?(0,8) && !position_taken?(input_to_index(index))
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def won?
    for i in 0..7
      if (@board[WIN_COMBINATIONS[i][0]]==@board[WIN_COMBINATIONS[i][1]]) && (@board[WIN_COMBINATIONS[i][1]]==@board[WIN_COMBINATIONS[i][2]]) && (@board[WIN_COMBINATIONS[i][0]]!= "" && @board[WIN_COMBINATIONS[i][0]]!=" ")
        return WIN_COMBINATIONS[i]
      end
    end
    return nil
  end

  def full?
    for i in 0..8
      if !position_taken?(i)
        return false
      end
    end
      return true
  end

  def draw?
    if  won?()==nil && full?()
      return true
    else
      return false
    end
  end

  def over?
    if won?()!=nil || full?() || draw?()
      return true
    else
      return false
    end
  end

  def winner
    if won?() != nil
    return @board[won?()[0]]
  else
    return nil
  end
  end

  def current_player
      turn_count = turn_count()
  if turn_count % 2==0
    return "X"
  else
    return "O"
  end
  end

  def turn
    puts "Please enter 1-9:"
    index = gets.strip
    #index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player())
      display_board()
    else
      turn()
    end
  end

  def turn_count
    count = 0
    for i in 0..8
      if position_taken?(i)
        count +=1
      end
    end
    return count
  end

  def play
    until over?() do
      turn()
   end
   if won?
     puts "Congratulations #{winner}!"
   elsif draw?
     puts "Cats Game!"
   end
  end


end
