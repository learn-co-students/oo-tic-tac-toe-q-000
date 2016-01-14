class TicTacToe

  def initialize(board = nil)
  	 @board = board || Array.new(9," ")
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [6,4,2],
    [0,4,8],
    [0,3,6],
    [1,4,7],
    [2,5,8]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, team = "X")
    position = position.to_i-1
    @board[position] = team 
  end

  def position_taken?(position)
    if @board[position] == " "  
      false
    elsif @board[position] == nil
      false  
    elsif @board[position] == ""
      false   
    else 
      true
    end    
  end
  
  def valid_move?(position)
  	position = position.to_i-1 
  	if position.between?(0,8) && !position_taken?(position)
  	  true
  	else
  	  false
  	end
  end

  def turn 
  	puts "Please Enter 1-9"
  	position = gets.chomp
  	if valid_move?(position)
  	  team = current_player
 	  move(position,team)
 	else 
 	  turn
 	end 
 	display_board
  end

  def turn_count 
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player 
  	turn_count % 2 == 0 ? "X" : "O"
  end 

  def won?
  	WIN_COMBINATIONS.each do |win|
  	  win_combo1 = @board[win[0]]
  	  win_combo2 = @board[win[1]]
  	  win_combo3 = @board[win[2]]

  	  if (win_combo1 == "X" && win_combo2 == "X" && win_combo3 == "X") || (win_combo1 == "O" && win_combo2 == "O" && win_combo3 == "O")
  	    return win
  	  else 
  	  	false
  	  end
  	end
  	return false
  end

  def full?
    @board.none?{|i| i == " "}
  end

  def draw? 
    if !won? && full?
      true
    elsif !won? && !full?
      false
    end   
  end

  def over? 
    if won? || full? || draw?
      true 
    else 
      false
    end
  end

  def winner
    if won? !=false 
      victory = won?
      if @board[victory[0]] == "X"
      	"X"
      else
      	"O"
      end 
    end
  end

  def play
    until over? 
      turn
      display_board
    end

    if won? 
      victory = winner	
      puts "Congratulations #{victory}!"
    elsif draw?
      puts "Cats Game!"
    end
  end 

end