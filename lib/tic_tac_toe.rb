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
    [2,4,6]]

  def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(location, token = "X")
    @board[location - 1] = token
  end

  def position_taken?(location)
    !(@board[location].nil? || @board[location] == " ")
  end

  def valid_move?(position)
    i = position.to_i
    !position_taken?(i-1) && i.to_i.between?(1,9)
  end

  def turn()
      puts "Player #{current_player()}: please enter 1-9:"
      input = gets.strip.to_i
      while !valid_move?(input) do
        puts "Invalid entry, please try again."
        input = gets.strip.to_i
      end
      move(input,current_player())
      display_board()
    end

    def turn_count()
      @board.select{|i| i=="X" || i=="O"}.length
    end

    def current_player()
      if turn_count()%2 == 0
        "X"
      else
        "O"
      end
    end

    def won?()
      result = false
      WIN_COMBINATIONS.each do |win_combination|
        if !result
          if win_combination.all?{|i| @board[i]=="X"} || win_combination.all?{|i| @board[i]=="O"}
            result = win_combination
          end
        end
      end
      result
    end

    def full?()
      @board.all?{|i| (i=="X"||i=="O")}
    end

    def draw?()
      !won?() && full?()
    end

    def over?()
      won?() || full?() || draw?()
    end

    def winner()
      winning_indices = won?()
      if winning_indices
        @board[winning_indices[0]]
      else
        nil
      end
    end

    def play()
      while !over?()
        turn()
      end
      if draw?()
        puts "Cats Game!"
      else
        puts "Congratulations #{winner()}!"
      end
    end











end
