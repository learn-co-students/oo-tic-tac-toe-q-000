class TicTacToe
  def initialize(board=nil)
    @board = board || Array.new(9, " ")
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
      [0,4,8],
      [6,4,2]
    ]
    def move(location, token = "X")
      @board[location.to_i - 1] = token
    end

    def position_taken?(position)
      !(@board[position].nil? || @board[position] == " ")
    end

    def valid_move?(position)
      position.to_i.between?(1,9) && @board[position.to_i-1]==" "
    end

    def turn
      puts "Please enter 1-9:"
      input = gets.strip
      if valid_move?(input)
        move(input, current_player)
      else
        turn
      end
      display_board
    end

    def turn_count
      @board.select{|i| i == "X" || i == "O"}.count
    end

    def current_player
      turn_count % 2 == 0 ? "X" : "O"
    end

    def won?
      WIN_COMBINATIONS.detect do | winner|
        winner.all?{|token| @board[token] == "X"} || winner.all?{|token| @board[token] == "O"}
      end
    end

    def full?
      @board.all?{|i| i == "X" || i == "O"}
    end

    def draw?
      !won? && full?
    end

    def over?
      won? || draw? || full?
    end

    def winner
      if winner = won?
        @board[winner.first]
      end
    end

    def play
      until over?
        turn
      end
      if won?
        puts "Congratulations #{winner}!"
      else
        puts "Cats Game!"
      end
    end
end




















