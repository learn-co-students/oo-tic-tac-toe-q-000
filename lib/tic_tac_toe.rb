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
    [0,4,8],
    [2,4,6]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(location, current_player)
    @board[location.to_i-1] = current_player
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(position)
    if position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
      return true
    end
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    if valid_move?(user_input)
      move(user_input, current_player)
    else
      turn
    end
      display_board
  end

  def won?
     WIN_COMBINATIONS.each do |win_combination|
       tokens = [@board[win_combination[0]],
                 @board[win_combination[1]],
                 @board[win_combination[2]]]
       if tokens.all?{ |token| token == "X" }
         puts "Congratulations X!"
         return win_combination
       elsif tokens.all?{ |token| token == "O" }
         puts "Congratulations O!"
         return win_combination
       end
     end
     false
   end

  def full?
    !@board.include?(" ")
  end

  def draw?
    full? && !won?
  end

  def over?
    full? || won? || draw?
  end

  def winner
    if won?
      return @board[won?[0]]
    else
      return nil
    end
  end

  def play
    until over?
      turn
    end
    if draw?
        puts "Cats Game!"
    end
  end


end
