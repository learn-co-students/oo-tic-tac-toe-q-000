# TicTacToe class

class TicTacToe
# Define your WIN_COMBINATIONS constant
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

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end


  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(location)
    location = location.to_i
    location.between?(1,9) && !position_taken?(location - 1)
  end

  def turn
      done = false
      until done
        puts "Please enter 1-9:"
        move = gets.strip
        if valid_move?(move)
          ind = move.to_i
          if turn_count % 2 == 0
            move(ind, "X")
          else
              move(ind, "O")
          end
          display_board
          done = true
        end
      end # until
  end # def

  # Define your play method below
  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif
      if draw?
        puts "Cats Game!"
      end
    end
  end

  def turn_count
    @board.count{|token| token =="X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?

    WIN_COMBINATIONS.each do |combo|
      if @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]] && @board[combo[0]] != " "
        return combo
      end

    end
    return false

  end

  def full?
    x = !@board.detect{|i| i == " "} #
  end

  def draw?

    !won? && full?

  end

  def over?
    return draw? || full? || won?
  end

  def winner

    win_comb = won?
    if win_comb == false
      return nil
    else
      return @board[win_comb[0]]
    end

  end
  # code your move method here!
  def move(location, character = "X")
    int_location = location.to_i - 1
    @board[int_location] = character
  end
end #class
