class TicTacToe
  def initialize
    @board=Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

  def move(location, token)
    @board[location.to_i-1] = token
  end

  def position_taken?(location)
    if @board[location]=="" || @board[location] ==" " || @board[location] == nil
      return false
    else
      return true
    end
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
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

  def current_player
    if turn_count.odd? 
      return "O"
    else
      return "X"
    end
  end 

  def turn_count
    counter = 0
    @board.each do |move|
      if move == "X" || move == "O"
        counter += 1
      end
    end
    counter
  end
  


  def won?
    WIN_COMBINATIONS.detect do |win_combinations|
      @board[win_combinations[0]] == @board[win_combinations[1]] &&
      @board[win_combinations[1]] == @board[win_combinations[2]] &&   
      position_taken?(win_combinations[0])
    end
  end

  def full?
    @board.all?{|move| move == "X" || move == "O"}
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    if !won?
      return nil
    else
      return @board[won?[0]] 
    end
  end

  def play
    while !over? && !draw? && !won?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end
end
