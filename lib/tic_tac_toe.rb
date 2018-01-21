class TicTacToe
  # Array containing all possible win combinations
  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,3,6], # Left column
    [1,4,7], # Middle column
    [2,5,8], # Right column
    [0,4,8], # Downward diagonal
    [6,4,2]  # Upward diagonal
    ]

  def initialize(new_board = nil)
    @board = new_board || Array.new(9, " ")
  end

  def play
    until over?
      turn()
    end
    if(won?)
      puts "Congratulations #{winner}!"
    elsif(draw?)
      puts "Cats Game!"
    end
  end

  # Helper Methods
  def display_board
    puts(" #{@board[0]} | #{@board[1]} | #{@board[2]} ")
    puts("-----------")
    puts(" #{@board[3]} | #{@board[4]} | #{@board[5]} ")
    puts("-----------")
    puts(" #{@board[6]} | #{@board[7]} | #{@board[8]} ")
  end

  def move(position, player = "X")
    @board[position-1]=player
  end

  def position_taken?(position)
    (@board[position]=="X" || @board[position] == "O") ? true : false
  end

  def valid_move?(position)
    (!position_taken?(position.to_i-1) && position.to_i.between?(1,9)) ? true : false
  end

  def turn
    puts "Where would you like to go (1-9)?:"
    position = gets.strip.to_i
    if(valid_move?(position))
      move(position, current_player)
      display_board()
    else
      turn()
    end
  end

  def turn_count
    @board.count {|space| space == "X" || space == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    TicTacToe::WIN_COMBINATIONS.each do |combo|
      if(position_taken?(combo[0]) &&
         @board[combo[0]]==@board[combo[1]] &&
         @board[combo[1]]==@board[combo[2]])
        return combo
      end
    end
    false
  end

  def full?
    ![0,1,2,3,4,5,6,7,8].any?{|position| !position_taken?(position)}
  end

  def draw?
    (!won? && full?) ? true : false
  end

  def over?
    (won? || draw?) ? true : false
  end

  def winner
    won? ? @board[(won?)[0]] : nil
  end
end