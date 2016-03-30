class TicTacToe

      def initialize (board = nil)
        @board = board || Array.new(9, " ")
      end

    #Constants

    WIN_COMBINATIONS = [
      [0, 1, 2], #Top Row
      [3, 4, 5], #Middle Row
      [6, 7, 8], #Bottom Row

      [0, 3, 6], #Left Column
      [1, 4, 7], #Middle Column
      [2, 5, 8], #Right Column

      [0, 4, 8], #Diagonal 1
      [6, 4, 2] #Diagonal 2
    ]

    #Methods

    #Display Board
    def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end


    #Move
    def move (position, value = "X")
      @board[position.to_i - 1] = value
    end

    #Position Taken
    def position_taken?(position)
      !(@board[position].nil? || @board[position] == " ")
    end


    #Valid Move
    def valid_move?(position)
      position = position.to_i
      
      if (position.between?(1, 9) && !position_taken?(position-1)) 
        return true
      end

      return false
    end

    #Current Player
    def current_player
      if turn_count % 2 == 0
        return "X"
      else
        return "O"
      end
    end


    #Turn
    def turn
      puts "Please enter 1-9:"
      position = gets.strip
      if (valid_move?(position))
        move(position, current_player)
        display_board
      else
        turn
      end
    end


    #Turn Counter
    def turn_count
      x_counter = 0
      o_counter = 0

      @board.each do |token|
        if token == "X"
          x_counter += 1
        elsif token == "O"
          o_counter += 1
        else
          nil
        end
      end
     return x_counter + o_counter
    end

  #Won
  def won?
    WIN_COMBINATIONS.find do |win|
      position_taken?(win[0]) && win.all? { |x| @board[x] == @board[win[0]] }
    end
  end


  #Full
  def full?
    !@board.any? do |x|
      x == " "
    end
  end


  #Draw
  def draw?
    full? && !won?
  end

  #Over
  def over?
    won? || draw? || full?
  end


  #Winner
  def winner
    gold = won?
    if won?
      return @board[gold[0]]
    else
      return nil
    end
  end

  #Play
  def play
    while turn_count < 9 && !over?
      turn
    end
    if over?
      if draw?
        puts "Cats Game!"
      elsif won?
        puts "Congratulations #{winner}!"
      end
    end
  end


end #Ends TicTacToe Class
