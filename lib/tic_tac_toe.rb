class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [6,4,2],
  [0,4,8]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def move(position, token)
    @board[position-1] = token
  end

  def position_taken?(position)
    if @board[position] == "X" || @board[position] == "O"
      true
     else
      false
    end
  end

  def valid_move?(position)
    position = position.to_i
    if position.between?(1,9)
      if !position_taken?(position-1)
        return true
      else
        return false
      end
    else
      return false
    end
  end

  def turn
    puts "Please enter 1-9:"
    position = gets.strip.to_i
    token = current_player
    if valid_move?(position)
      move(position, token)
      display_board
    else
      puts "Invalid move, please enter another 1-9"
      turn
    end
  end

    def won?
      WIN_COMBINATIONS.each do |combo|
        if  @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
          return combo
        elsif @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
          return combo
        else
        end
      end
      return false
    end

  def full?
    @board.all? {|position| position == "X" || position == "O"}
  end

  def draw?
    !won? && full?? true : false
  end

  def over?
    if won? || draw?
      true
    else
      false
    end
  end

  def winner
    combo = won?
    if(!won?)
      return nil
    elsif  @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
      return "X"
    elsif @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
      return "O"
    else
      return nil
    end
  end

  def play
    until(over?) do
      turn
    end
    if(won?)
      puts "Congratulations #{winner}!"
    else
      puts "Cats Game!"
    end
  end
  
end