class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

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

  def position_taken?(position)
    if @board[position] == " " || @board[position] == "" || @board[position] == nil
      false
    else
      true
    end
  end

  def valid_move?(position)
    if (position.to_i-1).between?(0,8) && !(position_taken?(position.to_i-1))
      true
    else
      false
    end
  end

  def turn
     puts "Please enter 1-9:"
     input = gets.chomp

     if valid_move?(input)
       player_character = current_player
       move(input, player_character)
     else
       turn
     end
     display_board
   end

  def turn_count
    turns = 0
    @board.each do |player|
      if player == "X" || player == "O"
        turns += 1
      end
    end
    turns
  end

  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
    # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
    # grab each index from the win_combination that composes a win.
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = @board[win_index_1] # load the value of the board at win_index_1
    position_2 = @board[win_index_2] # load the value of the board at win_index_2
    position_3 = @board[win_index_3] # load the value of the board at win_index_3

      if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination # return the win_combination indexes that won.
      end
    end
     return false
   end

   def full?
     @board.all? do |position|
       position == "X" || position == "O"
     end
   end

   def draw?
     if !won? && full?
       return true
     else
       return false
     end
   end

   def over?
     if won? || draw? || full?
       return true
     else
       return false
     end
   end

   def winner
     if player_won = won?
       return @board[player_won[0]]
     else
       return nil
     end
   end

   def play
     turn until over?
     if won?
      puts "Congratulations #{winner}!"
     else draw?
      puts "Cats Game!"
     end
  end
end
