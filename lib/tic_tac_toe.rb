class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def display_board
   puts " #{@board[0]} " "|" " #{@board[1]} " "|" " #{@board[2]} "
   puts "-----------"
   puts " #{@board[3]} " "|" " #{@board[4]} " "|" " #{@board[5]} "
   puts "-----------"
   puts " #{@board[6]} " "|" " #{@board[7]} " "|" " #{@board[8]} "
  end

  WIN_COMBINATIONS = [
  [0,1,2], #Top row
  [3,4,5], #Middle row
  [6,7,8], #Bottom row
  [0,3,6], #Vertical row 0,3,6
  [1,4,7], #Vertical row 1,4,5
  [2,5,8], #Vertical row 2,5,8
  [0,4,8], #Diagonal line 0,4,8
  [6,4,2]  #Diagonal line 2,4,6
  ]

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def move(position, value)
    @board[position - 1] = value
  end

  def position_taken?(position)
  !(@board[position].nil? || @board[position] == " ")
  end

  def valid_move?(position)
    position = position.to_i - 1
    if !(position_taken?(position)) == true && position.to_i.between?(0, 8)
       true
    else
       false
    end
  end

  def turn
    puts "Please enter 1-9:"
    position = gets.strip
      if valid_move?(position)
        move(position.to_i, "#{current_player}")
      else
        puts "Please enter 1-9:"
        position = gets.strip
      end
    display_board
  end

  def won?
    answer = case
    when ( @board[WIN_COMBINATIONS[0][0]] == "X" && @board[WIN_COMBINATIONS[0][1]] == "X" && @board[WIN_COMBINATIONS[0][2]] == "X" ) || ( @board[WIN_COMBINATIONS[0][0]] == "O" && @board[WIN_COMBINATIONS[0][1]] == "O" && @board[WIN_COMBINATIONS[0][2]] == "O" )
    return WIN_COMBINATIONS[0]

    when ( @board[WIN_COMBINATIONS[1][0]] == "X" && @board[WIN_COMBINATIONS[1][1]] == "X" && @board[WIN_COMBINATIONS[1][2]] == "X" ) || ( @board[WIN_COMBINATIONS[1][0]] == "O" && @board[WIN_COMBINATIONS[1][1]] == "O" && @board[WIN_COMBINATIONS[1][2]] == "O" )
    return WIN_COMBINATIONS[1]

    when ( @board[WIN_COMBINATIONS[2][0]] == "X" && @board[WIN_COMBINATIONS[2][1]] == "X" && @board[WIN_COMBINATIONS[2][2]] == "X" ) || ( @board[WIN_COMBINATIONS[2][0]] == "O" && @board[WIN_COMBINATIONS[2][1]] == "O" && @board[WIN_COMBINATIONS[2][2]] == "O" )
    return WIN_COMBINATIONS[2]

    when ( @board[WIN_COMBINATIONS[3][0]] == "X" && @board[WIN_COMBINATIONS[3][1]] == "X" && @board[WIN_COMBINATIONS[3][2]] == "X" ) || ( @board[WIN_COMBINATIONS[3][0]] == "O" && @board[WIN_COMBINATIONS[3][1]] == "O" && @board[WIN_COMBINATIONS[3][2]] == "O" )
    return WIN_COMBINATIONS[3]

    when ( @board[WIN_COMBINATIONS[4][0]] == "X" && @board[WIN_COMBINATIONS[4][1]] == "X" && @board[WIN_COMBINATIONS[4][2]] == "X" ) || ( @board[WIN_COMBINATIONS[4][0]] == "O" && @board[WIN_COMBINATIONS[4][1]] == "O" && @board[WIN_COMBINATIONS[4][2]] == "O" )
    return WIN_COMBINATIONS[4]

    when ( @board[WIN_COMBINATIONS[5][0]] == "X" && @board[WIN_COMBINATIONS[5][1]] == "X" && @board[WIN_COMBINATIONS[5][2]] == "X" ) || ( @board[WIN_COMBINATIONS[5][0]] == "O" && @board[WIN_COMBINATIONS[5][1]] == "O" && @board[WIN_COMBINATIONS[5][2]] == "O" )
    return WIN_COMBINATIONS[5]

    when ( @board[WIN_COMBINATIONS[6][0]] == "X" && @board[WIN_COMBINATIONS[6][1]] == "X" && @board[WIN_COMBINATIONS[6][2]] == "X" ) || ( @board[WIN_COMBINATIONS[6][0]] == "O" && @board[WIN_COMBINATIONS[6][1]] == "O" && @board[WIN_COMBINATIONS[6][2]] == "O" )
    return WIN_COMBINATIONS[6]

    when ( @board[WIN_COMBINATIONS[7][0]] == "X" && @board[WIN_COMBINATIONS[7][1]] == "X" && @board[WIN_COMBINATIONS[7][2]] == "X" ) || ( @board[WIN_COMBINATIONS[7][0]] == "O" && @board[WIN_COMBINATIONS[7][1]] == "O" && @board[WIN_COMBINATIONS[7][2]] == "O" )
    return WIN_COMBINATIONS[7]

    end
  end

  def full?
    if @board.include?(" ")
      false
    else
     true
    end
  end

  def draw?
    if won? == nil && full?
      return true
    else
      return false
    end
  end

  def over?
    answer = case
    when full? == false
      return false
    when draw? || won?
      return true
    end
  end

  def winner
    if won? !=nil
      a = won?
      b = @board[a.first]
      return b
    else
      return nil
    end
  end

#Play method
  def play
      until over? == true || won? do
      turn
        if won?
          break
        elsif draw? == true
          break
        end
      end
      if winner
        puts "Congratulations #{winner}!"

      else
        puts "Cats Game!"
      end
  end


end