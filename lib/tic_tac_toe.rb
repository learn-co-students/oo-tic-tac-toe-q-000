class TicTacToe

  def initialize(board = Array.new(9, " "))
    @board = board
  end

  def board=(board)
    @board = board
  end

  def board
    @board
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

  def move(position, player = "X")
    @board[position.to_i-1] = player
  end

  def position_taken?(position)
  
    if @board[position] == " " || @board[position] == "" || 
      @board[position] == nil
      false
    elsif @board[position] == "X" || @board[position] == "O"
      true 
    end
  end

  def valid_move?(position)
    position = position.to_i-1
    if position_taken?(position) == false
      if position.between?(0, 8) 
        true
      else
        false  
      end
    else
      false
    end
  end

  def turn
    puts "Please enter 1-9:"
    position = gets.strip
      if !valid_move?(position) 
        turn
      else
        move(position, current_player)
      end
    display_board
  end

  def turn_count
    counter = 0
    @board.each do |space|
      if space == "X" || space == "O"
        counter += 1
      end
    end
    counter
  end


  def current_player
    if turn_count.even?
      player = "X"
    else
      player = "O"
    end
  end

  def won?
    win = WIN_COMBINATIONS.find do |win_combination|
      @board[win_combination[0]] == "X" && 
      @board[win_combination[1]] == "X" && 
      @board[win_combination[2]] == "X" ||
      @board[win_combination[0]] == "O" &&
      @board[win_combination[1]] == "O" &&
      @board[win_combination[2]] == "O"
    end
    if win 
      win
    else
      false
    end
  end


  def full?
    @board.none? {|position| position == " "}
  end

  def draw?
    if won? == false && full? == true
      true
    elsif won? == false && full? == false
      false
    elsif won? == true
      false
    end
  end

  def over?
    if won? == true || full? == true || draw? == true
      true
    else
      false
    end
  end

  def winner
    if won? != false
      WIN_COMBINATIONS.each do |win_combination|
        if @board[win_combination[0]] == "X" && 
          @board[win_combination[1]] == "X" &&
          @board[win_combination[2]] == "X" 
          return "X"
        elsif @board[win_combination[0]] == "O" && 
          @board[win_combination[1]] == "O" &&
          @board[win_combination[2]] == "O" 
          return "O"
        end
      end
    else
      nil
    end
  end

  def play
    until over? == true || won? != false 
      turn
    end
    if won? != false
      puts "Congratulations #{winner}!"
    else
      puts "Cats Game!"
    end
  end
end