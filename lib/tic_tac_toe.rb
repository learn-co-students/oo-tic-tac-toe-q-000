class TicTacToe
  def initialize
    @board = Array.new(9, " ")

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

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(location, token = "X")
    location = location -1
    @board[location] = token
  end

  def position_taken?(location)
    if @board[location] == "X" || @board[location] == "O"
      true
    else
      false
    end
  end

  def valid_move?(position)
    position = position.to_i
    if position.between?(1,9)
      position -=1
      if position_taken?(position)
        false
      else
        true
      end
    else
      false
    end
  end

  def turn
    puts "Enter a number 1-9"
    input = gets.strip
    input = input.to_i
    if valid_move?(input)
      move(input, current_player)
    else
      turn
    end
    display_board
  end

  def turn_count
    @board.count{|token| token == "X" || token =="O"}
  end

  def current_player
    if turn_count.even? == true
      return "X"
    else
      return "O"
    end
  end

  def won?
    WIN_COMBINATIONS.any? do |win_combination|
    win_index1 = win_combination[0]
    win_index2 = win_combination[1]
    win_index3 = win_combination[2]


    position_1 = @board[win_index1]
    position_2 = @board[win_index2]
    position_3 = @board[win_index3]


    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
     return win_combination
    else
      false
    end
  end
end



  def full?
  is_full = true
  9.times do |number|

    if position_taken?(number) == false
      is_full = false
    end
    number +=1
  end
  return is_full
end

    def draw?
      if won? == false && full? == true
        true
      else
        false
      end
    end

  def over?
    if won? || draw? || full?
      return true
    end
  end

  def winner

    if won?!= false
      winner = won?[0]

      @board[winner]
    end
  end

  def play
    until over? == true
      turn
    end
    if won? != false
      puts "Congratulations #{winner}!"
    elsif draw? != false
      puts "Cats Game!"
    end
  end
end
