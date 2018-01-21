class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9," ")
  end

  def display_board
  
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "

  end

WIN_COMBINATIONS = [
    [0,1,2], #Top row
    [3,4,5], #Middle row
    [6,7,8], #Bottom row
    [0,3,6], #Left column
    [1,4,7], #Middle column
    [2,5,8], #Right column
    [0,4,8], #Diagonal 1
    [6,4,2]#Diagonal 2
    ]
  def move(pos,char = "X")

    pos = pos.to_i - 1

    def update_array_at_with(array,position,value)
    array[position] = value
    end
    
   update_array_at_with(@board,pos,char)
   
  end

  def position_taken?(position)
    (@board[position] != " ") && (@board[position] != "") && (@board[position] != nil)
  end  

  def valid_move?(position)
  
    if position.to_i.between?(1,9) && !position_taken?(position.to_i-1) 
    return true
    end
  end

  def turn
    puts "Please enter 1-9:"
    position = gets.strip
  
    while !valid_move?(position)
      puts "invalid move, please enter again"
      position=gets.strip
    end 
    move(position,char = current_player)
    display_board
  end

  def turn_count
    counter = 0
    @board.each do |position|
      if position != " " 
      counter += 1
      end
    end
    return counter
  end

  def current_player
    turn_count
    if turn_count%2==0 
      return "X"
    else
      return "O"
    end    

  end  

  def won?
  
    WIN_COMBINATIONS.detect do |win_combo|

      @board[win_combo[0]] == @board[win_combo[1]] &&
      @board[win_combo[1]] == @board[win_combo[2]] &&
      position_taken?(win_combo[0])

    end
  end

  def full?
    if @board.all?{|taken| taken != " "}
      return true
    end
  end

  def draw?
    if full? && !won?
      return true
    end
  end

  def over? 
    if full?|| won? || draw?
      return true
    end
  end

  def winner
    if won?
      return @board[won?[0]]
    end
  end

  def play
    until over?
      turn
    end
    
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
    
  end

end
