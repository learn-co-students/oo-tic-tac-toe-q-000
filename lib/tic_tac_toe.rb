class TicTacToe

  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 4, 8], [0, 3, 6], [1, 4, 7], [6, 4, 2], [2, 5, 8]]


  def initialize
    @board = Array.new(9, " ")
  end


  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def valid_move?(position)
    return false if position =~ /(\D|\s)/
    position = position.to_i - 1
    if (@board[position] == " ")
      return true
    else
      return false
    end
  end

  def position_taken?(position)
    if (@board[position] == " ")
      return false
    end
    return true
  end

  def move(position,xoro="X")
    @board[position.to_i - 1] = xoro
  end

  def turn
    puts "Please enter 1-9:"
    choice = gets.chomp
    valid = valid_move?(choice)
    if valid == false
      puts "Invalid input.  Please try that again!"
      choice = gets.chomp
      move(choice,current_player)
      display_board
    else
      move(choice,current_player)
      display_board
    end
  end

  def turn_count
    @board.select{|element| (element == "X" || element == "O")}.count
  end

  def current_player
    @board.count{|token| token == "X"} > @board.count{|token| token == "O"} ? "O" : "X"
  end

  def full?
    @board.include?(" ") ? false : true
  end

  def draw?
    return false if won?
    return true if full?
  end

  def won?
    TicTacToe::WIN_COMBINATIONS.each do |win_combination|
      position_1 = @board[win_combination[0]]
      position_2 = @board[win_combination[1]]
      position_3 = @board[win_combination[2]]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      end
    end
    #if no win_combination has been returned, it's a blank board or a draw.
    return false
  end

  def over?
    if (won? || draw?)
      return true
    else
      return false
    end
  end

  def winner
    if won?
      winner = won?
      winner = @board[winner[0]]
    else
      return nil
    end
  end

  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    end

    if draw?
      puts "Cats Game!"
    end
  end

end
