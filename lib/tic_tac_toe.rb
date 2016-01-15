require 'pry'
class TicTacToe
  def initialize(board=nil)
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]]
  def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, choice = "X")
    position = position.to_i
    @board[position-1] = choice
    display_board
  end

  def position_taken?(location)
    !(@board[location].nil? || @board[location] == " ")
  end

  def turn_count
    counter = 0
    @board.each do |x|
      if x == "X" || x == "O"
        counter +=1
      end
    end
    return counter
  end

  def current_player
    turn = turn_count
    a = "X"
    b = "O"
    if turn == 0
      a
    elsif turn % 2 != 0
      b
    elsif turn % 2 == 0
      a
    end
  end



  def valid_move?(position)
    position = position.to_i
    position = position -1
    if position_taken?(position) == false && position.between?(0,8)
      true
    else
      false
    end
  end

  def won?
    counter = 0

    WIN_COMBINATIONS.each do |win_combinations|

      win_index_1 = win_combinations[0]
      win_index_2 = win_combinations[1]
      win_index_3 = win_combinations[2]
      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]
      counter += 1
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combinations
        # return the win_combination indexes that won.
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combinations
      else
        nil
      end
    end
    if counter == 9
      return false
    end
  end

  def full?
    if @board.include?(" ")
      return false
    else
      return true
    end
  end

  def draw?
    if won?
      return false
    elsif full? == false && won? != true
      return false
    else
      return true

    end
  end
  def over?
    if draw?
      return true
    elsif won?
      return true
    else
      return false

    end
  end

  def winner
    var = won?
    if won?
      if @board[var[0]] == "X"
        return "X"
      elsif @board[var[0]] == "O"
        return "O"
      else
        nil
      end
    end
  end

    def turn
    puts "Please enter 1-9:"
    input = gets.strip
    peg = current_player
      if valid_move?(input) == false
        puts "Sorry that input wasn't acceptable."
        turn
      else
        puts input
        move(input,peg)
        display_board

      end
    if won?
      return "Congratulations #{winner}"
    elsif draw?
      print "Cats Game!"
    else
      nil
    end
  end

  def play
    while over? == false
      turn
    end
    if draw?
      puts "Cats Game!"
    elsif winner == "X"
      puts "Congratulations X!"
    elsif winner == "O"
      puts "Congratulations O!"
    else
      nil
  end
end


end
