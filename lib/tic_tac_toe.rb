 class TicTacToe
    def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
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
   

   def move(position,token="X")
   @board[position.to_i-1] = token
   end


    def position_taken?(position)
        if @board[position.to_i] == "X" || @board[position.to_i] == "O"
     return true
     else false
    end
    end


    def valid_move?(position)
        position = position.to_i - 1
    if position.between?(0,8) && !position_taken?(position)
      return true
    else false
    end
    end

    def turn
        puts "Please enter 1-9:"
        position = gets.strip
     if valid_move?(position)
      move(position, current_player)
      @display_board
    else turn
    end
    end
  
    def won?
     WIN_COMBINATIONS.detect do |combo|
     return combo if combo.all? do |position| @board[position] == "X" end
     return combo if combo.all? do |position| @board[position] == "O" end
    end
    end


    def full?
    @board.all?{|character| character == "X" || character == "O"}
    end

    def draw?
    !won? && full?
    end

    def over?
    won? || draw?
    end

    def winner
     if won?
        @board[won?.first]
     else 
    nil
    end
    end

    def play
     while !over?
    turn
    end
    if won?
     puts "Congratulations #{winner}!"
    else draw?
     puts "Cats Game!"
    end
    end

end