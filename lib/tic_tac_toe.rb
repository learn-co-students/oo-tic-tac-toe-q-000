class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9) { " " }
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

  def move(position, char = "X")    
    @board[position.to_i - 1] = char
  end

  def position_taken?(position)
    num = position.to_i
    @board[num] != " " && @board[num] != ""
  end

  def valid_move?(position)
    num = position.to_i
    num.between?(1, 10) && !(position_taken?(num-1)) && num.to_s == position
  end

  def turn
    puts "Please enter 1-9:"
    position = gets.strip
    
    if valid_move?(position)
        move(position, char = current_player)
        display_board
      else 
        puts "#{position} is not a valid move."
        turn
    end   
  end

  def turn_count
    @board.count {|i| i != " "}
  end

  def current_player
    if turn_count.even?
      char = "X"
    else 
      char = "O"
    end 
  end

  def won?    
    WIN_COMBINATIONS.detect do |win|
        @board[win[0]] == @board[win[1]] && @board[win[1]] ==  @board[win[2]] && position_taken?(win[0])
    end    
  end

  def full?
    @board.all? {|position| position != " "}
  end

  def draw?
  !won? && full?  
  end

  def over?
    won? || draw?
  end

  def winner
    if won?
      winner = @board[won?[0]]
    end
  end

  def play
    while !draw? && !over?
      turn
    end
    if winner
      puts winner == "X" ? "Congratulations X!" : "Congratulations O!"
      elsif draw?
        puts "Cats Game!"
    end  
  end

end