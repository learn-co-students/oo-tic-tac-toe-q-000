class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS =[
   [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]
   ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, player = "X")
    @board[position.to_i-1] = player
  end

  def position_taken?(position)
    if  @board[position] == "X" || @board[position] == "O" || @board[position] == "x" || @board[position] == "o"
      return true
    else
      return false
    end
  end

  def valid_move?(position)
    if position_taken?(position.to_i - 1) == true || position.to_i.between?(1, 9) == false
      return nil
    else
      return true
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    character = current_player
   if valid_move?(input) == true
        move(input.to_i, character)
        display_board
      else
        turn
   end
  end

  def turn_count
    counter = 0
    @board.each do |space|
      if space == "X" || space == "O"
        counter += 1
      end
    end
    return counter
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      else
        false
      end
      end
      return false
    end

    def full?
      return @board.all?{|element| element == "X" || element == "O"}
  end

  def draw?
    @board.each do |piece|
      if won? == false && full? == true
        return true
     else
         return false
     end
    end
  end

  def over?
      if draw? == true || full? == true
          return true
      else
          return false
      end
    end


  def winner
    if won?
    winning_combination = won? #[6,7,8]
    winning_position = winning_combination[0] #6
    @board[winning_position] #0
    end
  end

  def play
  while over? == false &&  won? == false
     turn
  end
  if (won? == false) != true
     puts "Congratulations #{winner}!"
  else
     puts "Cats Game!"
  end
end

end
