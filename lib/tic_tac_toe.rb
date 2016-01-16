class TicTacToe

  def initialize(board=nil, token=nil)
    #@token = token == "X" or "O"
    @board = board || Array.new(9, " ")
    #@posit = posit.to_i - 1

  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ]

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count {|token| token == "X" or token == "O"}
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def position_taken?(posit=nil)
    @posit = posit.to_i
    if @board[posit] == "X" or @board[posit] == "O"
      return true
    else
      return false
    end
  end

  def full?
    @board.none?{|i| i == " " }
  end

  def move(posit=nil, token=nil)
    @board[posit.to_i - 1] = current_player
  end
  
  def valid_move?(posit=nil)
    @posit = posit.to_i - 1
    if position_taken?(@posit) == false && @posit.between?(0, 8) == true
      return true
    else
      return false
    end
  end

  def turn(posit=nil)
    puts "Please enter 1-9:"
    posit = gets.strip
    
    if valid_move?(posit) == true
      move(posit, current_player)
    else
      turn
    end
    display_board
  end
  
  def won?
    WIN_COMBINATIONS.each do |combo|
      combo_chars = [@board[combo[0]], @board[combo[1]], @board[combo[2]]]
      if combo_chars.all? {|char| char== "X"} or combo_chars.all? {|char| char == "O"}
        return true
      end
    end
    return false
  end

  def draw?
    if full? == true && won? == false
      return true
    end 
    return false
  end

  def over?
    if draw? == true
      return true
    elsif won? == true
      return true
    else
      return false
    end
  end

  def winner
    if won? == false
      return nil
    end

    WIN_COMBINATIONS.each do |combo|
      combo_chars = [@board[combo[0]], @board[combo[1]], @board[combo[2]]]
      if combo_chars.all? {|char| char == "X" }
        return "X"
      end

      if combo_chars.all? {|char| char == "O" }
        return "O"
      end
    end
  end

  def play

    while !over?
        turn
    end
    if won? == true
      if winner == "X"
        puts "Congratulations X!"
      elsif winner == "O"
        puts "Congratulations O!"
      end
    elsif draw? == true
      puts "Cats Game!"
    end
  
  end

end

