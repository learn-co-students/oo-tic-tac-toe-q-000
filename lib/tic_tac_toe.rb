class TicTacToe

  def initialize

    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, current_player)
    @board[input_to_index(index)] = current_player
  end



  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index)
    i = input_to_index(index)
    i.between?(0,8) && !position_taken?(i)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip   
    if valid_move?(input)
      cp = current_player
      move(input, cp)
      display_board
    else
      turn
    end
  end

  # Define your play method below


  def play

    index = 9

    while index > 0
      
      turn

      index -= 1
    end
   
  end

  def turn_count

    counter = 0

    @board.each do |x|

      if x == "X" || x == "O"
        counter +=1
      end

    end

    counter

  end


  def current_player

    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end

  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  # Define your WIN_COMBINATIONS constant

  WIN_COMBINATIONS = [

    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]

  ]

  def won?

    return false if @board.include?("X") == false && @board.include?("O") == false

    WIN_COMBINATIONS.each do |x|

      if @board[x[0]] == "X" && @board[x[1]] == "X" && @board[x[2]] == "X"
        return x
      elsif @board[x[0]] == "O" && @board[x[1]] == "O" && @board[x[2]] == "O"
        return x
      end

    end

    return false

  end


  def full?
    
    @board.each do |x|
      if x == " "
        return false
      end
    end

    return true

  end

  def draw?

    if !won? && full?
      return true
    end

    return false

  end

  def over?

    if draw?
      return true
    elsif won?
      return true
    elsif full?
      return true
    else
      return false
    end

  end

  def winner

    if !won?
      return nil
    end


    winning_array = won?

    return @board[winning_array[0]]

  end

  def play
    while !over?
      turn
    end

    puts "Congratulations #{winner}!" if !draw?
    puts "Cats Game!" if draw? 


  end

end